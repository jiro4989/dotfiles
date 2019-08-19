setlocal noexpandtab
setlocal tabstop=4
setlocal shiftwidth=4

" for
inorea fori for i := 0; i < max; i++ {<CR>}<ESC>k
inorea forj for j := 0; j < max; j++ {<CR>}<ESC>k
inorea fork for k := 0; k < max; k++ {<CR>}<ESC>k
inorea forkv for k, v := range iter {<CR>}<ESC>k
inorea forv for _, v := range iter {<CR>}<ESC>k

" 出力
inorea pri fmt.Println()<ESC><LEFT>
inorea lpe log.Println(err)<ESC>

" 例外処理
inorea iferr if err != nil {<CR>// TODO<CR>}<ESC>k
inorea swerr if err != nil {<CR>switch e := err.(type) {<CR>case *Error:<CR>default:<CR>}<CR>}<CR>

" deferクローズ
inorea defc defer f.Close()

" log
inorea loginit func init() {<CR>log.SetFlags(log.Ldate \| log.Ltime \| log.Lshortfile)<CR>}<ESC>
inorea logf log.Fatal(err)<ESC>

" function
inorea funcm func main() {<CR>}<ESC>ko
inorea funct func TestTODO(t *testing.T) {<CR>}<ESC>ko

" 並列処理
"inorea gort ch := make(chan int, runtime.NumCPU())<CR>var wg sync.WaitGroup<CR><CR>for i, v := range iter {<CR>wg.Add(1)<CR>go func() {<CR>defer wg.Done()<CR>ch <- 1<CR><-ch<CR>}()<CR>}<CR>wg.Wait()
inore gort ch := make(chan string, len(iter))<CR>var wg sync.WaitGroup<CR><CR>for i := 0; i < runtime.NumCPU(); i++ {<CR>wg.Add(1)<CR>go func(wg *sync.WaitGroup, ch chan string) {<CR>defer wg.Done()<CR>for {<CR>s, ok := <-ch<CR>if !ok {<CR>return<CR>}<CR>// TODO:<CR>}<CR>}(&wg, ch)<CR>}<CR><CR>for _, v := range iter {<CR>ch <- v<CR>}<CR>close(ch)<CR>wg.Wait()<CR>

" :=
inorea :: :=

" @*で選択範囲にアクセスできるようにする設定
function! ColonEqToVar()
  let l:tmp = @@
  silent normal gvy
  let l:selected = @@
  let @@ = l:tmp
  echo l:selected
endfunction
command! ColonEqToVar :call ColonEqToVar()

" 保存時にgoimportsをかける
function! s:exec_goimports()
  set cmdheight=3
  exe ":!goimports -w %"
  exe ":e!"
  set cmdheight=1
endfunction

augroup auto_style
  autocmd!
  autocmd bufWritePost *.go call s:exec_goimports()
augroup END
