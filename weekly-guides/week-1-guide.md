# Week 1: EKS & Hello World

**Goal:** Deploy containerized FastAPI app to AWS EKS with health checks

**Time:** 10-15 hours  
**Cost:** ~$10-20  

## This Week's Journey

You'll go from local Docker container to production EKS cluster!

### Phase 1: Containerization (Days 1-2)
- ✅ Build optimized Docker image
- ✅ Implement health checks
- ✅ Test locally with docker-compose
- ✅ Run unit tests in container

### Phase 2: AWS EKS (Days 3-4)
- ✅ Create EKS cluster (eksctl)
- ✅ Configure kubectl access
- ✅ Push image to ECR
- ✅ Deploy to Kubernetes

### Phase 3: CI/CD Foundation (Days 5-6)
- ✅ GitHub Actions workflow
- ✅ Automated testing
- ✅ Container security scanning
- ✅ Build badges

### Phase 4: Documentation (Day 7)
- ✅ Take screenshots
- ✅ Document learnings
- ✅ Update portfolio README

## Key Learnings

**Docker:**
- Multi-stage builds reduce image size
- Non-root users improve security
- Health checks enable monitoring
- .dockerignore speeds up builds

**Kubernetes:**
- Deployments manage ReplicaSets
- Services expose pods
- Liveness vs Readiness probes
- Labels and selectors

**AWS EKS:**
- Control plane is managed by AWS
- Node groups run your workloads
- IAM integration for permissions
- VPC networking basics

## Success Criteria

By end of week:
- [ ] Docker image < 200MB
- [ ] App runs as non-root user
- [ ] Unit tests passing
- [ ] EKS cluster operational
- [ ] 2 pod replicas running
- [ ] Health checks responding
- [ ] CI workflow passing
- [ ] Evidence documented

## Cost Tracking

Track daily in your journal:
```
Day 1: $0 (local only)
Day 2: $0 (local only)
Day 3: $X (created EKS)
Day 4: $X (cluster running)
Day 5: $X
Day 6: $X
Day 7: $X

Total Week 1: $__
```

## Getting Help from Claude

### Start of Week
```
Hi Claude! Starting Week 1 of Reliability Lab.

Goal: Deploy FastAPI app to EKS

Current status:
- Template cloned
- Local environment ready
- AWS credentials configured

What's the first task I should tackle?
```

### During Week
```
I'm stuck on [specific issue]

Context:
[What you're trying to do]

Error:
[Error message]

What I've tried:
[Your attempts]

Help me debug this.
```

### End of Week
```
Week 1 complete! Here's what I built:
[List accomplishments]

Challenges I faced:
[List challenges]

Help me:
1. Review my work
2. Identify improvements
3. Prepare for Week 2
```

## Detailed Task Breakdown

For the complete step-by-step guide, see your template repository:
`reliability-lab/docs/lab-roadmap/week-01-eks-hello-world.md`

This weekly guide provides high-level overview and coaching.

## Common Issues

**Docker build slow:**
- Add .dockerignore
- Use layer caching
- Multi-stage build

**EKS cluster creation fails:**
- Check AWS permissions
- Verify region availability
- Check VPC limits

**Pods won't start:**
- Check image pull secrets
- Verify node capacity
- Review pod events

**LoadBalancer pending:**
- Wait 2-3 minutes
- Check security groups
- Verify subnet tags

## Week 1 Wins

Celebrate these milestones:
- 🎉 First container built
- 🎉 App runs in Docker
- 🎉 EKS cluster created
- 🎉 First deployment to K8s
- 🎉 Health checks working
- 🎉 CI pipeline passing

## Journal Prompt

At end of week, reflect on:

1. **What went well?**
   - Proudest accomplishment?
   - Easiest task?

2. **What was challenging?**
   - Hardest concept?
   - Longest debug session?

3. **What did you learn?**
   - Key technical insight?
   - Unexpected discovery?

4. **Cost & Time**
   - Total AWS spend?
   - Hours invested?
   - Optimization opportunities?

5. **Next Week**
   - What are you excited about?
   - What concerns you?

Template available in: `weekly-guides/templates/journal-template.md`

## Resources

**This Week:**
- [Docker Best Practices](https://docs.docker.com/develop/dev-best-practices/)
- [EKS Getting Started](https://docs.aws.amazon.com/eks/latest/userguide/getting-started.html)
- [Kubernetes Basics](https://kubernetes.io/docs/tutorials/kubernetes-basics/)
- [FastAPI Deployment](https://fastapi.tiangolo.com/deployment/)

**Next Week Preview:**
- Terraform documentation
- AWS VPC concepts
- IAM best practices

---

**You've got this!** Take it one task at a time, ask Claude when stuck, and celebrate each win.

**End of Week 1** → Proceed to Week 2: Terraform & AWS Baseline
