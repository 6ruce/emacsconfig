;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("org" . "http://orgmode.org/elpa/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
			 ("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")))
(package-initialize)

;; Configuration
(setq inhibit-splash-screen t)
(setq explicit-shell-file-name "C:/Program Files/cygwin64/bin/bash.exe")
(setq shell-file-name explicit-shell-file-name)
(add-to-list 'exec-path "C:/Program Files/cygwin64/bin")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("c1390663960169cd92f58aad44ba3253227d8f715c026438303c09b9fb66cdfb" "ad950f1b1bf65682e390f3547d479fd35d8c66cafa2b8aa28179d78122faa947" "3b24f986084001ae46aa29ca791d2bc7f005c5c939646d2b800143526ab4d323" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" default)))
 '(display-time-mode t)
 '(fci-rule-color "#f1c40f")
 '(fringe-mode (quote (0)) nil (fringe))
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote stack-ghci))
 '(hl-paren-background-colors (quote ("#2492db" "#95a5a6" nil)))
 '(hl-paren-colors (quote ("#ecf0f1" "#ecf0f1" "#c0392b")))
 '(package-selected-packages
   (quote
    (helm-swoop grizzl company-quickhelp flycheck-haskell company-ghci helm-projectile ac-haskell-process theme-changer ace-window magit ample-theme rainbow-delimiters helm projectile evil-surround linum-relative evil)))
 '(save-place-mode t nil (saveplace))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(sml/active-background-color "#34495e")
 '(sml/active-foreground-color "#ecf0f1")
 '(sml/inactive-background-color "#dfe4ea")
 '(sml/inactive-foreground-color "#34495e")
 '(tool-bar-mode nil)
 '(vc-annotate-background "#ecf0f1")
 '(vc-annotate-color-map
   (quote
    ((30 . "#e74c3c")
     (60 . "#c0392b")
     (90 . "#e67e22")
     (120 . "#d35400")
     (150 . "#f1c40f")
     (180 . "#d98c10")
     (210 . "#2ecc71")
     (240 . "#27ae60")
     (270 . "#1abc9c")
     (300 . "#16a085")
     (330 . "#2492db")
     (360 . "#0a74b9"))))
 '(vc-annotate-very-old-color "#0a74b9"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Literation Mono Powerline" :foundry "outline" :slant normal :weight normal :height 113 :width normal)))))

;; ___________________
;; Magit Configuration
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

