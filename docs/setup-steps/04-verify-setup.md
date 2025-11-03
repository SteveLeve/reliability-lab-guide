# Verify Setup

Run through quick checks to ensure your environment is ready.

## 1) Run Prerequisites Script

```bash
./scripts/check-prerequisites.sh
```

Expect: All checks pass or actionable messages.

## 2) Verify AWS Environment

```bash
./scripts/verify-aws-setup.sh
```

What it checks:
- Caller identity (IAM)
- Default region
- Basic permissions (EKS, EC2)

## 3) Docker Sanity Check

```bash
docker ps
```

Expect: No error; shows running containers (can be empty).

## 4) kubectl Sanity Check

```bash
kubectl version --client --short
```

Expect: Prints client version. Cluster connection not required yet.

## 5) GitHub CLI

```bash
gh auth status
```

Expect: Logged in and token valid.

If everything looks good, you’re ready to start Week 1!
