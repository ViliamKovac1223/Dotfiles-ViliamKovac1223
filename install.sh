#!/bin/sh

back_up_old_config() { # Back up config file before linking new
	if [ -f "$HOME/.$1" ]; then
		mv "$HOME/.$1" "$HOME/.$1.old"
	fi
}

FORCE=false

optstring=":fh" # Allowed flags

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
	find . ! -path "./.git/*" ! -path "./.git" `# Get all files in directory except .git` \
	| sed -e '/^\.$/d' -e 's/\.\///g' `# Get a clean file names` \
	| grep -vE "LICENSE|README|install.sh" `# Filter out LICENSE README install.sh` \
)

# Get allo folders
FOLDERS=$(
	find . ! -path "./.git/*" -type d \
	| grep -v -e "./.git" -e "^\.$" -e ".dist" `# Filter out some folders` \
	| sed -e 's/\.\///' `# Remove "./" from the start of the string` \
)

# Create all important folders
for FOLDER in $FOLDERS; do
	mkdir -p "$HOME/.$FOLDER"
done

for FILE in $FILES; do
	if [ -f "./$FILE" ]; then # link only files
		if $FORCE && [ -f "$HOME/.$FILE" ]; then
			back_up_old_config "$FILE"
		fi
		ln -s "$(pwd)/$FILE" "$HOME/.$FILE"
	fi
done
