autoload -Uz colors && colors
autoload -Uz vcs_info && vcs_info

# 変数展開設定
setopt PROMPT_SUBST
# 毎回実行関数
precmd () { vcs_info }

# 右のカレンとディレクトリのフルパス表示
RPROMPT="%{$fg[yellow]%}[%d]%{$reset_color%}"

# 左に実行ユーザとgitブランチ表示
zstyle ':vcs_info:git*' formats '(%b)'
PROMPT="%{$fg[yellow]%}[%n]%{$reset_color%}%F{yellow}${vcs_info_msg_0_}$%f "
