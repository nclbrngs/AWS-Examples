# Install SAM CLI
./aws_sam_cli_install.sh

# Install CFN-Lint
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Build and deploy
sam build 
sam deploy
