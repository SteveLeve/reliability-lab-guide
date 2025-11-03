#!/usr/bin/env bash
set -euo pipefail

echo "==============================="
echo "Verify AWS Setup"
echo "==============================="

FAIL=0

echo "Checking caller identity..."
if aws sts get-caller-identity >/dev/null 2>&1; then
  echo "✅ AWS identity OK"
else
  echo "❌ Unable to get caller identity"; FAIL=$((FAIL+1))
fi

REGION=$(aws configure get region || echo "")
if [[ -z "$REGION" ]]; then
  echo "❌ No default AWS region configured (run: aws configure)"; FAIL=$((FAIL+1))
else
  echo "✅ Default region: $REGION"
fi

echo "Checking EKS permissions (list-clusters)..."
if aws eks list-clusters --region "${REGION:-us-east-1}" >/dev/null 2>&1; then
  echo "✅ EKS list-clusters OK"
else
  echo "⚠️  EKS list-clusters failed (may be due to permissions or region)"
fi

echo "Checking EC2 describe-vpcs..."
if aws ec2 describe-vpcs --region "${REGION:-us-east-1}" >/dev/null 2>&1; then
  echo "✅ EC2 describe-vpcs OK"
else
  echo "⚠️  EC2 describe-vpcs failed (may be due to permissions)"
fi

echo "\nSummary:"
if [[ $FAIL -eq 0 ]]; then
  echo "✅ AWS setup looks good!"
  exit 0
else
  echo "❌ Found $FAIL blocking issues. Fix and rerun."
  exit 1
fi
