#!/usr/bin/env bash

function cdcd() {
    local depth=""
    local ignore_patterns=()
    local show_all=false
    local cdcdignore_file="$HOME/.cdcdignore"

    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            -i|--ignore)
                shift
                while [[ $# -gt 0 && ! "$1" =~ ^- ]]; do
                    ignore_patterns+=("$1")
                    shift
                done
                ;;
            -a|--all)
                show_all=true
                shift
                ;;
            -h|--help)
                echo "Usage: cdcd [OPTIONS] [DEPTH]"
                echo "Navigate to subdirectories using fzf"
                echo ""
                echo "Options:"
                echo "  -i, --ignore PATTERN    Ignore directories matching pattern(s)"
                echo "  -a, --all              Show all directories (ignore .cdcdignore and -i)"
                echo "  -h, --help             Show this help message"
                echo ""
                echo "Arguments:"
                echo "  DEPTH                  Limit directory depth (default: unlimited)"
                echo ""
                echo "Examples:"
                echo "  cdcd                   Show all subdirectories"
                echo "  cdcd 2                 Limit to depth 2"
                echo "  cdcd -i node_modules   Ignore node_modules"
                echo "  cdcd -i .* -i node_modules  Ignore hidden dirs and node_modules"
                echo "  cdcd -a 3              Show all dirs up to depth 3"
                return 0
                ;;
            *)
                if [[ "$1" =~ ^[0-9]+$ ]]; then
                    depth="$1"
                else
                    echo "Error: Invalid argument '$1'" >&2
                    return 1
                fi
                shift
                ;;
        esac
    done

    # Build find command
    local find_cmd="find . -type d"

    # Add depth limitation if specified
    if [[ -n "$depth" ]]; then
        find_cmd="$find_cmd -maxdepth $depth"
    fi

    # Build ignore patterns if not showing all
    local ignore_args=""
    if [[ "$show_all" != true ]]; then
        # Read patterns from .cdcdignore file
        if [[ -f "$cdcdignore_file" ]]; then
            while IFS= read -r pattern; do
                # Skip empty lines and comments
                if [[ -n "$pattern" && ! "$pattern" =~ ^[[:space:]]*# ]]; then
                    ignore_patterns+=("$pattern")
                fi
            done < "$cdcdignore_file"
        fi

        # Build ignore arguments for find
        if [[ ${#ignore_patterns[@]} -gt 0 ]]; then
            ignore_args=" \\("
            for i in "${!ignore_patterns[@]}"; do
                if [[ $i -gt 0 ]]; then
                    ignore_args="$ignore_args -o"
                fi
                ignore_args="$ignore_args -name '${ignore_patterns[$i]}'"
            done
            ignore_args="$ignore_args \\) -prune -o -type d -print"
            find_cmd="$find_cmd $ignore_args"
        fi
    fi

    # Execute find and process results
    local to
    if [[ -n "$ignore_args" ]]; then
        to=$(eval "$find_cmd" | grep -v '^\.$' | sort | fzf --ansi --preview "ls -alhG {}")
    else
        to=$(eval "$find_cmd" | grep -v '^\.$' | sort | fzf --ansi --preview "ls -alhG {}")
    fi

    # Change directory if selection was made
    if [[ -n "$to" ]]; then
        cd "$to"
    fi
}

