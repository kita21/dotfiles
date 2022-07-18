autoload -Uz compinit && compinit

# 各設定ファイルを読み込む
ZSH_DIR="${HOME}/.zsh"
# 読み込み/実行権限があれば
if [ -d $ZSH_DIR ] && [ -r $ZSH_DIR ] && [ -x $ZSH_DIR ]; then
    for file in ${ZSH_DIR}/**/*.zsh; do
        # 読み取り可能ならば実行する
        [ -r $file ] && source $file
    done
fi

# zshrc.zwcが古い場合にコンパイルする
if [[ ~/.zshrc -nt ~/.zshrc.zwc ]]; then
    zcompile ${HOME}/.zshrc
fi
