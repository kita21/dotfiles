autoload -U vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:git*' formats '(%b)'

update_git_info () { 
  vcs_info
  # 左に実行ユーザとgitブランチ表示
  PROMPT="%F{yellow}[%n]${vcs_info_msg_0_}$%f "
}
add-zsh-hook precmd update_git_info

# 右のカレンとディレクトリのフルパス表示
RPROMPT="%F{yellow}[%d]%f"
