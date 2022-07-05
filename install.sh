#!/bin/sh

back_up_old_config() { # back up config file before linking new
	if [ -f "$HOME/.$1" ]; then
		mv "$HOME/.$1" "$HOME/.$1.old"
	fi
}

FORCE=false

optstring=":fh" # allowed flags

# parse arguments
while getopts ${optstring} arg; do
	case ${arg} in
		f)
			FORCE=true
			;;
		h)
			echo "Usage:"
			echo "./install.sh -OPTIONAL_FLAG"
			echo "-f	force to create a new link. Old file will be renamed as \"config_file.old\""
			echo "-h	print help menu"
			exit;
			;;
		?)
			echo "Invalid option: -${OPTARG}."
			;;
	esac
done

FILES=$( \
	find . ! -path "./.git/*" ! -path "./.git" `# get all files in directory except .git` \
	| sed -e '/^\.$/d' -e 's/\.\///g' `# get a clean file names` \
	| grep -vE "LICENSE|README|install.sh" `#filter out LICENSE README install.sh` \
)

for FILE in $FILES; do
	if [ -f "./$FILE" ]; then # link only files
		if $FORCE && [ -f "$HOME/.$FILE" ]; then
			back_up_old_config "$FILE"
		fi
		ln -s "$(pwd)/$FILE" "$HOME/.$FILE"
	fi
done
