(prelude-require-packages '(dracula-theme
                            cider-eval-sexp-fu
                            aggressive-indent
                            flycheck-clj-kondo
                            neotree
                            buffer-move
                            clj-refactor
                            adoc-mode
                            groovy-mode
                            fira-code-mode))

(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

(disable-theme 'zenburn)
(load-theme 'dracula t)

(require 'flycheck-clj-kondo)
(require 'clj-refactor)
(require 'fira-code-mode)

;; List of ligatures to turn off
(custom-set-variables '(fira-code-mode-disabled-ligatures '("x")))

(autoload 'adoc-mode "adoc-mode" nil t)

(setq cljr-warn-on-eval nil)

(defun my-clojure-mode-hook ()
  (clj-refactor-mode 1)
  (yas-minor-mode 1) ; for adding require/use/import statements
  ;; This choice of keybinding leaves cider-macroexpand-1 unbound
  (cljr-add-keybindings-with-prefix "C-c C-m"))

(add-hook 'clojure-mode-hook #'aggressive-indent-mode)
(add-hook 'clojure-mode-hook #'my-clojure-mode-hook)
(add-hook 'prog-mode-hook 'fira-code-mode)
(add-hook 'prog-mode-hook 'hs-minor-mode)

;; Remove lines-trail (different color in lines above 80 chars) from whitespace-mode when editing text files
(add-hook 'text-mode-hook '(lambda ()
                             (interactive)
                             (whitespace-mode 0)
                             (setq whitespace-style '(face tabs empty trailing))
                             (whitespace-mode 1)))

(global-set-key (kbd "<C-s-up>")     'buf-move-up)
(global-set-key (kbd "<C-s-down>")   'buf-move-down)
(global-set-key (kbd "<C-s-left>")   'buf-move-left)
(global-set-key (kbd "<C-s-right>")  'buf-move-right)

(setq cider-repl-display-help-banner nil)

;; Turn off scrollbars
(toggle-scroll-bar -1)

(delete-selection-mode 1)

(setq initial-scratch-message nil)
(global-linum-mode t)
