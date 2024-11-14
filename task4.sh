#!/bin/bash

FILE=""
SEARCH=""

while [[ $# -gt 0 ]]; do
	case $1 in
		--file)
			FILE=$2
			shift
			shift
			;;
		--search)
			SEARCH=$2
			shift
			shift
			;;
		*)
			echo "Error argument $2 not supported"
			exit 1
	esac
done

NUMBER_OF_LINES=$(grep -wo "$SEARCH" "$FILE" | wc -l)
if (( NUMBER_OF_LINES == 0 )); then
	echo "Не найдено ни одного совпадения в файле $(realpath "$FILE")"
else
	echo "Количество найденных совпадений: $NUMBER_OF_LINES"
fi
