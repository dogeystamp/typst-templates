#!/bin/sh

PROGNAME=$(basename "$0")

if [ -z "$TYPST_ROOT" ]; then
	echo "$PROGNAME: "'Please set $TYPST_ROOT.'
	exit 1
fi

cat <<EOF > $1
prefix: "$TYPST_ROOT"
me: "$USER"
lang: "en"
EOF
