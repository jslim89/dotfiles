#!/bin/bash

if ! [ -x "$(command -v glow)" ]; then
  echo 'Error: glow is not installed. Install it with `brew install glow`' >&2
  sleep 2
  exit 1
fi

FILE=$(tmux show-environment -g NVIM_FILE | cut -d= -f2)

if [[ ! -f "$FILE" ]]; then
  echo 'File not found' >&2
  sleep 2
  exit 1
fi

# Get the file extension
extension="${FILE##*.}"

# Convert extension to lowercase for case-insensitive comparison
extension_lower=$(echo "$extension" | tr '[:upper:]' '[:lower:]')

# Check if the extension is .md or .markdown
if [[ "$extension_lower" != "md" && "$extension_lower" != "markdown" ]]; then
  echo "'$FILE' is NOT a Markdown file."
  sleep 2
  exit 1
fi

glow -p "$FILE"

