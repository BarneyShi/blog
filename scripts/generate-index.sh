#!/bin/bash

OUTPUT="index.md"

echo "# Barney's Blog" > "$OUTPUT"
echo "" >> "$OUTPUT"

find source -name "*.md" | sort | while read file; do

    title=$(grep -m 1 '^title:' "$file" | sed 's/^title:[[:space:]]*//')

    # fallback，如果没 title 就用文件名
    if [ -z "$title" ]; then
        title=$(basename "$file" .md)
    fi

    echo "- [$title](./$file)" >> "$OUTPUT"

done