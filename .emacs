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
(add-to-list 'exec-path "C:/Program Files/cygwin64/bin")
(add-to-list 'exec-path "c:/Program Files/OmniSharp/omnisharp-server/OmniSharp/bin/Debug/")

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
 '(haskell-process-type (quote stack-ghci))
 '(hl-paren-background-colors (quote ("#2492db" "#95a5a6" nil)))
 '(hl-paren-colors (quote ("#ecf0f1" "#ecf0f1" "#c0392b")))
 '(package-selected-packages
   (quote
    (helm-projectile flymake-haskell-multi flycheck-ghcmod ac-haskell-process theme-changer ace-window magit ample-theme rainbow-delimiters helm projectile evil-surround linum-relative evil)))
 '(require-final-newline nil)
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
 '(default ((t (:family "Literation Mono Powerline" :foundry "outline" :slant normal :weight normal :height 98 :width normal)))))

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

(projectile-global-mode)
(require 'helm-projectile)
(helm-projectile-on)

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

;; Theme changer
(load-theme 'ample t t)
(load-theme 'ample-flat t t)

(setq calendar-location-name "Kyiv, UA")
(setq calendar-latitude 50.26)
(setq calendar-longitude 30.31)
(require 'theme-changer)
(change-theme 'flatui 'ample-flat)


;; _____________________________
;; Number configuration
(global-linum-mode)

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


;; Folding
(require 'hideshow)
(require 'sgml-mode)
(require 'nxml-mode)

(add-to-list 'hs-special-modes-alist
             '(nxml-mode
               "<!--\\|<[^/>]*[^/]>"
               "-->\\|</[^/>]*[^/]>"

               "<!--"
               sgml-skip-tag-forward
               nil))
(add-hook 'nxml-mode-hook 'hs-minor-mode)
(vimish-fold-global-mode 1)

;; Customizations
(setq tab-width 4)
(setq indent-tabs-mode nil)
;; Align with spaces only
(defadvice align-regexp (around align-regexp-with-spaces)
  "Never use tabs for alignment."
  (let ((indent-tabs-mode nil))
    ad-do-it))
(ad-activate 'align-regexp)
(electric-pair-mode t)

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
  "f" 'hs-toggle-hiding 

  ;; Window bindings
  "wv" 'evil-window-vsplit
  "ws" 'evil-window-split
  "wq" 'delete-window
  "we" 'server-edit
  "wf" 'shrink-window-if-larger-than-buffer
  "wp" 'evil-prev-buffer
  "wn" 'evil-next-buffer
  "wu" 'winner-undo

  ;; Motions
  "j" 'evil-first-non-blank
  "k" 'evil-last-non-blank

  ;; Whitespace Mode
  "sm" 'whitespace-mode
  "sc" 'whitespace-cleanup

  ;; Multiple cursors
  "cj" 'evil-mc-make-and-goto-next-match
  "cs" 'evil-mc-skip-and-goto-next-match

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
  "mb" 'markdown-insert-bold

  ;; Haskell

  ;; Helm bindings
  "hf" 'find-file
  "hr" 'helm-recentf
  "hb" 'helm-buffers-list
  "hp" 'helm-show-kill-ring
  "hj" 'helm-projectile
  "x"  'helm-M-x
  "hk" 'kill-buffer)

;; Evil Multiple Cursors
(require 'evil-mc)
(global-evil-mc-mode  1) 

;; _______
;; C# Mode
(require 'omnisharp)
(add-hook 'csharp-mode-hook 'omnisharp-mode)
(add-hook 'csharp-mode-hook 'flycheck-mode)
(evil-define-key 'insert omnisharp-mode-map (kbd "M-.") 'omnisharp-auto-complete)
(evil-define-key 'normal omnisharp-mode-map (kbd "g d") 'omnisharp-go-to-definition)
(evil-define-key 'normal omnisharp-mode-map (kbd "g u") 'omnisharp-helm-find-usages)
(evil-define-key 'normal omnisharp-mode-map (kbd "g I") 'omnisharp-find-implementations) ; g i is taken
(evil-define-key 'normal omnisharp-mode-map (kbd "g c") 'omnisharp-run-code-action-refactoring)
(evil-define-key 'normal omnisharp-mode-map (kbd "g f") 'omnisharp-fix-code-issue-at-point)
(evil-define-key 'normal omnisharp-mode-map (kbd "g F") 'omnisharp-fix-usings)
(evil-define-key 'normal omnisharp-mode-map (kbd "g R") 'omnisharp-rename)
(evil-define-key 'normal omnisharp-mode-map (kbd ", i") 'omnisharp-current-type-information)
(evil-define-key 'normal omnisharp-mode-map (kbd ", I") 'omnisharp-current-type-documentation)
;;(evil-define-key 'insert omnisharp-mode-map (kbd ".") 'omnisharp-add-dot-and-auto-complete)
(evil-define-key 'normal omnisharp-mode-map (kbd "g t") 'omnisharp-navigate-to-current-file-member)
(evil-define-key 'normal omnisharp-mode-map (kbd "g T") 'omnisharp-navigate-to-solution-member)
(evil-define-key 'normal omnisharp-mode-map (kbd ", n f") 'omnisharp-navigate-to-solution-file-then-file-member)
(evil-define-key 'normal omnisharp-mode-map (kbd ", n F") 'omnisharp-navigate-to-solution-file)
(evil-define-key 'normal omnisharp-mode-map (kbd ", n r") 'omnisharp-navigate-to-region)
(evil-define-key 'normal omnisharp-mode-map (kbd "<f12>") 'omnisharp-show-last-auto-complete-result)
(evil-define-key 'insert omnisharp-mode-map (kbd "<f12>") 'omnisharp-show-last-auto-complete-result)
(evil-define-key 'normal omnisharp-mode-map (kbd ",.") 'omnisharp-show-overloads-at-point)
(evil-define-key 'normal omnisharp-mode-map (kbd ",rl") 'recompile)

(evil-define-key 'normal omnisharp-mode-map (kbd ",rt")
  (lambda() (interactive) (omnisharp-unit-test "single")))

(evil-define-key 'normal omnisharp-mode-map
  (kbd ",rf")
  (lambda() (interactive) (omnisharp-unit-test "fixture")))

(evil-define-key 'normal omnisharp-mode-map
  (kbd ",ra")
  (lambda() (interactive) (omnisharp-unit-test "all")))

(require 'company)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-omnisharp))
(add-hook 'after-init-hook 'global-company-mode)

;; Evil MathcIt Mode
(require 'evil-matchit)
(global-evil-matchit-mode 1)
