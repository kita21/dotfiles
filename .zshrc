ZSH_HOME="${HOME}/.zsh"

# 各設定ファイルを読み込む
# 配列に.zshの拡張子のファイルパスを代入
echo 'loding zsh files'
config_files=($ZSH_HOME/**/*.zsh)
for file in $config_files; do
  echo $file
  source $file
done

HISTFILE="${HOME}/.zsh_history"
# メモリに保存される履歴の件数
HISTSIZE=50000
# 履歴ファイルに保存される履歴の件数
SAVEHIST=10000
# 開始と終了を記録
setopt EXTENDED_HISTORY
# 重複した履歴を保存しない
setopt HIST_IGNORE_DUPS

# 補完機能有効化
autoload -Uz compinit && compinit

# zshrc.zwcが存在しない or zshrc.zwcがzshrcより古い場合にコンパイルする
if [ ! -f ${HOME}/.zshrc.zwc -o {$HOME}/.zshrc -nt ${HOME}/.zshrc.zwc ]; then
    zcompile ${HOME}/.zshrc
fi
