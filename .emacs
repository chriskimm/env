;; add custom locations to the load-path
(add-to-list 'load-path "~/software/emacs")
(add-to-list 'load-path "~/.emacs.d/lisp")

;; initial window size
(setq default-frame-alist
          '((top . 2) (left . 2)
            (width . 120) (height . 60)))

;; don't make backup files
(setq make-backup-files nil)

;; enable horizontal scrolling
(setq auto-hscroll-mode t)

;; Display column number.
(column-number-mode 1)

;; dispable the splash screen
(setq inhibit-splash-screen t)

;; Font Locking
(global-font-lock-mode 1)
;; maximum colors
(setq font-lock-maximum-decoration t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inferior-lisp-program "java -cp ~/software/clojure-1.1.0/clojure.jar clojure.main")
 '(markdown-command-needs-filename t)
 '(quack-default-program "~/software/Racket_5_0_1/bin/racket")
 '(quack-programs (quote ("~/software/Racket_5_0_1/bin/racket" "bigloo" "csi" "csi -hygienic" "gosh" "gracket" "gsi" "gsi ~~/syntax-case.scm -" "guile" "kawa" "mit-scheme" "racket" "racket -il typed/racket" "rs" "scheme" "scheme48" "scsh" "sisc" "stklos" "sxi")))
 '(scheme-program-name "racket")
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(transient-mark-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; enable copy-paste between emacs and other apps
(setq x-select-enable-clipboard t)

;; extra key bindings
(global-set-key "\M-C" 'compile)
(global-set-key "\C-^" 'next-error)
(global-set-key "\C-\M-g" 'goto-line)
(global-set-key "\C-c\C-c" 'comment-or-uncomment-region)

;; use spaces instead of tabs
(setq-default indent-tabs-mode nil)

(fset 'java-println
   "System.out.println(\"\");\C-b\C-b\C-b")
;;(global-set-key "\M-P" 'java-println)
(global-set-key (kbd "M-P l")  'java-println)

;; Markdown mode support
(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '("\\.text" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.md" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.markdown" . markdown-mode) auto-mode-alist))

;; file associations
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.scss$" . css-mode))
(add-to-list 'auto-mode-alist '("\\.erb$" . html-mode))

;; Column marker
;; (require 'column-marker)
;; (add-hook 'ruby-mode-hook (lambda () (interactive) (column-marker-1 80)))

;;; I prefer cmd key for meta
(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier 'none)

