LOADED_ZSHRC=()

# Load behavior of local `.zshrc` files
function tryLoadZshrc() {
	local current="${PWD}"

	# Check if the script from the new
	# path has already been loaded
	for i in "${LOADED_ZSHRC[@]}"
	do
		if [ "$i" == "${current}" ]; then
			return;
		fi
	done

	# Look for the script and load it
	if [ -f ".zshrc" ] && [[ "$current" != ~ ]]; then
		source ./.zshrc
		LOADED_ZSHRC+="$current"
	fi
}

# Wrapper of the custom cd to inject the load behavior
function custom_cd() {
	cd $1
	tryLoadZshrc $1
}
alias cd='custom_cd'

tryLoadZshrc
