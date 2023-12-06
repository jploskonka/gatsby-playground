#!/usr/bin/env bash

set -eu

ref="${1:-main}"
workflow="${2:-build.yml}"

echo "ref: $ref" 
echo "workflow: $workflow"

curl -L \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  "https://api.github.com/repos/jploskonka/gatsby-playground/actions/workflows/$workflow/dispatches" \
  -d "{\"ref\": \"$ref\"}" \
  -i


