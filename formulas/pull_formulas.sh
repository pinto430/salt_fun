#!/bin/bash
while getopts ":f:g:d:" opts; do
	case $opts in
		f)
			#echo "-f was triggered with Parameter: $OPTARG"
			use_file=1
			file_name=$OPTARG
			;;
		g)
			#echo "-g was triggered with Parameter: $OPTARG" >&2
			git_repository=$OPTARG
			;;
		d)
			#echo "-d was triggered with Parameter: $OPTARG" >&2
			directory_name=$OPTARG
			;;
		:)
			echo "Option -$OPTARG requires an argument." >&2
			exit 1
			;;
	esac
done

if [[ "$use_file" ]]
then
  while IFS=' ' read -r git dir || [[ -n "$line" ]]; do
    if [ ! -d "$dir" ]; then
      # Clone each git and dir in the file
      git clone --depth=1 --branch=master $git $dir
      # Remove the .git directory from cloned directory
      rm -rf "$dir/.git"
    else
      echo "Skipping $git as directory already exists" >&2
    fi
  done < "$file_name"
elif [[ "$git_repository" ]] && [[ "$directory_name" ]]
then
  echo "Using arguments - git: $git_repository and dir: $directory_name"
  git clone --depth=1 --branch=master $git_repository $directory_name
  # Remove the .git directory from the cloned directory
  rm -rf "$directory_name/.git"
else
  echo "Not enough arguments specified"
fi
