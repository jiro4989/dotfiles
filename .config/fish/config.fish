# Theme
# set fish_theme agnoster
# set fish_theme bira

# Shortcut keys
function fish_user_key_bindings
  bind \cp 'stty sane; peco_select_ghq_repository'
end

alias v=nvim
alias lg=lazygit
alias cf=chof
alias d=docker
alias dc=docker-compose
