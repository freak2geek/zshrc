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

# Try to load zshrc config each time the current working directory is changed.
chpwd_functions=(${chpwd_functions[@]} "tryLoadZshrc")

# Initial try to load zshrc config.
tryLoadZshrc
