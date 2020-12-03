#!/bin/bash
#Script to go through a DSpace SAF archive and generate a mapfile for it.  Only works if the items have handle files.
main () {
	local mapfile="$1"
	local item_directories=
    local item_directory=
    local handlefile=
    local handle=
    local return_code=0
    local item_directory_counter=0

    if [[ $mapfile == "" ]] ; then
        echo "Usage: generate-mapfile mapfile"
        return 0;
    fi

    echo "Using mapfile $mapfile"

    # For each directory in the BASE_DIR
    item_directories=$( ls -A )
    for item_directory in $item_directories ; do
        # "checking $item_directory"
    	if [[ -d "$item_directory" ]] ; then
            echo "processing item directory $item_directory"
            handlefile="$item_directory/handle"
            echo "processing handle file $handlefile"
            handle=`cat $handlefile`

            echo "$item_directory $handle" >> $mapfile

        fi
    done
 
    return $return_code
}

main "$@"