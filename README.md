# Reliability Lab Setup Guide

**Your AI-assisted companion for mastering platform engineering**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

> This repository guides you through setting up and completing the [Reliability Lab Template](https://github.com/SteveLeve/reliability-lab-template) - a 6-8 week hands-on platform engineering learning journey with Claude AI as your mentor.

---

## 🎯 What is This?

This is the **setup guide and coaching companion** for the Reliability Lab. It helps you:

✅ Configure Claude AI as your personal SRE mentor  
✅ Set up your development environment  
✅ Navigate the 8-week learning path  
✅ Track your progress and learnings  
✅ Join a community of fellow learners

## 🚀 Quick Start

### Prerequisites

Before starting, ensure you have:
- [ ] AWS account (personal tier is fine)
- [ ] GitHub account
- [ ] Claude.ai account
- [ ] Basic tools installed (Git, Docker, AWS CLI, kubectl, Terraform)

**Verify prerequisites:** Run `scripts/check-prerequisites.sh`

### Step 1: Create Your Reliability Lab

Use the template to create your lab repository:

1. Go to [reliability-lab-template](https://github.com/SteveLeve/reliability-lab-template)
2. Click **"Use this template"**
3. Name your repository (e.g., `my-reliability-lab`)
4. Clone your new repository locally

### Step 2: Configure Claude AI Project

Follow the complete guide in [docs/setup-steps/02-configure-claude.md](docs/setup-steps/02-configure-claude.md)

**Quick version:**
1. Create new Claude Project: "Reliability Lab"
2. Add custom instructions from [`claude-project/custom-instructions.md`](claude-project/custom-instructions.md)
3. Upload knowledge files from [`claude-project/knowledge-files/`](claude-project/knowledge-files/)

### Step 3: Complete Setup

Follow the setup steps in order:
1. [Prerequisites](docs/setup-steps/00-prerequisites.md)
2. [Clone Template](docs/setup-steps/01-clone-template.md)
3. [Configure Claude](docs/setup-steps/02-configure-claude.md)
4. [AWS Setup](docs/setup-steps/03-aws-setup.md)
5. [Verify Setup](docs/setup-steps/04-verify-setup.md)

### Step 4: Start Week 1!

Begin your journey with [Week 1: EKS & Hello World](weekly-guides/week-1-guide.md)

---

## 📚 What You'll Build

**8-Week Learning Path:**

| Week | Focus | Time | Cost |
|------|-------|------|------|
| 1 | EKS & Containerization | 10-15h | $10-20 |
| 2 | Terraform & AWS Baseline | 10-15h | $15-20 |
| 3 | Kubernetes Hardening | 10-15h | $15-20 |
| 4 | CI/CD Pipeline | 10-15h | $15-20 |
| 5 | Observability | 10-15h | $15-20 |
| 6 | Chaos Engineering | 10-15h | $15-20 |
| 7-8 | Polish & Portfolio | 15-20h | $5-10 |

**Total:** 75-110 hours, $90-180 investment

**By completion, you'll have:**
- ✅ Production-grade EKS cluster
- ✅ Full CI/CD pipeline
- ✅ Comprehensive observability
- ✅ Portfolio-ready case study
- ✅ Demonstrable platform engineering skills

---

## 🤖 Claude AI as Your Mentor

This lab is designed to work with Claude AI as your personal mentor. Claude will:

- **Explain concepts** when you encounter new material
- **Guide you step-by-step** through implementations
- **Troubleshoot issues** with you
- **Recommend best practices** 
- **Keep you cost-conscious**

The custom instructions in this repo configure Claude to understand:
- Your learning style and experience level
- Cost optimization strategies
- Security-first approaches
- AWS Well-Architected principles

---

## 📖 Repository Structure

```
reliability-lab-setup-guide/
├── README.md (this file)
├── docs/
│   ├── setup-steps/          # Step-by-step setup
│   └── prerequisites/         # Tool installation guides
├── claude-project/
│   ├── custom-instructions.md # Claude AI configuration
│   ├── knowledge-files/       # Files to upload to Claude
│   └── sample-prompts.md      # Good prompts to use
├── weekly-guides/
│   ├── week-1-guide.md        # Weekly coaching
│   ├── templates/             # Journal templates
│   └── journal/               # Your progress (gitignored)
├── scripts/
│   ├── check-prerequisites.sh # Verify setup
│   └── verify-aws-setup.sh    # AWS configuration check
└── community/
    ├── FAQ.md                 # Common questions
    ├── TIPS.md                # Community wisdom
    └── CONTRIBUTING.md        # How to contribute
```

---

## 💡 How to Use This Guide

### Option 1: AI-Assisted (Recommended)

1. **Setup Phase** (Week 0): Follow setup-steps to configure Claude
2. **Learning Phase** (Weeks 1-8): Work with Claude in your project
3. **Reflection Phase** (Weekly): Use journal templates to document learnings

### Option 2: Self-Guided

Skip Claude configuration and follow the guides independently. You'll still get:
- Step-by-step instructions
- Weekly coaching content
- Community support

---

## 🎓 Weekly Workflow

**Recommended pattern:**

**Monday-Tuesday:** Study + Local Development
- Read week's guide in setup-guide repo
- Ask Claude to explain new concepts
- Test locally with docker-compose

**Wednesday-Thursday:** AWS Implementation
- Deploy to EKS with Claude's guidance
- Configure infrastructure
- Verify deployment

**Friday-Saturday:** CI/CD + Hardening
- Set up pipelines
- Security scanning
- Performance testing

**Sunday:** Documentation + Review
- Fill out weekly journal
- Take screenshots for portfolio
- Plan next week with Claude

---

## 🆘 Getting Help

### Claude AI Project
Your primary resource! Ask:
- Concept questions: "Explain HPA and when to use it"
- Implementation: "Help me write a Terraform module for VPC"
- Debugging: "My pod won't start, help me debug"
- Best practices: "Review my Kubernetes manifests"

### Community
- **Discussions**: Ask questions, share progress
- **Issues**: Report problems with the guide
- **FAQ**: Check [community/FAQ.md](community/FAQ.md)

### External Resources
- [AWS EKS Docs](https://docs.aws.amazon.com/eks/)
- [Kubernetes Docs](https://kubernetes.io/docs/)
- [Terraform Docs](https://www.terraform.io/docs)
- [Google SRE Book](https://sre.google/books/)

---

## 📝 Documenting Your Journey

Use the weekly journal templates to track:
- What you built each week
- Challenges you faced
- Solutions you found
- Costs incurred
- Key learnings

These become:
- Portfolio content
- Blog post drafts  
- LinkedIn posts
- Case study material

Templates in: [`weekly-guides/templates/`](weekly-guides/templates/)

---

## 🎯 Success Criteria

You'll know you're successful when:

**Technical:**
- ✅ EKS cluster running production patterns
- ✅ Full CI/CD pipeline functional
- ✅ Observability dashboards showing real metrics
- ✅ Chaos experiments documented
- ✅ All code in version control

**Portfolio:**
- ✅ Public GitHub repository
- ✅ Architecture diagrams
- ✅ Case study written
- ✅ Evidence screenshots
- ✅ Professional documentation

**Skills:**
- ✅ Confident with Kubernetes concepts
- ✅ Comfortable with Terraform
- ✅ Understanding of SRE principles
- ✅ Capable of debugging production issues

---

## 🤝 Contributing

Found something unclear? Have a suggestion? Contributions welcome!

See [community/CONTRIBUTING.md](community/CONTRIBUTING.md)

---

## 📞 Support

- **Setup issues**: Check [docs/setup-steps/](docs/setup-steps/)
- **Learning questions**: Ask Claude in your project
- **Community**: Use GitHub Discussions
- **Bugs**: Create an issue

---

## ⚖️ License

MIT License - see [LICENSE](LICENSE) for details

---

## 🙏 Acknowledgments

This learning path is inspired by:
- Google SRE Book
- AWS Well-Architected Framework
- Kubernetes Best Practices
- Real-world production experience

---

**Ready to become a platform engineer?** Start with [Prerequisites](docs/setup-steps/00-prerequisites.md)

**Questions?** Check the [FAQ](community/FAQ.md)

**Version:** 1.0  
**Last Updated:** 2025-11-01  
**Maintained by:** [SteveLeve](https://github.com/SteveLeve)
