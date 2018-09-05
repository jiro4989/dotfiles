source ~/dotfiles/common.conf

# コマンド補完
autoload -U compinit
compinit

autoload -U promptinit
promptinit

# プロンプトを変更
# prompt -p でプロンプトのテーマを変更できる
#prompt fade blue

# バージョン管理システムから情報を取得
autoload -Uz vcs_info

#prompt fade blue
source ~/dotfiles/gitutil.sh
PROMPT=$'[%*] ${fg[green]}%~${reset_color} `branch-status-check` \n%# '
setopt prompt_subst #表示毎にPROMPTで設定されている文字列を評価する

autoload -U colors; colors

# ヒストリ{{{
# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history

# メモリに保存される履歴の件数
export HISTSIZE=1000

# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000

# 重複を記録しない
setopt hist_ignore_dups

# 開始と終了を記録
setopt EXTENDED_HISTORY
# }}}
