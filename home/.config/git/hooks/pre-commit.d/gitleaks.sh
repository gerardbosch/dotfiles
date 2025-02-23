#!/bin/sh

echo "Running gitleaks on ${PWD}..."

gitleaks git --pre-commit --staged --verbose "$PWD" || exit 1

