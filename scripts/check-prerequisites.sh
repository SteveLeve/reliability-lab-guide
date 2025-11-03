#!/usr/bin/env bash
# Prerequisites verification script

set -euo pipefail

echo "======================================"
echo "Reliability Lab - Prerequisites Check"
echo "======================================"
echo ""

MISSING=0

check_command() {
  if command -v "$1" &> /dev/null; then
    echo "✅ $1: $(command -v $1)"
    if [[ -n "${2:-}" ]]; then
      VERSION=$($1 ${2} 2>&1 || echo "unknown")
      echo "   Version: $VERSION"
    fi
  else
    echo "❌ $1: NOT FOUND"
    MISSING=$((MISSING + 1))
  fi
}

echo "Checking required tools..."
echo ""

check_command git "--version"
check_command docker "--version"
check_command aws "--version"
check_command kubectl "version --client --short"
check_command terraform "--version"
check_command python3 "--version"
check_command gh "--version"

echo ""
echo "Checking Docker daemon..."
if docker ps &> /dev/null; then
  echo "✅ Docker: Running"
else
  echo "❌ Docker: Not running or no permission"
  MISSING=$((MISSING + 1))
fi

echo ""
echo "Checking AWS credentials..."
if aws sts get-caller-identity &> /dev/null; then
  echo "✅ AWS: Configured"
  aws sts get-caller-identity
else
  echo "❌ AWS: Not configured"
  MISSING=$((MISSING + 1))
fi

echo ""
echo "Checking GitHub CLI authentication..."
if gh auth status &> /dev/null; then
  echo "✅ GitHub CLI: Authenticated"
else
  echo "❌ GitHub CLI: Not authenticated"
  echo "   Run: gh auth login"
  MISSING=$((MISSING + 1))
fi

echo ""
echo "======================================"
if [[ $MISSING -eq 0 ]]; then
  echo "✅ All prerequisites met!"
  echo "======================================"
  echo ""
  echo "Next steps:"
  echo "1. Clone the reliability-lab template"
  echo "2. Configure Claude AI Project"
  echo "3. Start Week 1!"
  exit 0
else
  echo "❌ $MISSING prerequisites missing"
  echo "======================================"
  echo ""
  echo "Please install missing tools and try again."
  echo "See: docs/setup-steps/00-prerequisites.md"
  exit 1
fi
