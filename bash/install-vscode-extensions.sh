echo "Installing VS Code extensions for PHP Web Development"
code_extensions=(\
    "bmewburn.vscode-intelephense-client" \
    "editorconfig.editorconfig" \
    "mjmlio.vscode-mjml" \
    "wordpresstoolbox.wordpress-toolbox" \
)

for extension in "${code_extensions[@]}"; do
    code --install-extension "$extension" --force
done
