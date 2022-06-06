#!/bin/bash

declare -a numbers=($1)
declare -i index=$2

addingNumbers() {

	local -a numbers=($1)
	local -i index=$2
	numbers[1]=$((numbers[0] + numbers[1]))
	numbers=("${numbers[@]:1}")
	((index--))
	if [ $index -eq 0 ]; then

		echo "${numbers[0]}"
		return 0
	fi

	addingNumbers "${numbers[*]}" "$index"
}

addingNumbers "${numbers[*]}" "$index"

exit

#->sh addingNumbers.sh "1 2 3 4 5" 3
#->10
