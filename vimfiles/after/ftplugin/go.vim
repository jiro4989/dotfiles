set noexpandtab
set tabstop=4
set shiftwidth=4
inorea iferr if err != nil {<CR>log.Fatal(err)<CR>}<ESC>
inorea foriv for i, v := range iter {<CR>fmt.Println(i, v)<CR>}<ESC>
inorea forv for _, v := range iter {<CR>fmt.Println(v)<CR>}<ESC>
inorea pri fmt.Println()<ESC><LEFT>
