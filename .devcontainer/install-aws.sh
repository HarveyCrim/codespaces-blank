#!/bin/bash
set -e

# Clean out any old/pre-existing binary structures
rm -rf /usr/local/aws-cli /usr/local/bin/aws /usr/local/bin/aws_completer

# Ensure pipx is available without requiring sudo
if ! command -v pipx >/dev/null 2>&1; then
  python3 -m pip install --user pipx
fi

export PATH="$HOME/.local/bin:$PATH"

# Install AWS CLI using pipx
pipx install awscli

# Force the global shell profiles to recognize the new path on future starts
if ! grep -q 'export PATH="$HOME/.local/bin:\$PATH"' ~/.bashrc 2>/dev/null; then
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
fi
