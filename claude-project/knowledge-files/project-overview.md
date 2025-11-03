# Reliability Lab - Project Overview

## What is the Reliability Lab?

A 6-8 week hands-on learning journey through modern reliability and platform engineering practices, designed to be completed with AI assistance.

## Learning Path

### Week 1: EKS & Hello World
**Goal:** Deploy containerized FastAPI app to AWS EKS

**Key Learnings:**
- Docker multi-stage builds
- Container security (non-root, scanning)
- Kubernetes basics (Deployments, Services)
- AWS EKS fundamentals
- Health check patterns (liveness vs readiness)

**Deliverables:**
- Running EKS cluster
- Deployed application with 2 replicas
- Working health checks via LoadBalancer

**Cost:** ~$10-20

### Week 2: Terraform & AWS Baseline
**Goal:** Convert infrastructure to code with Terraform

**Key Learnings:**
- Infrastructure as Code principles
- Terraform modules and state management
- AWS VPC networking (subnets, NAT, IGW)
- IAM roles and policies (least-privilege)
- S3/DynamoDB remote state

**Deliverables:**
- Complete Terraform infrastructure
- IAM roles properly scoped
- Remote state configured

**Cost:** ~$15-20

### Week 3: Kubernetes Hardening
**Goal:** Add production-grade K8s patterns

**Key Learnings:**
- Horizontal Pod Autoscaler (HPA)
- Pod Disruption Budgets (PDB)
- IRSA (IAM Roles for Service Accounts)
- Resource requests and limits
- Network policies

**Deliverables:**
- Auto-scaling application
- High availability configuration
- Secure AWS service access

**Cost:** ~$15-20

### Week 4: CI/CD Pipeline
**Goal:** Full automation from commit to deployment

**Key Learnings:**
- GitHub Actions workflows
- Container scanning with Trivy
- Automated testing
- Blue-green or canary deployments
- Rollback procedures

**Deliverables:**
- Working CI/CD pipeline
- Automated deployments on merge
- Security scanning in place

**Cost:** ~$15-20

### Week 5: Observability
**Goal:** Comprehensive monitoring and alerting

**Key Learnings:**
- CloudWatch Logs, Metrics, Traces
- SLIs (Service Level Indicators)
- SLOs (Service Level Objectives)
- Error budgets
- Alert design and hygiene

**Deliverables:**
- Monitoring dashboard
- Defined SLOs
- Actionable alerts
- Log aggregation

**Cost:** ~$15-20

### Week 6: Chaos & Postmortem
**Goal:** Test reliability through controlled failure

**Key Learnings:**
- Chaos engineering principles
- Failure injection techniques
- Incident response
- Root Cause Analysis (RCA)
- Blameless postmortems

**Deliverables:**
- Chaos experiment results
- Written postmortem
- Improved safeguards

**Cost:** ~$15-20

### Weeks 7-8: Polish & Portfolio
**Goal:** Create showcase-ready documentation

**Key Learnings:**
- Technical writing
- Architecture diagrams (C4 model)
- Case study structure
- Portfolio presentation

**Deliverables:**
- Complete case study
- Architecture diagrams
- Public documentation
- Evidence screenshots

**Cost:** ~$5-10

## Total Investment

**Time:** 75-110 hours over 6-8 weeks (10-15 hours/week)
**Cost:** $90-180 total (with optimization)
**Skills Gained:** Production-grade platform engineering

## Architecture Evolution

### Week 1
```
[GitHub] → [EKS Cluster] → [LoadBalancer]
              ↓
         [Sample App]
```

### Week 2
```
[GitHub] → [EKS (Terraform)] → [ALB]
              ↓
         [Sample App]
              ↓
         [CloudWatch]
```

### Week 3-4
```
[GitHub Actions] → [EKS]
    (CI/CD)          ↓
                [HPA] [PDB]
                     ↓
                [Sample App + IRSA]
                     ↓
                [CloudWatch]
```

### Week 5-6
```
[GitHub Actions] → [EKS]
                     ↓
      [Sample App with SLOs]
           ↓         ↓
    [CloudWatch] [Chaos Testing]
```

## Technology Stack

**Application:**
- Language: Python 3.11
- Framework: FastAPI
- Server: Uvicorn

**Infrastructure:**
- Cloud: AWS (EKS, VPC, ALB, CloudWatch)
- IaC: Terraform
- Container: Docker

**CI/CD:**
- Platform: GitHub Actions
- Registry: GitHub Container Registry (GHCR)
- Scanning: Trivy

**Observability:**
- Logs: CloudWatch Logs
- Metrics: CloudWatch Metrics
- Traces: X-Ray (optional)

## Success Criteria

By completion, you'll have:

**Technical Artifacts:**
- ✅ Production-ready EKS cluster
- ✅ Full CI/CD pipeline
- ✅ Comprehensive observability
- ✅ Documented SLOs
- ✅ Chaos experiment results

**Portfolio Assets:**
- ✅ Public GitHub repository
- ✅ Architecture diagrams
- ✅ Case study document
- ✅ Evidence screenshots
- ✅ Professional README

**Demonstrable Skills:**
- ✅ AWS EKS management
- ✅ Infrastructure as Code
- ✅ Kubernetes production patterns
- ✅ CI/CD automation
- ✅ Observability fundamentals
- ✅ Incident response

## Key Principles

Throughout the lab, emphasize:

1. **Security First**
   - IAM least-privilege
   - No secrets in code
   - Container scanning
   - Network policies

2. **Cost Consciousness**
   - AWS Free Tier where possible
   - Scale down when not using
   - CloudWatch over paid tools
   - Monitor spending daily

3. **Production Patterns**
   - High availability
   - Auto-scaling
   - Health checks
   - Graceful degradation

4. **Documentation**
   - Architecture decisions (ADRs)
   - Runbooks
   - Postmortems
   - Portfolio-ready writing

## Common Challenges

**Week 1:** 
- EKS setup complexity
- LoadBalancer provisioning delays
- kubectl configuration

**Week 2:**
- Terraform state management
- IAM policy complexity
- VPC networking concepts

**Week 3:**
- HPA configuration
- IRSA setup
- Resource limit tuning

**Week 4:**
- GitHub Actions secrets
- Deployment strategies
- Rollback procedures

**Week 5:**
- CloudWatch query syntax
- Alert threshold tuning
- Log aggregation

**Week 6:**
- Chaos tool selection
- Measuring impact
- Writing postmortems

**Weeks 7-8:**
- Technical writing
- Diagram clarity
- Scope management

## Resources

**Official Docs:**
- AWS: https://docs.aws.amazon.com/
- Kubernetes: https://kubernetes.io/docs/
- Terraform: https://www.terraform.io/docs/

**Best Practices:**
- Google SRE Book: https://sre.google/books/
- AWS Well-Architected: https://aws.amazon.com/architecture/well-architected/
- EKS Best Practices: https://aws.github.io/aws-eks-best-practices/

**Community:**
- CNCF Slack
- AWS Forums
- r/kubernetes, r/devops
- GitHub Discussions

---

**Current Version:** 1.0
**Last Updated:** 2025-11-01
**Repository:** https://github.com/SteveLeve/reliability-lab-template
