# Load shell dotfiles.
dotfiles=(
    path
    exports
    aliases
)

source_file_if_exists() {
    [ -r "$1" ] && [ -f "$1" ] && source "$1"
}

for file in $dotfiles; do
    source_file_if_exists ~/."$file"
    source_file_if_exists ~/."$file".local
done

unset dotfiles
unset source_file_if_exists
