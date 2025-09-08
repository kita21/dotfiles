#!/bin/bash

usage() {
    CMD_NAME=$(basename $0)
    cat <<_EOT_ 1>&2
Usage:
    $CMD_NAME [<options>]
Options:
    -n no exec brew command
    -h  print usage
_EOT_
    exit 1
}

# オプションをチェック
FLG_A="TRUE"
while getopts "nh" optKey;
do
  case "$optKey" in
    "n")
      FLG_A="FALSE"
      ;;
    "h"|"--help"|*)
      usage
      ;;
  esac
done

cat << END
**************************************************
DOTFILES SETUP STARTING!
**************************************************
END

# e: パラメーター展開中に、設定していない変数があったらエラーとする（特殊パラメーターである「@」と「*」は除く）
# u: パイプやサブシェルで実行したコマンドが1つでもエラーになったら直ちにシェルを終了する
set -eu

echo "start setup..."

# コマンドがinstallされているか
is_installed() {
  type $1 >/dev/null 2>&1
}

if ! is_installed "brew"; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if "$FLG_A" == "TRUE"; then
  echo "brew update & bundle"
  brew update
  brew bundle --no-upgrade
fi

# 実行場所のディレクトリを取得
DOTFILES_DIR="$(pwd)"
# 各設定ファイルを反映
echo "Creating symbolic links for dotfiles..."


ln -snfv ${DOTFILES_DIR}/.gitconfig ${HOME}/.gitconfig
# zsh
ln -snfv ${DOTFILES_DIR}/.zshrc ${HOME}/.zshrc
ln -snfv ${DOTFILES_DIR}/.zsh ${HOME}/.zsh
# config
ln -snfv ${DOTFILES_DIR}/.config/nvim ${HOME}/.config/nvim
ln -snfv ${DOTFILES_DIR}/.config/tmux ${HOME}/.config/tmux


# 現在のシェルがzshでなければzshに変更する
current_shell=$(echo $SHELL)
zsh_path=$(which zsh)
if [ "$current_shell" != "$zsh_path" ]; then
    echo "Current shell is $current_shell. Changing to zsh..."
    sudo chsh -s "$zsh_path"
    echo "Shell changed to zsh: $zsh_path"
else
    echo "Shell is already zsh: $current_shell"
fi

cat << END
**************************************************
DOTFILES SETUP FINISHED! bye.

User exec command
1. source ~/.zshrc
**************************************************
END
