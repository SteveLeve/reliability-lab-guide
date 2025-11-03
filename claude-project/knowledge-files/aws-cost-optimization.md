# AWS Cost Optimization Guide

## Cost Breakdown

### EKS Costs

**Control Plane:** $0.10/hour = ~$73/month
- This is unavoidable if cluster exists
- Cannot be scaled down
- Consider deleting cluster between weeks if pausing

**Worker Nodes (t3.medium × 2):**
- On-Demand: $0.0416/hour × 2 = ~$60/month (730 hours)
- Spot Instances: 60-70% savings = ~$18-24/month
- **Optimization:** Scale to 0 when not working

**Data Transfer:**
- Within AZ: Free
- Between AZs: $0.01/GB
- To internet: $0.09/GB
- **Optimization:** Keep services in same AZ

**LoadBalancer (ALB):**
- Fixed: $0.0225/hour = ~$16/month
- LCU charges: Variable based on traffic
- **Optimization:** Use port-forward during dev, ALB only for demos

**EBS Volumes:**
- gp3: $0.08/GB/month
- 50GB × 2 nodes = ~$8/month
- **Optimization:** Scales with nodes

**NAT Gateway:**
- $0.045/hour = ~$33/month
- Data processing: $0.045/GB
- **Optimization:** Use VPC endpoints for AWS services

### Estimated Monthly Costs

**Full-Time (24/7):**
```
EKS Control Plane:     $73
EC2 Nodes (2):         $60
ALB:                   $16
EBS (2 × 50GB):        $8
NAT Gateway:           $33
Data Transfer:         $5-10
──────────────────────────
Total:                 ~$195/month
```

**Optimized (Scale Down):**
```
EKS Control Plane:     $73
EC2 Nodes (160h/mo):   $10
ALB (port-forward):    $0
EBS (with nodes):      $2
NAT Gateway (minimal): $7
Data Transfer:         $1
──────────────────────────
Total:                 ~$93/month
```

**Ultra-Budget (Delete Between Weeks):**
```
Week 1 (7 days):       $25
Week 2 (7 days):       $25
Delete cluster:        $0
Week 3 (7 days):       $25
Delete cluster:        $0
...
──────────────────────────
Total (6 weeks):       ~$150
```

## Cost Optimization Strategies

### 1. Scale Nodes to Zero

**When to do:** After each work session

```bash
# Scale down to 0 nodes
eksctl scale nodegroup \
  --cluster=reliability-lab-dev \
  --name=ng-1 \
  --nodes=0 \
  --nodes-min=0

# Scale back up when needed
eksctl scale nodegroup \
  --cluster=reliability-lab-dev \
  --name=ng-1 \
  --nodes=2 \
  --nodes-min=1 \
  --nodes-max=3
```

**Savings:** ~$60/month on nodes

### 2. Use Spot Instances

**Setup in Terraform:**
```hcl
resource "aws_eks_node_group" "main" {
  capacity_type = "SPOT"
  
  instance_types = [
    "t3.medium",
    "t3a.medium",
    "t2.medium"
  ]
}
```

**Savings:** 60-70% on node costs

### 3. Delete LoadBalancer When Not Demoing

**During development:**
```bash
# Delete LoadBalancer service
kubectl delete svc sample-app

# Use port-forward instead
kubectl port-forward svc/sample-app 8000:80
```

**Savings:** ~$16/month

### 4. Use VPC Endpoints

**For S3, DynamoDB, etc.:**
```hcl
resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.main.id
  service_name = "com.amazonaws.${var.region}.s3"
  route_table_ids = [aws_route_table.private.id]
}
```

**Savings:** Reduces NAT Gateway costs

### 5. Right-Size Resources

**Use t3.small if sufficient:**
```bash
# t3.small: $0.0208/hour vs t3.medium: $0.0416/hour
# Savings: 50%
```

**Monitor actual usage:**
```bash
kubectl top nodes
kubectl top pods
```

### 6. Delete Unused Resources

**Weekly cleanup:**
```bash
# List EBS volumes
aws ec2 describe-volumes --filters "Name=status,Values=available"

# Delete unattached volumes
aws ec2 delete-volume --volume-id vol-xxxxx

# Check for orphaned load balancers
aws elbv2 describe-load-balancers

# Check for unused Elastic IPs
aws ec2 describe-addresses
```

### 7. Set Budget Alerts

