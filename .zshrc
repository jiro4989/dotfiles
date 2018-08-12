. ~/dotfiles/common.conf

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
. ~/dotfiles/gitutil.sh
PROMPT=$'[%*] ${fg[green]}%~${reset_color} `branch-status-check` \n%# '
setopt prompt_subst #表示毎にPROMPTで設定されている文字列を評価する

autoload -U colors; colors

