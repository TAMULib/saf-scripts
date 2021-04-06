#!/bin/bash

# script to take a flat directory full of files and move them each into their own eponymous subdirectory
 
main() {
    local extension=$1
    local files=
    local file=
    local directory=
    local return_code=0
 
    if [[ $extension == "" ]] ; then
        extension='jpg';
    fi
 
    # For each file in BASE_DIR.
    files=$(find . -maxdepth 1 -iname "*.$extension")
    for file in $files ; do
        # Build the new path from the filename without the extension.
        directory="${file%.*}"
 
        # Test if the directory exists.
        if [[ ! -d $directory ]] ; then
            echo "Creating directory $file"
            mkdir alice/$file
            return_code=$?
        fi
 
        # Finally, move the file ...
        if [[ $return_code -eq 0 ]] ; then
            echo "Moving $file to $file/$file"
            mv $file alice/$file/$file
            return_code=$?
        fi
 
        if [[ $return_code -ne 0 ]] ; then
          echo "Operation Failed for file '$file', return code: $return_code"
        fi
    done
 
    return $return_code
}
 
main $*
