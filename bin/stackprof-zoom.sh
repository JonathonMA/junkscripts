#!/bin/sh

top() {
  stackprof --text \
    --limit 200 \
    $STACKPROF_DUMP_FILE | less -S
}

zoom() {
  stackprof --text \
    --method "$1" \
    $STACKPROF_DUMP_FILE | less -S
}

if [ -z "$STACKPROF_DUMP_FILE" ]; then
  echo "Must set STACKPROF_DUMP_FILE"
  exit 1
fi

if [ -z "$1" ]; then
  top
else
  zoom "$1"
fi
