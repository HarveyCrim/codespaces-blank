#!/bin/bash
# Clean out any old/pre-existing binary structures
sudo rm -rf /usr/local/aws-cli /usr/local/bin/aws /usr/local/bin/aws_completer

# Install AWS CLI using pipx
pipx install awscli

# Force the global shell profiles to recognize the new path on future starts
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
