" Goでgoimportsが自動で走るようにする
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