;; __________________
;; Helm Configuration
(require 'helm)
(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-r") 'helm-recentf)
(helm-autoresize-mode 1)

(require 'helm-swoop)
;; From helm-swoop to helm-multi-swoop-all
(global-set-key (kbd "M-i") 'helm-swoop-from-evil-search)
;; Instead of helm-multi-swoop-all, you can also use helm-multi-swoop-current-mode
(define-key helm-swoop-map (kbd "M-m") 'helm-multi-swoop-current-mode-from-helm-swoop)
;; Move up and down like isearch
(define-key helm-swoop-map (kbd "C-k") 'helm-previous-line)
(define-key helm-swoop-map (kbd "C-j") 'helm-next-line)
(define-key helm-multi-swoop-map (kbd "C-k") 'helm-previous-line)
(define-key helm-multi-swoop-map (kbd "C-j") 'helm-next-line)
(setq helm-multi-swoop-edit-save t)
(setq helm-swoop-split-with-multiple-windows t)
(setq helm-swoop-split-direction 'split-window-vertically)
(setq helm-swoop-use-line-number-face t)

(projectile-global-mode)

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(require 'powerline)
(powerline-center-theme)
(add-hook 'desktop-after-read-hook 'powerline-reset)

;; __________________
;; Avy Jump Configuration
(require 'ace-window)
(require 'avy)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))

;; _____________________________
;; Relative number configuration
(global-linum-mode)
(require 'linum-relative)

(require 'rect-mark)
;; ________
;; Org mode
(setq org-log-done 'time)
(setq org-todo-keywords
       '((sequence "TODO" "INPROGRESS" "ONHOLD" "|" "DONE" "REJECT")))
(setq org-todo-keyword-faces
      '(("TODO"       . (:foreground "DarkOrange1"  :weight bold))
	("REJECT"     . (:foreground "forest green" :weight bold))
        ("INPROGRESS" . (:foreground "sea green"))
        ("ONHOLD"     . (:foreground "light sea green"))))
;; _____________
;; Markdown Mode
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; Customizations
(setq tab-width 4)
(setq indent-tabs-mode nil)
;; Align with spaces only
(defadvice align-regexp (around align-regexp-with-spaces)
  "Never use tabs for alignment."
  (let ((indent-tabs-mode nil))
    ad-do-it))
(ad-activate 'align-regexp)

(setq evil-emacs-state-cursor    '("red" box))
(setq evil-normal-state-cursor   '("green" box))
(setq evil-visual-state-cursor   '("orange" box))
(setq evil-insert-state-cursor   '("red" bar))
(setq evil-replace-state-cursor  '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))
(when (fboundp 'winner-mode)
      (winner-mode 1))

;; _______________________
;; Evil Mode Configuration
(require 'evil)
(evil-mode t)

(require 'evil-surround)
(global-evil-surround-mode 1)

(require 'evil-leader)
(setq evil-leader/no-prefix-mode-rx '("magit-.*-mode" "gnus-.*-mode"))
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key
  ;; General
  "q" 'save-buffers-kill-emacs
  ";" 'save-buffer

  ;; Window bindings
  "wv" 'evil-window-vsplit
  "ws" 'evil-window-split
  "wq" 'delete-window
  "we" 'server-edit
  "wf" 'shrink-window-if-larger-than-buffer
  "wp" 'evil-prev-buffer
  "wu" 'winner-undo

  ;; Motions
  "j" 'evil-first-non-blank
  "k" 'evil-last-non-blank

  ;; Helm Swoop
  "hv" 'helm-swoop
  "hs" 'helm-swoop-from-evil-search

  ;; Whitespace Mode
  "sm" 'whitespace-mode
  "sc" 'whitespace-cleanup

  ;; Avy bindings
  "af" 'ace-window
  "aw" 'avy-goto-word-1
  "al" 'avy-goto-line
  "ac" 'avy-goto-char

  ;;Magit bindings
  "gs" 'magit-status

  ;; Markdown bindings
  "mh"  'markdown-insert-header
  "mta" 'markdown-insert-header-atx-1
  "mts" 'markdown-insert-header-atx-2
  "mtd" 'markdown-insert-header-atx-3
  "mtf" 'markdown-insert-header-atx-4
  "mtg" 'markdown-insert-header-atx-5

  ;; Haskell
  ;; Projectile
  "pf" 'projectile-find-file
  "ps" 'projectile-switch-project

  ;; Helm bindings
  "hf" 'find-file
  "hr" 'helm-recentf
  "hb" 'helm-buffers-list
  "hp" 'helm-show-kill-ring
  "x"  'helm-M-x
  "hk" 'kill-buffer)

(load-theme 'ample t t)
(load-theme 'ample-flat t t)

(setq calendar-location-name "Kyiv, UA")
(setq calendar-latitude 50.26)
(setq calendar-longitude 30.31)
(require 'theme-changer)
(change-theme 'flatui 'ample-flat)

;; Haskell
(company-quickhelp-mode 1)
(require 'haskell-mode)
(define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
(add-hook 'haskell-mode-hook 'haskell-doc-mode)
(add-hook 'haskell-mode-hook 'haskell-indentation-mode)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook 'haskell-decl-scan-mode)
(setq haskell-process-type 'stack-ghci)
(setq haskell-process-path-ghci "stack")
(setq haskell-process-args-ghci "ghci")


(require 'flycheck)
(require 'flycheck-haskell)
(add-hook 'haskell-mode-hook 'flycheck-mode)
(add-hook 'flycheck-mode-hook 'flycheck-haskell-configure)

(require 'company)
(require 'company-ghci)
(push 'company-ghci company-backends)
(add-hook 'haskell-mode-hook 'company-mode)

(provide '.emacs)
;;; .emacs ends here
