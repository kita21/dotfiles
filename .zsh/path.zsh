# nodenv (node version manager)
# githubからinstallした場合
if [[ -f "$HOME/.nodenv/bin/nodenv" ]]; then
  export PATH="$HOME/.nodenv/bin:$PATH"
  eval "$(nodenv init -)"
fi
