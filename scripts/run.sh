#!/usr/bin/env bash
set -euo pipefail
echo "Build started on: $(date)"            | tee output.txt
echo "Hello from Jenkins on host: $(hostname)" | tee -a output.txt
echo "Branch: ${GIT_BRANCH:-unknown}"       | tee -a output.txt
echo "Commit: ${GIT_COMMIT:-unknown}"       | tee -a output.txt
