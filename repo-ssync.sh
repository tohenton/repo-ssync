#!/bin/bash

if ! command -v repo &> /dev/null; then
    echo "fatal: no repo command installed" > /dev/stderr
    exit 1
fi

if ! command -v fzf &> /dev/null; then
    echo "fatal: no fzf command installed" > /dev/stderr
    exit 1
fi

if repo help | grep -q "repo is not yet installed"; then
    echo "fatal: not a repo repository: .repo" > /dev/stderr
    exit 1
fi

# Select project lines w/ fzf
project_lines=$(repo manifest | grep '<project' | fzf --multi )

# Extract project names
project_names=$(echo "$project_lines" | \
                    awk -F'name="' '{ for(i=2; i<=NF; i++) {print $i | "cut -d\\\" -f1"} }' | \
                    tr '\n' ' ')

if [ -n "$project_names" ]; then
    echo "repo sync $project_names"
    repo sync $project_names
else
    echo "No projects selected."
fi
