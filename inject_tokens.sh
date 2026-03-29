#!/bin/bash
set -euo pipefail

TARGET="/workspace/invokeai/invokeai.yaml"

# Ensure folder exists
mkdir -p "$(dirname "$TARGET")"

# Write YAML only if not already there
if [[ ! -f "$TARGET" ]]; then
  cat > "$TARGET" <<EOF
# Internal metadata - do not edit:
schema_version: 4.0.2

# Put user settings here - see https://invoke-ai.github.io/InvokeAI/configuration/:

remote_api_tokens:
- url_regex: huggingface.co
  token: "${HUGGINGFACE_KEY:-}"
- url_regex: civitai.com
  token: "${CIVITAI_API_KEY:-}"
EOF
  echo "✔️ invokeai.yaml created with remote API tokens"
else
  echo "ℹ️ invokeai.yaml already exists — skipping"
fi
