#!/bin/bash

cat << END
**************************************************
DOTFILES SETUP STARTING!
**************************************************
END

set -eu

# 実行場所のディレクトリを取得
DOTFILES_DIR="$(pwd)"

echo "start setup..."
for f in .??*; do
    [ "$f" = ".git" ] && continue
    ln -snfv ${DOTFILES_DIR}/${f} ${HOME}/${f}
done

cat << END
**************************************************
DOTFILES SETUP FINISHED! bye.
**************************************************
END
