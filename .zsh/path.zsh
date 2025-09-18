# homebrew
export PATH="$PATH:/opt/homebrew/bin/"
# rancher desktop
export PATH="~/.rd/bin:$PATH"
# mise
eval "$(mise activate zsh)"
# gcloud
# The next line updates PATH for the Google Cloud SDK.
if [ -f "${HOME}/google-cloud-sdk/path.zsh.inc" ]; then . "${HOME}/google-cloud-sdk/path.zsh.inc"; fi
# The next line enables shell command completion for gcloud.
if [ -f "${HOME}/google-cloud-sdk/completion.zsh.inc" ]; then . "${HOME}/google-cloud-sdk/completion.zsh.inc"; fi
