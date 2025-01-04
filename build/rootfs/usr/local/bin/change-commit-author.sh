#!/usr/bin/env bash

set -e

function usage() {
	echo "usage: $0 [-f] -e WRONG_EMAIL -n NEW_NAME -m NEW_EMAIL"
	exit 1
}

declare -a ARGS=()

while getopts "e:fm:n:" opt; do
	case "$opt" in
	e)
		WRONG_EMAIL="$OPTARG"
		;;
	f)
		ARGS+=("--force")
		;;
	n)
		NEW_NAME="$OPTARG"
		;;
	m)
		NEW_EMAIL="$OPTARG"
		;;
	*)
		usage
		;;
	esac
done

if [ -z "$WRONG_EMAIL" ] || [ -z "$NEW_NAME" ] || [ -z "$NEW_EMAIL" ]; then
	usage
fi

FILTER_BRANCH_SQUELCH_WARNING=1 git filter-branch "${ARGS[@]}" --env-filter "
if [ \"\$GIT_COMMITTER_EMAIL\" = \"$WRONG_EMAIL\" ]
then
    export GIT_COMMITTER_NAME=\"$NEW_NAME\"
    export GIT_COMMITTER_EMAIL=\"$NEW_EMAIL\"
fi
if [ \"\$GIT_AUTHOR_EMAIL\" = \"$WRONG_EMAIL\" ]
then
    export GIT_AUTHOR_NAME=\"$NEW_NAME\"
    export GIT_AUTHOR_EMAIL=\"$NEW_EMAIL\"
fi
" --tag-name-filter cat -- --branches --tags
