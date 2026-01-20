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
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
;; (setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
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

;; Set font and Themes
(setq doom-font (font-spec :family "Maple Mono NF CN" :size 22))
(custom-set-faces!
  '(line-number :family "Maple Mono NF CN" :height 1.0)
  `(line-number-current-line :family "Maple Mono NF CN" :height 1.0 :weight bold :slant italic :foreground ,(doom-color 'blue))
  '(font-lock-keyword-face :family "Maple Mono NF CN" :slant italic))

(setq display-line-numbers-type 'relative)
;; (load-theme 'kanagawa t)
;; (setq doom-theme 'doom-tokyo-night)
;; (setq doom-theme 'catppuccin)
;; (setq doom-theme 'doom-rouge)
(setq doom-theme 'doom-nord-aurora)

;; Typst mode
(use-package typst-ts-mode
  :custom
  (typst-ts-watch-options "--open")
  (typst-ts-mode-grammar-location (expand-file-name "tree-sitter/libtree-sitter-typst.so" user-emacs-directory))
  (typst-ts-mode-enable-raw-blocks-highlight t)
  :config
  (setq-local tab-width 2)
  (setq-local indent-tabs-mode nil)
  (keymap-set typst-ts-mode-map "C-c C-c" #'typst-ts-tmenu))

;; 設定 typst-ts-mode 的 languageId
(with-eval-after-load 'lsp-mode
  (add-to-list 'lsp-language-id-configuration '(typst-ts-mode . "typst")))

(defvar my/tinymist-path "/usr/bin/tinymist"
  "Tinymist LSP binary path.")

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook ((typst-ts-mode . lsp-deferred))
  :config
  (lsp-register-client
   (make-lsp-client
    :new-connection (lsp-stdio-connection
                     (lambda () `(,my/tinymist-path "lsp" )))
    :major-modes '(typst-ts-mode)
    :server-id 'tinymist)))

(map! :leader
      :desc "Open Typst Preview" "c p" #'typst-preview-mode)

;; Setting lsp-pyright
(use-package lsp-pyright
  :after lsp-mode
  :init
  (setq lsp-pyright-disable-language-services nil
        lsp-pyright-disable-organize-imports nil
        lsp-pyright-auto-import-completions t
        lsp-pyright-use-library-code-for-types t)
  :config
  (add-hook 'python-mode-hook #'lsp!))

(setq lsp-inlay-hint-enable t)

(use-package wakatime-mode
  :ensure t)
(global-wakatime-mode)

(setq typst-preview-browser "eaf-browser")
(setq typst-preview-invert-colors "never")

(defun my/fcitx5-deactivate ()
  "停用 fcitx5 輸入法（例如回到 normal 模式）"
  (call-process "fcitx5-remote" nil nil nil "-c"))

(defun my/setup-fcitx5-evil-hooks ()
  "根據 Evil 狀態自動切換 fcitx5。"
  (add-hook 'evil-insert-state-exit-hook  #'my/fcitx5-deactivate))

(my/setup-fcitx5-evil-hooks)

(require 'elcord)
(elcord-mode)

(global-whitespace-mode +1)
(setq whitespace-style '
      (face tabs spaces trailing space-before-tab
            space-after-tab space-mark tab-mark missing-newline-at-eof)
      )

(map! :leader
      :desc "Toggle whitespace-mode" "o w" #'whitespace-mode)

(electric-indent-mode 1)
(map! :leader
      :desc "Toggle Treemacs" "e" #'treemacs)

;; accept completion from copilot and fallback to company
(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (:map copilot-completion-map
              ("<tab>" . 'copilot-accept-completion)
              ("TAB" . 'copilot-accept-completion)
              ("C-TAB" . 'copilot-accept-completion-by-word)
              ("C-<tab>" . 'copilot-accept-completion-by-word)))
(after! lsp-mode
  (setq lsp-ui-doc-enable nil)            ; 1. 關閉那個討厭的大文件框
  (setq lsp-signature-auto-activate nil)  ; 2. 關閉輸入參數時的浮動提示
  (setq lsp-lens-enable nil)              ; 3. (選配) 關閉代碼上方的參照數量顯示，讓畫面更乾淨
  )

;; 讓 Company 選單出現時，Copilot 稍微安靜一點
(after! company
  (add-hook 'company-completion-started-hook 'copilot-clear-overlay))
(map! :leader
      :desc "Toggle lsp-ui-imenu" "t o" #'lsp-ui-imenu)

(blink-cursor-mode 1)
(add-hook 'rust-mode-hook 'lsp-deferred)


;; ;; EAF (Emacs Application Framework) settings
(add-to-list 'load-path "~/.emacs.d/site-lisp/emacs-application-framework/")
(require 'eaf)
(require 'eaf-browser)
(require 'eaf-pdf-viewer)
(require 'eaf-image-viewer)
(require 'eaf-pyqterminal)
(require 'eaf-evil)
(setq eaf-evil-leader-key "SPC")

(setq eaf-browser-dark-mode nil)
(setq eaf-browser-default-search-engine "duckduckgo")
(map! :leader
      :desc "Open EAF-Browser" "o b" #'eaf-open-browser)
(map! :leader
      :desc "Open EAF-pyqterminal here" "o T" #'eaf-open-pyqterminal)

(setq compile-command "")
(add-hook 'rust-mode-hook
          (lambda ()
            (let ((root (locate-dominating-file (buffer-file-name) "Cargo.toml")))
              (when root
                (setq-local compile-command
                            (format "cd %s && cargo run"
                                    (shell-quote-argument (expand-file-name root))))))))

(add-hook 'typst-ts-mode-hook
          (lambda ()
            (let ((root (locate-dominating-file (buffer-file-name) "main.typ")))
              (when root
                (setq-local compile-command
                            (format "cd %s && typst compile main.typ"
                                    (shell-quote-argument (expand-file-name root))))))))

(add-hook 'dired-mode-hook
          (lambda ()
            (setq-local compile-command
                        (format "git clone"))))

(global-auto-revert-mode 1)
