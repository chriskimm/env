;; add custom locations to the load-path

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/elisp")
(add-to-list 'exec-path "/Users/chriskimm/bin")
(add-to-list 'exec-path "/Users/chriskimm/go/bin") ;; I think this should be somewhere else
(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path "/usr/local/go/bin")


(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

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

;; Enable Paredit
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)

;; Clojure setup
(unless (package-installed-p 'clojure-mode)
  (package-install 'clojure-mode))
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojurescript-mode-hook 'paredit-mode)

(setq cider-repl-display-help-banner nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(markdown-command-needs-filename t)
 '(package-selected-packages
   (quote
    (racket-mode ## utop rjsx-mode exec-path-from-shell protobuf-mode go-mode paredit cider clojure-mode)))
 '(quack-default-program "~/software/Racket_5_0_1/bin/racket")
 '(quack-programs
   (quote
    ("~/software/Racket_5_0_1/bin/racket" "bigloo" "csi" "csi -hygienic" "gosh" "gracket" "gsi" "gsi ~~/syntax-case.scm -" "guile" "kawa" "mit-scheme" "racket" "racket -il typed/racket" "rs" "scheme" "scheme48" "scsh" "sisc" "stklos" "sxi")))
 ;;'(scheme-program-name "racket")
 '(scheme-program-name "scheme")
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
(global-set-key "\M-C"     'compile)
(global-set-key "\C-^"     'next-error)
(global-set-key "\C-\M-g"  'goto-line)
(global-set-key "\C-c\C-c" 'comment-or-uncomment-region)
(global-set-key "\M-g\M-f" 'toggle-frame-fullscreen)
(global-set-key (kbd "<C-tab>") 'auto-complete)
(global-set-key "\C-x\C-b" 'buffer-menu-other-window)

;; use spaces instead of tabs
(setq-default indent-tabs-mode nil)

(fset 'java-println
   "System.out.println(\"\");\C-b\C-b\C-b")
;;(global-set-key "\M-P" 'java-println)
(global-set-key (kbd "M-P l")  'java-println)

;; Markdown mode support
(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown" t)
(add-to-list 'auto-mode-alist '("\\.text" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown" . markdown-mode))

;; file associations
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.scss$" . css-mode))
(add-to-list 'auto-mode-alist '("\\.erb$" . html-mode))

;;; I prefer cmd key for meta
(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier 'none)

;; Golang
(setq-default tab-width 4)
(require 'go-mode)
;; Run gofmt before saving golang files
(add-hook 'before-save-hook #'gofmt-before-save)

(ac-config-default)
(require 'auto-complete-config)
(require 'go-autocomplete)

;; ocaml support: opam path
(add-to-list 'exec-path "/Users/chriskimm/.opam/4.07.1/bin")

;; ocaml support: tuareg
(load "/Users/chriskimm/.opam/4.07.1/share/emacs/site-lisp/tuareg-site-file")

;; ocaml support: merlin
(let ((opam-share (ignore-errors (car (process-lines "opam" "config" "var" "share")))))
  (when (and opam-share (file-directory-p opam-share))
    ;; Register Merlin
    (add-to-list 'load-path (expand-file-name "emacs/site-lisp" opam-share))
    (autoload 'merlin-mode "merlin" nil t nil)
    ;; Automatically start it in OCaml buffers
    (add-hook 'tuareg-mode-hook 'merlin-mode t)
    (add-hook 'caml-mode-hook 'merlin-mode t)
    ;; Use opam switch to lookup ocamlmerlin binary
    ;;(setq merlin-command 'opam)
    (setq merlin-command "/Users/chriskimm/.opam/4.07.1/bin/ocamlmerlin")
    ))

;; ocaml support: utop
;; Add the opam lisp dir to the emacs load path
(add-to-list
 'load-path
 (replace-regexp-in-string
  "\n" "/Users/chriskimm/.opam/4.07.1/share/emacs/site-lisp"
  (shell-command-to-string "opam config var prefix")))

;; Automatically load utop.el
(autoload 'utop "utop" "Toplevel for OCaml" t)

;; Use the opam installed utop
(setq utop-command "opam config exec -- utop -emacs")

(setenv "CAML_LD_LIBRARY_PATH" "/Users/chriskimm/.opam/4.07.1/lib/stublibs")
;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line
(setq merlin-ac-setup 'easy)
