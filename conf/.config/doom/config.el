;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "Noto Sans Mono CJK JP" :size 17 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Noto Sans Mono CJK JP" :size 18))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `with-eval-after-load' block, otherwise Doom's defaults may override your
;; settings. E.g.
;;
;;   (with-eval-after-load 'PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look them up).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; SKK ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; +bindingsで+default/newlineに上書きされているのでnilにしておく
(map! :i "C-j" nil)

;; insert modeのC-gはevil-escapeに上書きされるとSKKと相性が悪い
(map! :i "C-g" nil)

(map! :after evil-org
      :map evil-org-mode-map
      ;; lang/org/configでorg-down-elementに上書きされているのでnilにしておく
      :i "C-j" (cmds! (org-at-table-p) #'org-table-next-row nil)
      )

(use-package! skk
  :bind ("C-x C-j" . #'skk-mode)
  :config
  ;; input/japanese/config.elでaddされているhookを削除する
  ;; （これだとC-gしたらSKKが終了してしまう）
  (remove-hook 'doom-escape-hook #'skk-mode-exit)
  :hook
  ;; normalモードに入るときにSKKをlatin-modeにするにはこう
  (evil-normal-state-entry-hook
   . (lambda ()
       (when (bound-and-true-p skk-mode)
         (skk-latin-mode-on)))))

;; ついでにpackage.elでjapaneseを有効にするとpangu-spacingまで強制有効になるのはどうかと思う向きは
(use-package! pangu-spacing
  :config
  ;; input/japanese/config.elでtext-mode-hookに挿入されているので削除する
  (remove-hook 'text-mode-hook #'pangu-spacing-mode))

;; org-roam
(setq org-roam-directory "~/workspace/memo")
(org-roam-db-autosync-mode)
;; ショートカットキーの割りあて
(map! :leader
      (:prefix ("n r" . "org-roam")
       :desc "Find node" "f" #'org-roam-node-find
       :desc "Insert node" "i" #'org-roam-node-insert
       :desc "Buffer" "b" #'org-roam-buffer-toggle))

;; ミニバッファ（検索欄）でもSKKを使えるようにする
(add-hook 'minibuffer-setup-hook
          (lambda ()
            (when (and (boundp 'skk-mode) (not skk-mode))
              ;; ミニバッファ内で C-x C-j を有効にするための処理
              (local-set-key (kbd "C-x C-j") 'skk-mode))))

;; Verticoなどの補完バッファでSKKの挙動を安定させる（おまじない）
(with-eval-after-load 'skk
  (setq skk-egg-like-newline t) ; 確定時の挙動をマイルドにする
  ;; 必要に応じて、ミニバッファに入った瞬間に最初からSKKをONにしたい場合は以下を有効化
  ;; (add-hook 'minibuffer-setup-hook #'skk-mode)
  )
