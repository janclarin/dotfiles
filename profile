# Load shell dotfiles.
for file in ~/.{path,exports,aliases,exports.local}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
