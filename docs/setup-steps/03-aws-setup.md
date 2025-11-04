# AWS Setup

Configure your AWS account and environment for the Reliability Lab.

## 1) Create IAM User (if using root is not desired)

Recommended: Create a dedicated IAM user with AdministratorAccess for the lab. You can scope down later in Week 2.

Create User Steps:
1. Go to IAM → Users → Add users
2. User name: `reliability-lab-admin`
3. Access type: Programmatic access (leave "Provide user access to the AWS Management Console" unchecked)
4. Click next to Set Permissions
5. Attach policy: `AdministratorAccess` (User Groups checkbox) 
6. Click next to to "Review and create"
7. Click "Create User"

Download credentials CSV:
1. Go to IAM → Users → reliability-lab-admin
2. Click the "Security credentials" tab
3. Scroll to "Access keys" section
4. Click "Create access key"
5. Select "Command Line Interface (CLI)" as the use case
6. Check the confirmation box and click Next
7. Click "Create access key"
8. Now download the CSV or copy the keys before closing

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
