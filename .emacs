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
 '(fringe-mode (quote (0)) nil (fringe))
 '(package-selected-packages
   (quote
    (theme-changer ace-window magit ample-theme rainbow-delimiters helm projectile evil-surround linum-relative evil)))
 '(save-place-mode t nil (saveplace))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil))
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
  "q" 'kill-emacs

  ;; Window bindings
  "wv" 'evil-window-vsplit
  "ws" 'evil-window-split
  "wq" 'delete-window
  "we" 'server-edit
  "wf" 'shrink-window-if-larger-than-buffer

  ;; Motions
  "j" 'evil-first-non-blank
  "k" 'evil-last-non-blank

  ;; Whitespace Mode
  "sm" 'whitespace-mode
  "sc" 'whitespace-cleanup

  ;; Avy bindings
  "af" 'ace-window
  "aw" 'avy-goto-word-1
  "al" 'avy-goto-line

  ;;Magit bindings
  "gs" 'magit-status

  ;; Markdown bindings
  "mh"  'markdown-insert-header
  "mta" 'markdown-insert-header-atx-1
  "mts" 'markdown-insert-header-atx-2
  "mtd" 'markdown-insert-header-atx-3
  "mtf" 'markdown-insert-header-atx-4
  "mtg" 'markdown-insert-header-atx-5

  ;; Helm bindings
  "hf" 'find-file
  "hr" 'helm-recentf
  "hb" 'switch-to-buffer
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