**In AWS Console:**
1. Go to AWS Billing → Budgets
2. Create budget: $100/month
3. Set alerts:
   - 80% threshold: Warning
   - 100% threshold: Critical
   - 110% threshold: Action needed

**Using AWS CLI:**
```bash
aws budgets create-budget \
  --account-id $(aws sts get-caller-identity --query Account --output text) \
  --budget file://budget.json \
  --notifications-with-subscribers file://notifications.json
```

### 8. Use CloudWatch Instead of Datadog

**Comparison:**
- CloudWatch: AWS Free Tier + minimal costs
- Datadog: $15-31/host/month

**Savings:** ~$40/month

### 9. Tag Everything for Cost Tracking

```hcl
tags = {
  Project     = "reliability-lab"
  Environment = "dev"
  ManagedBy   = "terraform"
  CostCenter  = "learning"
}
```

**Track costs by tag:**
```bash
aws ce get-cost-and-usage \
  --time-period Start=2025-10-01,End=2025-10-31 \
  --granularity MONTHLY \
  --metrics UnblendedCost \
  --group-by Type=TAG,Key=Project
```

### 10. Schedule Auto-Shutdown

**Using Lambda + EventBridge:**
```python
# Scale down at 11 PM weekdays
# Scale up at 7 AM weekdays
```

## Cost Monitoring

### Daily Check

```bash
# Today's spend
aws ce get-cost-and-usage \
  --time-period Start=$(date +%Y-%m-01),End=$(date +%Y-%m-%d) \
  --granularity DAILY \
  --metrics UnblendedCost
```

### Weekly Report

```bash
# This week by service
aws ce get-cost-and-usage \
  --time-period Start=$(date -d "7 days ago" +%Y-%m-%d),End=$(date +%Y-%m-%d) \
  --granularity DAILY \
  --metrics UnblendedCost \
  --group-by Type=DIMENSION,Key=SERVICE
```

### Cost Explorer

Use AWS Cost Explorer for visual analysis:
- Daily spend trends
- Service breakdown
- Forecast next month
- Compare to budget

## Emergency Cost Reduction

If costs spike unexpectedly:

### 1. Immediate Actions

```bash
# Scale all nodes to 0
eksctl scale nodegroup --cluster=reliability-lab-dev --nodes=0 --name=ng-1

# Delete load balancers
kubectl delete svc --all

# Stop any running EC2 instances
aws ec2 stop-instances --instance-ids $(aws ec2 describe-instances \
  --filters "Name=tag:Project,Values=reliability-lab" "Name=instance-state-name,Values=running" \
  --query "Reservations[].Instances[].InstanceId" --output text)
```

### 2. Investigate

```bash
# Find most expensive resources
aws ce get-cost-and-usage \
  --time-period Start=$(date -d "yesterday" +%Y-%m-%d),End=$(date +%Y-%m-%d) \
  --granularity DAILY \
  --metrics UnblendedCost \
  --group-by Type=DIMENSION,Key=SERVICE
```

### 3. Common Culprits

- Forgotten LoadBalancers
- NAT Gateway with high data transfer
- Unattached EBS volumes
- Elastic IPs not associated
- Unused Elastic Load Balancers
- S3 with excessive PUT requests

## Cost Optimization Checklist

**Daily:**
- [ ] Scale down nodes after work
- [ ] Check current spend in Cost Explorer

**Weekly:**
- [ ] Review cost by service
- [ ] Delete unused resources
- [ ] Verify budget alerts working

**Monthly:**
- [ ] Full cost analysis
- [ ] Compare to budget
- [ ] Adjust resource sizes if needed

## Tips for This Lab

1. **Work in focused sessions:** 
   - Scale up for 3-4 hour blocks
   - Scale down immediately after

2. **Use development efficiently:**
   - Test locally with docker-compose first
   - Only deploy to EKS when needed
   - Port-forward instead of LoadBalancer

3. **Delete between long breaks:**
   - If pausing >1 week, delete cluster
   - Terraform makes recreation easy
   - Save ~$73/week on control plane

4. **Monitor religiously:**
   - Check Cost Explorer daily
   - Respond to budget alerts immediately
   - Track spend in journal

5. **Optimize progressively:**
   - Week 1: Learning mode (higher cost OK)
   - Week 2+: Apply optimizations
   - Weeks 7-8: Minimal resources for polish

---

**Target:** $90-180 for entire 6-8 week lab
**Critical:** Daily cost monitoring
**Emergency:** Scale to 0 or delete if over budget
