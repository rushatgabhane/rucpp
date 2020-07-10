#!/bin/bash

#path="$1"
#filename="${path##*/}"

usage(){
cat <<EOF
Usage: runcpp [arguments if any] <file.cpp>
Arguments:
   -h  or  --help	Print Help and exit
EOF
}

# read args
case $1 in
	-h | --help | "")
		usage
		exit
		;;
	*) filepath=$1
		;;
esac

# Check if g++ exists
command -v g++ >/dev/null 2>&1 || {
    echo >&2 "g++ is not installed. Please run sudo apt install g++";
    exit 1;
}

filename="$(basename $filepath)"
filenameWithoutExtension="$(basename $filepath .cpp)"

# compile and execute
# g++ -std=c++14 -Wshadow -Wall -o "%e" "%filepath" -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG

echo "$filename"
echo "$filenameWithoutExtension"
