set noexpandtab
set tabstop=4
set shiftwidth=4
inorea iferr if err != nil {<CR>log.Println(err)<CR>return err<CR>}<ESC>
inorea fori for i := 0; i < max; i++ {<CR>fmt.Println(i)<CR>}<ESC>kkfm
inorea forj for j := 0; j < max; j++ {<CR>fmt.Println(j)<CR>}<ESC>kkfm
inorea fork for k := 0; k < max; k++ {<CR>fmt.Println(k)<CR>}<ESC>kkfm
inorea foriv for i, v := range iter {<CR>fmt.Println(i, v)<CR>}<ESC>
inorea forv for _, v := range iter {<CR>fmt.Println(v)<CR>}<ESC>
inorea pri fmt.Println()<ESC><LEFT>
inorea lpe log.Println(err)<ESC>
inorea loginit func init() {<CR>log.SetFlags(log.Ldate \| log.Ltime \| log.Lshortfile)<CR>}<ESC>
inorea logf log.Fatal(err)<ESC>
inorea defc defer f.Close()
inorea rnil return nil<ESC>
inorea rerr return err<ESC>
