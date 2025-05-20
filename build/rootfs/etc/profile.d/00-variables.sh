# default EDITOR

if type vim &>/dev/null; then
	EDITOR="vim"
else
	EDITOR="vi"
fi

export EDITOR

# default PATH

export PATH="${HOME}/bin:/usr/local/bin:${PATH}"

# shell

if [ -n "$ZSH_VERSION" ]; then
	SHELL="$(which zsh)"
elif [ -n "$BASH_VERSION" ]; then
	SHELL="$(which bash)"
fi

export SHELL

# asdf

export ASDF_DATA_DIR="${ASDF_DATA_DIR:-"${HOME}/.asdf"}"

PATH="${ASDF_DATA_DIR}/shims:${PATH}"

export PATH

# aws

AWS_DATA_PATH="${HOME}/.aws"
AWS_CONFIG_FILE="${AWS_DATA_PATH}/config"
AWS_SHARED_CREDENTIALS_FILE="${AWS_DATA_PATH}/credentials"
AWS_DEFAULT_REGION="us-east-2"
AWS_DEFAULT_OUTPUT="json"

export AWS_DATA_PATH AWS_CONFIG_FILE AWS_SHARED_CREDENTIALS_FILE AWS_DEFAULT_REGION AWS_DEFAULT_OUTPUT

# golang

GOPATH="${GOPATH:-"${HOME}/go"}"

if [ -d "${GOPATH}/bin" ]; then
	PATH="${GOPATH}/bin:${PATH}"
fi

export GOPATH PATH

# rust

if [ -d "${HOME}/.cargo" ]; then
	export PATH="${HOME}/.cargo/bin:${PATH}"
fi

# workspace

if [ -d "$WORKSPACE" ]; then
	:
elif [ -d "${HOME}/Development" ]; then
	WORKSPACE="${HOME}/Development"
elif [ -d "${HOME}/workspaces" ]; then
	WORKSPACE="${HOME}/workspaces"
fi

export WORKSPACE
