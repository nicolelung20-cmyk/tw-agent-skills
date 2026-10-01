#!/bin/bash
set -euo pipefail

# Only run in Claude Code on the web.
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

cd "${CLAUDE_PROJECT_DIR:-$(pwd)}"

# This repo is documentation-only (skills/*.md); its Python content is the
# stdlib-only HMAC signing example in skills/api/references/setup.md.
# Install just the Python tooling used to lint and test such snippets.
# pip skips packages that are already satisfied, so this is idempotent.
python3 -m pip install --quiet --disable-pip-version-check --user ruff pytest
