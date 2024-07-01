#!/bin/bash

show_help() {
    echo "Usage: ./skrypt.sh [OPTION]"
    echo "  -a          Perform action A"
    echo "  -b          Perform action B"
    echo "  -c ARGUMENT Perform action C with ARGUMENT"
    echo "  --date      Display today's date"
    echo "  --logs [N]  Create N log files"
}

action_a() {
    echo "Performing action A"
}

action_b() {
    echo "Performing action B"
}

action_c() {
    echo "Performing action C with argument: $1"
}

display_date() {
    echo "Today's date is: $(date '+%Y-%m-%d')"
}

create_logs() {
    local num_files=${1:-100}
    for ((i=1; i<=num_files; i++)); do
        echo "File number: $i" > "log_${i}.txt"
        echo "Created by: $0" >> "log_${i}.txt"
        echo "Date: $(date '+%Y-%m-%d %H:%M:%S')" >> "log_${i}.txt"
    done
}

while [[ $# -gt 0 ]]; do
    case $1 in
        -a )
            action_a
            ;;
        -b )
            action_b
            ;;
        -c )
            action_c "$2"
            shift
            ;;
        --date )
            display_date
            ;;
        --logs )
            create_logs "$2"
            shift
            ;;
        -h|--help )
            show_help
            exit 0
            ;;
        \? )
            echo "Invalid option: -$1" 1>&2
            show_help
            exit 1
            ;;
    esac
    shift
done

