# AWS Setup

Configure your AWS account and environment for the Reliability Lab.

## 1) Create IAM User (if using root is not desired)

Recommended: Create a dedicated IAM user with AdministratorAccess for the lab. You can scope down later in Week 2.

Steps:
1. Go to IAM → Users → Add users
2. User name: `reliability-lab-admin`
3. Access type: Programmatic access
4. Attach policy: `AdministratorAccess` (temp for lab)
5. Download credentials CSV

Store Access Key ID and Secret Access Key securely.

## 2) Configure AWS CLI

```bash
aws configure
# AWS Access Key ID: <from CSV>
# AWS Secret Access Key: <from CSV>
# Default region: us-east-1 (or your preferred)
# Default output format: json
```

Verify:
```bash
aws sts get-caller-identity
```

## 3) Set Up Budget Alerts (Highly Recommended)

In the Billing console:
1. Budgets → Create budget
2. Type: Cost budget, Monthly, $100
3. Alerts: 80%, 100%, 110%
4. Email yourself

## 4) Install eksctl (for Week 1)

```bash
# macOS (brew)
brew install eksctl

# Linux
curl -sSLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$(uname -s | tr '[:upper:]' '[:lower:]')_amd64.tar.gz"
tar -xzf eksctl_*_amd64.tar.gz
sudo mv eksctl /usr/local/bin/
```

Check:
```bash
eksctl version
```

## 5) Validate Permissions

```bash
# List EKS clusters (may be empty, but should succeed)
aws eks list-clusters --region $(aws configure get region)

# List VPCs
aws ec2 describe-vpcs --query 'Vpcs[].VpcId' --output table
```

If these commands succeed without AccessDenied, your account is ready.

## 6) Cost Hygiene

- Use a single region (easier + cheaper)
- Tag all resources with Project=reliability-lab
- Scale nodes to 0 when not working (Week 1 guidance)

Next: [04-verify-setup.md](04-verify-setup.md)
