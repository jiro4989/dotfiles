" クラス宣言
inorea mainc public class hoge {}<Left><CR><Esc>kopublic static void main(String... args) {<CR>hoge<CR>}<Esc>/hoge
inorea enumc public enum EnumClass {}<Left><CR><Esc>koHOGE(hoge)<CR>,HOGE(hoge)<CR>,HOGE(hoge);<CR><CR>public final Type FIELD;<CR><CR>private EnumClass(Type aField) {}<Left><CR><Esc>koFIELD = aField;<Esc>/EnumClass

" 頻出メソッド
inorea sysout System.out.println("");<Esc>hhi
inorea tost @Override<CR>public String toString() {}<Left><CR><Esc>koreturn super.toString();<Esc>
inorea maindef public static void main(String... args) {}<Left><CR>

" forループ
inorea fori for (int i=0; i<hoge; i++) {<CR>}<Esc>/hoge
inorea forj for (int j=0; j<hoge; j++) {<CR>}<Esc>/hoge
inorea fork for (int k=0; k<hoge; k++) {<CR>}<Esc>/hoge
inorea forite for (hoge hoge : hoge) {<CR>}<Esc>/hoge

" try-catch
inorea tryc try {<CR>hoge<CR>} catch (hoge e) {<CR>e.printStackTrace();<CR>}<Esc>/hoge
inorea trycw try (hoge) {<CR>hoge<CR>} catch (hoge e) {<CR>e.printStackTrace();<CR>}<Esc>/hoge
inorea trycf try {<CR>hoge<CR>} catch (hoge e) {<CR>e.printStackTrace();<CR>} finally {<CR>hoge<CR>}<Esc>/hoge
inorea trycfw try (hoge) {<CR>hoge<CR>} catch (hoge e) {<CR>e.printStackTrace();<CR>} finally {<CR>hoge<CR>}<Esc>/hoge

" if-else
inorea ifst if ("hoge".equals(hoge)) {<CR>}<Esc>/hoge
inorea ifel if (hoge) {<CR>hoge<CR>} else {<CR>hoge<CR>}<Esc>/hoge
inorea elif } else if (hoge) {<Esc>/hoge
inorea steq "hoge".equals(hoge)<Esc>/hoge

inorea swcase switch (hoge) {<CR>case hoge: hoge break;<CR>}<Esc>/hoge

" 変数宣言
inorea const public static final Hoge hoge = hoge;<Esc>/hoge
inorea pricon private static final Hoge hoge = hoge;<Esc>/hoge
inorea arrlist List<Hoge> hoge = new ArrayList<>();<Esc>/hoge

" javadocコメント"
inorea jcom /**<CR>hoge<CR>/<Esc>/hoge
inorea jcomp /**<CR>hoge<CR><CR>@param hoge<CR>/<Esc>/hoge
inorea jcomr /**<CR>hoge<CR><CR>@return hoge<CR>/<Esc>/hoge
inorea jcompr /**<CR>hoge<CR><CR>@param hoge<CR>@return hoge<CR>/<Esc>/hoge

