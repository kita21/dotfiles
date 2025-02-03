autoload -U vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:git*' formats '(%b)'
source /opt/homebrew/opt/kube-ps1/share/kube-ps1.sh

update_git_info () {
  vcs_info
  # 左に実行ユーザとgitブランチ表示
  PROMPT="$(kube_ps1)%F{yellow}[%n]${vcs_info_msg_0_}$ %f"
}
add-zsh-hook precmd update_git_info

# 右のカレンとディレクトリのパス表示
RPROMPT="%F{yellow}[%~]%f"
