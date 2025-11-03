# Prerequisites

Before starting the Reliability Lab, ensure you have the required accounts and tools.

## Required Accounts

### 1. AWS Account
- Personal tier is sufficient
- Credit card required (for billing)
- Will incur ~$90-180 in charges over 6-8 weeks

**Setup:**
1. Go to https://aws.amazon.com/
2. Click "Create an AWS Account"
3. Follow signup process
4. Verify email and payment method

### 2. GitHub Account
- Free tier is sufficient
- Will host your public repository

**Setup:**
1. Go to https://github.com/signup
2. Create account
3. Verify email

### 3. Claude.ai Account
- Free tier works for this lab
- Used as your AI mentor

**Setup:**
1. Go to https://claude.ai
2. Sign up with email or Google
3. Verify account

## Required Tools

Install these on your local machine:

### Git
**Purpose:** Version control

**Check if installed:**
```bash
git --version
```

**Install:**
- **macOS:** `brew install git` or Xcode Command Line Tools
- **Linux:** `sudo apt install git` or `sudo yum install git`
- **Windows:** https://git-scm.com/download/win

### Docker Desktop
**Purpose:** Local container development

**Check if installed:**
```bash
docker --version
docker ps  # Should not error
```

**Install:**
- Download from https://www.docker.com/products/docker-desktop
- Install and start Docker Desktop
- Ensure it's running (icon in system tray)

### AWS CLI v2
**Purpose:** Interact with AWS from terminal

**Check if installed:**
```bash
aws --version  # Should show version 2.x
```

**Install:**
- **macOS:** `brew install awscli` or download from AWS
- **Linux:** https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
- **Windows:** Download MSI installer from AWS

**Configure:**
```bash
aws configure
# Enter:
# AWS Access Key ID: [from IAM user]
# AWS Secret Access Key: [from IAM user]
# Default region: us-east-1
# Default output format: json
```

### kubectl
**Purpose:** Interact with Kubernetes clusters

**Check if installed:**
```bash
kubectl version --client
```

**Install:**
- **macOS:** `brew install kubectl`
- **Linux:** https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
- **Windows:** https://kubernetes.io/docs/tasks/tools/install-kubectl-windows/

### Terraform
**Purpose:** Infrastructure as Code

**Check if installed:**
```bash
terraform --version
```

**Install:**
- **macOS:** `brew install terraform`
- **Linux:** https://www.terraform.io/downloads
- **Windows:** https://www.terraform.io/downloads

### Python 3.11+
**Purpose:** Run the sample application locally

**Check if installed:**
```bash
python3 --version
```

**Install:**
- **macOS:** `brew install python@3.11`
- **Linux:** Use system package manager
- **Windows:** https://www.python.org/downloads/

### GitHub CLI (gh)
**Purpose:** Interact with GitHub from terminal

**Check if installed:**
```bash
gh --version
```

**Install:**
- **macOS:** `brew install gh`
- **Linux:** https://github.com/cli/cli#installation
- **Windows:** `winget install GitHub.cli` or download from GitHub

**Authenticate:**
```bash
gh auth login
# Follow prompts
```

## Verification Script

Run this to check all prerequisites:

```bash
./scripts/check-prerequisites.sh
```

This will verify:
- ✅ All required tools are installed
- ✅ AWS credentials are configured
- ✅ Docker is running
- ✅ GitHub CLI is authenticated

## Cost Considerations

**Before proceeding, understand:**

- **AWS costs:** ~$90-180 for full lab
- **Week 1 only:** ~$10-20
- **Per day active:** ~$3-5 if optimized

**Set up budget alerts** immediately after AWS account creation:
1. Go to AWS Billing Console
2. Create budget: $100/month
3. Set alerts at 80%, 100%, 110%

## Next Steps

Once all prerequisites are met:
1. Proceed to [Clone Template](01-clone-template.md)
2. Or use the automated setup script
