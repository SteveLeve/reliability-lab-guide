# Community Tips & Tricks

Wisdom from engineers who've completed the Reliability Lab.

## Cost Optimization

### Tip: Use eksctl for Easy Scaling
```bash
# Scale down in one command
eksctl scale nodegroup --cluster=reliability-lab-dev --nodes=0 --name=ng-1

# Scale up just as easily
eksctl scale nodegroup --cluster=reliability-lab-dev --nodes=2 --name=ng-1
```

### Tip: Port-Forward Instead of LoadBalancer
During development, save $16/month:
```bash
kubectl port-forward svc/sample-app 8000:80
# Access at localhost:8000
```

### Tip: Delete Cluster on Friday
If you work weekends only, save $146/month:
```bash
# Friday evening
eksctl delete cluster --name reliability-lab-dev

# Monday morning
terraform apply  # Recreates everything
```

## Development Workflow

### Tip: Test Locally First
Before deploying to EKS:
```bash
# Test with docker-compose
docker compose up

# Verify it works
curl localhost:8000/health

# Then deploy to EKS
kubectl apply -k deploy/k8s/overlays/dev/
```

### Tip: Use K9s for Cluster Management
Install K9s for a terminal UI:
```bash
brew install k9s  # or other platform
k9s
```

Much faster than kubectl for exploration!

### Tip: Alias Common Commands
Add to your .bashrc/.zshrc:
```bash
alias k='kubectl'
alias kgp='kubectl get pods'
alias kgd='kubectl get deployments'
alias kgs='kubectl get services'
alias kdp='kubectl describe pod'
alias klf='kubectl logs -f'
```

## Kubernetes

### Tip: Always Set Resource Limits
Prevents one pod from hogging resources:
```yaml
resources:
  requests:
    memory: "128Mi"
    cpu: "100m"
  limits:
    memory: "256Mi"
    cpu: "200m"
```

### Tip: Use kubectl explain
Built-in documentation:
```bash
kubectl explain deployment.spec
kubectl explain pod.spec.containers
```

### Tip: Dry-Run Changes
Test before applying:
```bash
kubectl apply -f deployment.yaml --dry-run=client
# or
kubectl apply -f deployment.yaml --dry-run=server
```

## AWS

### Tip: Tag Everything
Makes cost tracking easy:
```hcl
tags = {
  Project     = "reliability-lab"
  Week        = "1"
  Environment = "dev"
  ManagedBy   = "terraform"
}
```

### Tip: Use AWS Cost Explorer Tags
Filter costs by tag:
```bash
aws ce get-cost-and-usage \
  --time-period Start=2025-10-01,End=2025-10-31 \
  --granularity MONTHLY \
  --metrics UnblendedCost \
  --group-by Type=TAG,Key=Project
```

### Tip: Set Up AWS CLI Profiles
Separate personal and lab:
```bash
aws configure --profile reliability-lab
export AWS_PROFILE=reliability-lab
```

## Claude AI

### Tip: Be Specific in Questions
Bad: "Help with Kubernetes"
Good: "Explain why my HPA isn't scaling above 2 replicas"

### Tip: Paste Error Messages
Include full context:
```
I'm getting this error when deploying:

[paste kubectl describe pod output]

[paste kubectl logs output]

Help me debug.
```

### Tip: Ask for Code Review
```
Review this Terraform module for:
- Security issues
- Cost optimization
- Best practices

[paste code]
```

## Documentation

### Tip: Screenshot Everything
Take screenshots as you go:
- Working deployments
- Cost dashboard
- Architecture diagrams
- Error messages (for later debugging)

### Tip: Document Decisions
Create ADRs (Architecture Decision Records):
```markdown
# ADR 001: Use CloudWatch Instead of Datadog

## Context
Need observability solution for learning lab.

## Decision
Use CloudWatch instead of Datadog.

## Consequences
- Pros: Free tier, AWS native, cost-effective
- Cons: Less features, steeper learning curve

## Date
2025-10-15
```

### Tip: Keep a Daily Log
Just a few bullets each day:
- What you worked on
- Challenges faced
- Wins achieved
- Cost so far

Makes writing final case study much easier!

## Time Management

### Tip: Work in Focused Blocks
- Morning: Study and plan (1-2 hours)
- Afternoon: Implement (2-3 hours)
- Evening: Document and clean up (30 min)

### Tip: Don't Rush
It's okay to take 8 weeks instead of 6. Learning is the goal, not speed.

### Tip: Celebrate Small Wins
- First pod deployed? 🎉
- CI passing? 🎉
- Week complete? 🎉

Motivation matters!

## Troubleshooting

### Tip: Check Events First
```bash
kubectl get events --sort-by='.lastTimestamp'
```

### Tip: Logs Are Your Friend
```bash
# Follow logs
kubectl logs -f deployment/sample-app

# Previous container logs
kubectl logs pod-name --previous
```

### Tip: Describe Everything
```bash
kubectl describe pod pod-name
kubectl describe deployment deployment-name
kubectl describe node node-name
```

## Week-Specific Tips

### Week 1
- Don't worry about getting IAM perfect, Week 2 fixes it
- Use eksctl over manual setup
- Test docker-compose before EKS

### Week 2
- Start with simple Terraform, refactor later
- Use modules from registry as examples
- Remote state setup is worth the time

### Week 3
- HPA won't work without metrics-server
- Test IRSA thoroughly before moving on
- PDBs prevent all pods being down during updates

### Week 4
- GitHub secrets are environment-specific
- Test rollback procedures immediately
- Use GitHub Actions cache for faster builds

### Week 5
- Start simple with CloudWatch
- Define SLOs before implementing
- Alert fatigue is real - start with few alerts

### Week 6
- Small chaos experiments first
- Document everything during incident
- Blameless postmortems focus on systems, not people

## Share Your Tips!

Found something helpful? Add it here:
1. Fork the repo
2. Add your tip
3. Submit PR

Your future self (and others) will thank you!
