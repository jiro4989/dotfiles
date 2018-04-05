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
inorea funcm func main() {<CR>}<ESC>ko
inorea funct func Test(t *testing.T) {<CR>}<ESC>k^wea
inorea makec ch := make(chan int, runtime.NumCPU())<CR>var wg sync.WaitGroup
inorea gort ch := make(chan int, runtime.NumCPU())<CR>var wg sync.WaitGroup<CR><CR>for i, v := range iter {<CR>wg.Add(1)<CR>go func() {<CR>defer wg.Done()<CR>ch <- 1<CR><-ch<CR>}()<CR>}<CR>wg.Wait()
