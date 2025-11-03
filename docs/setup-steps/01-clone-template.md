# Clone the Reliability Lab Template

## Overview

Create your own copy of the Reliability Lab from the template repository.

## Step 1: Use GitHub Template

### Option A: Via GitHub Web UI

1. Go to [reliability-lab-template](https://github.com/SteveLeve/reliability-lab-template)
2. Click the green **"Use this template"** button
3. Select **"Create a new repository"**
4. Fill in:
   - **Repository name:** `reliability-lab` (or your choice)
   - **Description:** "My 6-8 week platform engineering learning journey"
   - **Visibility:** Public (recommended for portfolio)
5. Click **"Create repository from template"**

### Option B: Via GitHub CLI

```bash
gh repo create reliability-lab \
  --template SteveLeve/reliability-lab-template \
  --public \
  --clone
```

## Step 2: Clone Locally

If you used the web UI:

```bash
git clone git@github.com:SteveLeve/reliability-lab.git
cd reliability-lab
```

## Step 3: Customize Template

Run the customization script:

```bash
./.github/template-setup.sh SteveLeve reliability-lab
```

This will:
- Update README badges with your username
- Update CODEOWNERS
- Update GitHub workflow files
- Create initial customization commit

## Step 4: Verify Structure

Check that you have all the key files:

```bash
# Should show the project structure
ls -la

# Key directories
ls services/
ls deploy/
ls docs/
ls .github/workflows/
```

## Step 5: Test Locally

Verify everything works locally before proceeding:

```bash
# Create virtual environment
python3 -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate

# Install dependencies
make setup-dev

# Run tests
make test

# Start app locally
make run-local
```

In another terminal:
```bash
# Test endpoints
curl http://localhost:8000/health
curl http://localhost:8000/ready
curl http://localhost:8000/docs

# Should all return successfully
```

Stop the app:
```bash
make stop-local
```

## Step 6: First Commit

If you made any local changes:

```bash
git add .
git commit -m "chore: customize template for my lab"
git push
```

## Troubleshooting

### Can't clone repository
```bash
# Check GitHub authentication
gh auth status

# Re-authenticate if needed
gh auth login
```

### Template customization script fails
```bash
# Run manually
sed -i '' 's/SteveLeve/your-actual-username/g' README.md
sed -i '' 's/@yourusername/@your-actual-username/g' .github/CODEOWNERS
```

### Local tests fail
```bash
# Ensure Python 3.11+
python3 --version

# Reinstall dependencies
pip install --upgrade pip
make setup-dev
```

## Next Steps

Proceed to [Configure Claude](02-configure-claude.md) to set up your AI assistant.
