#!/bin/bash
# script to take a command and run it repeatedly suffixed with parameters listed in a file
main() {
    local command="$1"
    local parameterListFile=$2
    local parameter=
    local return_code=0
    echo "1 Got command: $command"
    if [[ "$command" == "" ]] || [[ $parameterListFile == "" ]] ; then
        echo "Usage:  ./repeatcommand command parameterListFile"
        return 1;
    fi
    echo "2 Running $command using parameters from $parameterListFile"
    # For each parameter in parameterListFile.
    for parameter in $(cat $parameterListFile) ; do
        echo "Running $command using $parameter"
        eval "$command $parameter"
        return_code=$?
        if [[ $return_code -ne 0 ]] ; then
          echo "Operation Failed running '$command $parameter'\. return code: $return_code"
        fi
    done
    return $return_code
}

main "$@"
