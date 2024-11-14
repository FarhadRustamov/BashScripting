#!/bin/bash

FILES=()
EXTENSION=""
REPLACEMENT=""

while [[ $# -gt 0 ]]; do
	case $1 in 
		--file)
			FILES+=($2)
			shift
			shift
			;;
		--extension)
			EXTENSION=$2
			shift
			shift
			;;
		--replacement)
			REPLACEMENT=$2
			shift
			shift
			;;
		*)
			echo "Error argument $2 not supported"
			exit 1
	esac
done

for file in "${FILES[@]}"; do
	dirname=$(dirname $file)
	filename=$(basename $file)
	basename="$dirname/$filename"
	if [[ $filename =~ \.$EXTENSION$ ]]; then
		new_name="${basename%.$EXTENSION}.$REPLACEMENT"
		mv $basename $new_name
		echo $new_name
	fi
done
