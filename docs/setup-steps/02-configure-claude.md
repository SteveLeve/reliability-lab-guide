# Configure Claude AI Project

## Overview

Set up Claude as your personal SRE mentor for the Reliability Lab.

## Why Claude AI?

Claude will:
- Explain Kubernetes concepts in depth
- Guide you through AWS and Terraform
- Help debug issues systematically
- Provide code reviews
- Keep you cost-conscious
- Teach production best practices

## Step 1: Create Claude Project

1. Go to https://claude.ai
2. Log in (or create account)
3. Click **"Projects"** in left sidebar
4. Click **"+ New Project"**
5. Name: **"Reliability Lab"**
6. Description: "6-8 week platform engineering learning journey"
7. Click **"Create"**

## Step 2: Add Custom Instructions

1. In your new project, click the **gear icon** (Settings)
2. Navigate to **"Custom Instructions"**
3. Open the file `claude-project/custom-instructions.md` from this repo
4. **Copy the entire contents**
5. **Paste into Custom Instructions field**
6. Click **"Save"**

**What this does:**
- Configures Claude's teaching style (hybrid: explain + do)
- Sets cost-consciousness
- Enables security-first mindset
- Focuses on Kubernetes deep-dives
- Provides response patterns for different situations

## Step 3: Upload Knowledge Files

Add these files to give Claude context about your lab:

1. Click **"Add Content"** in your Claude Project
2. Click **"Upload file"**
3. Upload each of these files from `claude-project/knowledge-files/`:

   **File 1: project-overview.md**
   - What: Complete overview of the 8-week learning path
   - Why: Helps Claude understand your current week and goals
   
   **File 2: aws-cost-optimization.md**
   - What: Detailed cost breakdown and optimization strategies
   - Why: Keeps Claude aware of cost implications
   
   **File 3: sre-glossary.md** (from template repo)
   - What: SRE and Kubernetes terminology
   - Why: Ensures consistent concept explanations
   
   **File 4: repository-structure.md** (will create below)
   - What: Your lab repository structure
   - Why: Helps Claude navigate your codebase

4. Label each file appropriately when uploading

### Creating repository-structure.md

Create this file with your repo structure:

```bash
cat > ./repository-structure.md << 'ENDFILE'
# Repository Structure

My Reliability Lab repository: https://github.com/SteveLeve/reliability-lab

## Directory Layout

\```
reliability-lab/
├── services/sample-app/   # FastAPI application
├── deploy/                # K8s, Terraform, Compose
├── docs/lab-roadmap/      # Week-by-week guides
├── .github/workflows/     # CI/CD pipelines
├── ops/                   # Observability, security
└── scripts/               # Automation
\```

## Current Status
- Week: 1
- Branch: main
- Focus: Containerization and EKS deployment
ENDFILE

# Upload this file to Claude Project
```

## Current Status
- Week: 1
- Branch: main
- Focus: Containerization and EKS deployment
ENDFILE

# Upload this file to Claude Project
```

## Step 4: Test Claude Configuration

Start a chat in your Claude Project and test:

```
Hi Claude! I'm starting the Reliability Lab.

Setup status:
✅ Repository created from template
✅ Claude Project configured
✅ Prerequisites verified

I'm ready to begin Week 1. Can you:
1. Confirm you understand the project context
2. Explain what we'll build in Week 1
3. Highlight cost considerations

Let's start!
```

**Expected Response:**
Claude should:
- Acknowledge the Reliability Lab context
- Explain Week 1 objectives (containerization, EKS)
- Mention cost (~$10-20 for Week 1)
- Offer to walk you through first task

## Step 5: Bookmark for Easy Access

Add to browser bookmarks:
- Project URL: `https://claude.ai/projects/[your-project-id]`
- Or: Pin the Projects tab in Claude

## Using Claude Effectively

### Good Prompts

**For Learning:**
```
Explain HPA in Kubernetes:
- What problem does it solve?
- How does it work?
- When should I use it?
- Show me a practical example
```

**For Implementation:**
```
Help me create a Terraform module for VPC with:
- 2 public subnets
- 2 private subnets
- NAT gateway
- Proper tagging

Follow AWS best practices.
```

**For Debugging:**
```
My pod is in CrashLoopBackOff state.

Pod describe output:
[paste output]

Pod logs:
[paste logs]

Help me debug this systematically.
```

**For Code Review:**
```
Review this Kubernetes Deployment manifest for:
- Security issues
- Resource management
- High availability
- Best practices

[paste YAML]
```

### Avoid These

**Too vague:**
```
Help me with Kubernetes
```

**No context:**
```
Fix this error: connection refused
```

**Assuming shared knowledge:**
```
What did we decide about that thing?
```

## Claude Project Settings

**Recommended:**
- Model: Latest (Claude Sonnet 4.5)
- Keep conversation history in Project
- Pin important chats (milestone completions)

## Troubleshooting

### Claude doesn't seem to understand context
- Verify all 4 knowledge files are uploaded
- Check custom instructions are saved
- Start new chat and reintroduce yourself

### Responses aren't cost-conscious
- Re-check custom instructions include cost section
- Explicitly mention cost in your questions
- Upload aws-cost-optimization.md if missing

### Can't find old conversations
- Use Projects feature (not just chats)
- Conversations in Project persist
- Use search within Project

## Next Steps

Proceed to [AWS Setup](03-aws-setup.md) to configure your AWS account.
