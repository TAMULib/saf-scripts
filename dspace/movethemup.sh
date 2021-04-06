#!/bin/bash
 
main() {
    #local extension=$1
    local directories=
    local directory=
    local stuffToMove=
    local return_code=0

 
    # For each file in BASE_DIR.
    #files=$(find . -maxdepth 1 -iname "*.$extension")
    directories=$(find . -type d -mindepth 1)
    for directory in $directories ; do
        echo "Processing directory $directory"
        
        # move the files out of the containing directory
        if [[ $return_code -eq 0 ]] ; then
            stuffToMove="$directory/*"
            echo "want to mv $stuffToMove ."
            mv $stuffToMove .
            return_code=$?
        fi

        # remove the containing directory
        if [[ $return_code -eq 0 ]] ; then
            echo "Removing $directory "
            rmdir $directory
            return_code=$?
        fi
 
        if [[ $return_code -ne 0 ]] ; then
          echo "Operation Failed, return code: $return_code"
        fi
    done
 
    return $return_code
}
 
main $*
