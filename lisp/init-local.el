(package-initialize)
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))
(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode t)
  )

(use-package evil
  :ensure t
  :init
  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode 1))


  (setq evil-respect-visual-line-mode t)
  (global-visual-line-mode t)
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode t)
  (evil-set-undo-system 'undo-tree)
  ;; (define-key evil-normal-state-map (kbd "C-r") 'undo-redo)
  (evil-set-initial-state 'calendar-mode 'emacs)
  (evil-set-initial-state 'calculator-mode 'emacs)
  (evil-set-initial-state 'git-rebase-mode 'emacs)
  (evil-set-initial-state 'magit-blame-mode 'emacs)
  (setq-default evil-symbol-word-search t)
  (defvar evil-want-C-g-bindings t)
  (defvar evil-want-C-i-jump (or (daemonp) (display-graphic-p)))
  (defvar evil-want-C-u-scroll t)  ; moved the universal arg to <leader> u
  ;; (defvar evil-want-C-u-delete t)
  (defvar evil-want-C-w-scroll t)
  ;; (defvar evil-want-C-w-delete t)
  (defvar evil-want-Y-yank-to-eol t)
  (defvar evil-want-abbrev-expand-on-insert-exit nil)

  (define-key evil-insert-state-map (kbd "C-SPC") 'toggle-input-method)
  (define-key evil-normal-state-map (kbd ", w") 'buffer-menu)
  (define-key evil-normal-state-map (kbd ", cc") 'compile)
  (define-key evil-normal-state-map (kbd "[") 'evil-scroll-up)
  (define-key evil-normal-state-map (kbd "]") 'evil-scroll-down)
  (define-key evil-visual-state-map (kbd "[") 'evil-scroll-up)
  (define-key evil-visual-state-map (kbd "]") 'evil-scroll-down)
  (global-set-key (kbd "C-h") 'evil-window-left)
  (global-set-key (kbd "C-l") 'evil-window-right)
  (global-set-key (kbd "C-j") 'evil-window-down)
  (global-set-key (kbd "C-k") 'evil-window-up)
  (define-key evil-normal-state-map "_" 'comment-line)
  (define-key evil-visual-state-map "_" 'comment-dwim)
  (define-key evil-normal-state-map (kbd ", w") 'buffer-menu)
  (define-key evil-normal-state-map (kbd "<up>") 'evil-window-increase-height)
  (define-key evil-normal-state-map (kbd "<down>") 'evil-window-decrease-height)
  (define-key evil-normal-state-map (kbd "<right>") 'evil-window-increase-width)
  (define-key evil-normal-state-map (kbd "<left>") 'evil-window-decrease-width)
  (define-key evil-normal-state-map (kbd "g r") 'rgrep)
  (define-key evil-normal-state-map (kbd "; a") 'ff-find-other-file)
  (define-key evil-normal-state-map (kbd ", fed") (lambda() (interactive) (find-file "~/.emacs.d/lisp/init-local.el")))
  (define-key evil-normal-state-map (kbd ", feR") (lambda() (interactive) (load-file "~/.emacs.d/lisp/init-local.el")))
  (define-key evil-normal-state-map (kbd ", gwgw") (lambda() (interactive) (find-file "/sshx:175.123.88.134#3389|sshx:gwgw.com|sshx:aflxvsol12:~")))
  ;; (define-key evil-normal-state-map (kbd ", gwgw") (lambda() (interactive) (find-file "/sshx:gwgw.com|sshx:aflxvsol12:~")))
  (define-key evil-normal-state-map (kbd ", chat") (lambda() (interactive) (find-file "/sshx:175.123.88.134#3389|sshx:gwgw.com|sshx:root@203.238.139.141:~")))
  )
(add-hook 'after-init-hook (lambda () (load-theme 'sanityinc-solarized-dark)))

(use-package counsel-etags
  :ensure t
  :init
  :config
  )

(use-package neotree
  :ensure t
  :init
  :config
  (add-hook 'neotree-mode-hook
            (lambda ()
              (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
              (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-quick-look)
              (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
              (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
              (define-key evil-normal-state-local-map (kbd "g") 'neotree-refresh)
              (define-key evil-normal-state-local-map (kbd "n") 'neotree-next-line)
              (define-key evil-normal-state-local-map (kbd "p") 'neotree-previous-line)
              (define-key evil-normal-state-local-map (kbd "A") 'neotree-stretch-toggle)
              (define-key evil-normal-state-local-map (kbd "H") 'neotree-hidden-file-toggle)))
  )

(use-package powerline
  :ensure t
  :init
  :config (progn
            (use-package airline-themes
              :ensure t
              :config
              (load-theme 'airline-dark t) 
              )))

(setq-default c-basic-offset 4)
(setq-default indent-tabs-mode nil)
(define-key global-map (kbd "<escape>") 'keyboard-escape-quit)
(add-hook 'after-change-major-mode-hook
          (lambda ()
            (modify-syntax-entry ?_ "w")))



(when (maybe-require-package 'cmake-mode)
  (add-to-list 'auto-mode-alist '("CMakeLists\\.txt\\'" . cmake-mode))
  )
(when (maybe-require-package 'go-mode)
  (add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))
  )
(provide 'init-local)

