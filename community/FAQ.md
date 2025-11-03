# Frequently Asked Questions

## Getting Started

### Q: Do I need prior Kubernetes experience?
**A:** No! This lab teaches K8s from basics to production patterns. Docker experience helps but isn't required.

### Q: How much will this cost?
**A:** $90-180 total if you follow cost optimization practices. Week 1 alone is ~$10-20.

### Q: Can I pause between weeks?
**A:** Yes! Delete your EKS cluster between weeks to avoid charges. Terraform makes recreation easy.

### Q: Do I need Claude AI or can I do this self-guided?
**A:** Both work! Claude accelerates learning and provides guidance, but all documentation is available for self-study.

## Technical Questions

### Q: Why FastAPI instead of Go/Node.js?
**A:** FastAPI is beginner-friendly and popular in the SRE space. The patterns apply to any language.

### Q: Can I use GCP/Azure instead of AWS?
**A:** The guide is AWS-specific, but the concepts translate. You'd need to adapt the IaC and services.

### Q: What if I already know Kubernetes?
**A:** Skip to Week 3 or 5! Focus on observability, chaos engineering, or portfolio polish.

### Q: How do I handle AWS Free Tier limits?
**A:** EKS isn't free tier eligible. Budget $10-20/week. Use t3.small nodes and scale aggressively.

## Troubleshooting

### Q: My EKS cluster won't create
**Check:**
- AWS permissions (need admin or EC2/EKS/VPC full)
- VPC limits (max 5 per region)
- Region service availability
- CloudFormation stack events

### Q: Pods are stuck in Pending
**Check:**
- Node capacity: `kubectl describe nodes`
- Resource requests vs available
- Node selectors or taints
- Events: `kubectl describe pod <name>`

### Q: GitHub Actions failing
**Check:**
- Secrets configured correctly
- GITHUB_TOKEN permissions
- Workflow syntax (YAML indentation)
- Action versions (use @v4 not @master)

### Q: High AWS costs
**Immediate actions:**
- Scale nodes to 0
- Delete LoadBalancers
- Check for orphaned EBS volumes
- Review Cost Explorer by service

## Claude AI

### Q: Claude doesn't remember our conversation
**A:** Ensure you're using Claude Projects, not just chats. Projects maintain context.

### Q: Claude's answers are too generic
**A:** Check custom instructions are loaded. Provide more context in your questions.

### Q: Can I use ChatGPT instead?
**A:** Yes, but you'll need to provide the context manually each session. Claude Projects are designed for this workflow.

## Portfolio & Career

### Q: Is this enough for an SRE job?
**A:** Combined with other experience, yes! This demonstrates hands-on skills. Add to it with contributions to open source.

### Q: Should I make my repo public?
**A:** Yes! Public repos are better for portfolio. Just don't commit secrets.

### Q: How do I write about this for job applications?
**A:** Focus on:
- Problems solved
- Technologies used
- Metrics improved
- Production patterns applied

### Q: Can I add this to LinkedIn?
**A:** Absolutely! Add as a project with:
- Technologies: AWS, EKS, Terraform, Python, CI/CD
- Description: "6-week hands-on reliability engineering lab"
- Link to GitHub repo

## Cost Management

### Q: Can I do this for free?
**A:** Not entirely. EKS control plane is ~$73/month. Minimum realistic cost is ~$50-100 for the full lab.

### Q: What if I go over budget?
**A:** Delete everything immediately:
```bash
eksctl delete cluster --name reliability-lab-dev
terraform destroy
```

### Q: Are there alternatives to EKS?
**A:** For learning, yes (Minikube, Kind). For portfolio demonstration, EKS shows production AWS experience.

## Community

### Q: Can I contribute to the template?
**A:** Yes! PRs welcome. See CONTRIBUTING.md.

### Q: Is there a Discord/Slack?
**A:** Check Discussions tab for community chat links.

### Q: Can I blog about my experience?
**A:** Please do! Tag the original template so others can find it.

## Technical Deep Dives

### Q: Why IRSA instead of storing AWS credentials?
**A:** IRSA provides:
- Automatic credential rotation
- Fine-grained permissions per pod
- No secrets in code/env vars
- Audit trail via CloudTrail

### Q: What's the difference between Deployment and StatefulSet?
**A:** 
- Deployment: Stateless apps, any pod is interchangeable
- StatefulSet: Stateful apps, pods have identity (databases, etc.)

### Q: When should I use HPA vs VPA?
**A:**
- HPA: Scale pod count (horizontal)
- VPA: Scale pod resources (vertical)
- Use HPA for web apps, VPA for resource tuning

### Q: Why Terraform over CloudFormation?
**A:**
- Multi-cloud support
- Better syntax (HCL)
- Larger community
- More modules available

## Next Steps

**Didn't find your answer?**
1. Search existing Discussions
2. Check template repository docs
3. Ask Claude in your Project
4. Create new Discussion

**Want to add a question?**
PR this file with your FAQ addition!
