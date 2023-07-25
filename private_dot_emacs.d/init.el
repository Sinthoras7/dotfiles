;; -*- lexical-binding: t; -*-
;; This lexical binding is important for the custom function my/org-roam-filter-by-tag. I have no idea what it does



  ;; Set the garbage collector to a high number to improve startup performance, later reset by 'gchm'
      (setq gc-cons-threshold most-positive-fixnum)

      ;; Inhibit unnecessary redisplays during startups
      (setq-default inhibit-redisplay t
        inhibit-message t)
      (add-hook 'window-setup-hook
          (lambda ()
            (setq-default inhibit-redisplay nil
              inhibit-message nil)
            (redisplay)))

      ;; Disable startup screen
      (setq inhibit-startup-screen t)
      (setq inhibit-startup-echo-area-message t)
      (setq inhibit-startup-message t)

;; NOTE: init.el is now generated from Emacs.org.  Please edit that file
;;       in Emacs and init.el will be generated automatically!

;; You will most likely need to adjust this font size for your system!
(defvar lb/default-font-size 120)
(defvar lb/default-variable-font-size 120)

;; ;; Initialize package sources
;; (require 'package)

 ;; (setq package-archives '(("melpa" . "https://melpa.org/packages/")
;;                           ("org" . "https://orgmode.org/elpa/")
;;                           ("elpa" . "https://elpa.gnu.org/packages/")))

;;
;; (package-initialize)
;; (unless package-archive-contents
;;   (package-refresh-contents))

;;   ;; Initialize use-package on non-Linux platforms
;; (unless (package-installed-p 'use-package)
;;   (package-install 'use-package))

;; (require 'use-package)
;; (setq use-package-always-ensure t)

(setq package-enable-at-startup nil)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

(use-package dashboard
 ; :if (< (length command-line-args) 2)
 :config (dashboard-setup-startup-hook)
 )

;; For Emacs Daemon
(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))


(setq dashboard-startup-banner 'logo)
(setq dashboard-center-content t)
(setq dashboard-set-init-info t)

(setq dashboard-items '((recents  . 10)
                        (bookmarks . 5)
                        ;(projects . 0)
                        ;(agenda . 0)
                        ;(registers . 0)
                       )
)

(setq dashboard-footer-messages '(
            "Bankraub: Eine Inititive von Dilettanten. Wahre Profis gründen eine Bank."
            "Never attribute to malice that which is adequately explained by stupidity."
            "Have a nice day!"
                                 )
)

(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . fullheight))

;; (defun lb/display-startup-time ()
;;   (message "Emacs loaded in %s with %d garbage collections."
;;            (format "%.2f seconds"
;;                    (float-time
;;                    (time-subtract after-init-time before-init-time)))
;;            gcs-done))

;; (add-hook 'emacs-startup-hook #'lb/display-startup-time)

(setq use-package-compute-statistics t)

(use-package gcmh
  :init (gcmh-mode 1))

(use-package no-littering)
;(require 'recentf)
;(add-to-list 'recentf-exclude no-littering-var-directory)
;(add-to-list 'recentf-exclude no-littering-etc-directory)

(setq backup-directory-alist `(("." . ,(expand-file-name "tmp/backups/" user-emacs-directory))))

(auto-save-mode 1)
;; auto-save-mode doesn't create the path automatically!
(make-directory (expand-file-name "tmp/auto-saves/" user-emacs-directory) t)
(setq auto-save-list-file-prefix (expand-file-name "tmp/auto-saves/sessions/" user-emacs-directory)
      auto-save-file-name-transforms `((".*" ,(expand-file-name "tmp/auto-saves/" user-emacs-directory) t)))

(recentf-mode 1)

(setq history-length 25)
(savehist-mode 1)
(save-place-mode 1) ; Remember and restore the last cursor location of openened files


(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)

;; Revert Dired and other buffers
(setq global-auto-revert-non-file-buffers t)

;; Revert buffers when the underlying file has changed
(global-auto-revert-mode 1)

(setq x-select-enable-clipboard t) ; Emacs yanks yank to the system keyboard

(use-package move-text)
(move-text-default-bindings)

(delete-selection-mode)

(set-default-coding-systems 'utf-8)

;; (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
;; (setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
;; (setq scroll-step 1) ;; keyboard scroll one line at a time

;; Make scrolling less stuttered
(setq auto-window-vscroll nil)
(customize-set-variable 'fast-but-imprecise-scrolling t)
(customize-set-variable 'scroll-conservatively 101)
(customize-set-variable 'scroll-margin 0)
(customize-set-variable 'scroll-preserve-screen-position t)

;;  (use-package good-scroll)
;;  (good-scroll-mode 1)

;;Don't warn for large files (shows up when launching videos)
(setq large-file-warning-threshold nil)

;;Don't warn for following symlinked files
(setq vc-follow-symlinks t)

;;Don't warn when advice is added for functions
;(setq ad-redefinition-action 'accept)

(setq-default tab-width 2)
(setq-default evil-shift-width tab-width)

(setq-default indent-tabs-mode nil)

(use-package ws-butler
  :hook ((text-mode . ws-butler-mode)
         (prog-mode . ws-butler-mode)))

;; (electric-pair-mode 1)

(use-package golden-ratio-scroll-screen)
(require 'golden-ratio-scroll-screen)
(global-set-key [remap scroll-down-command] 'golden-ratio-scroll-screen-down)
(global-set-key [remap scroll-up-command] 'golden-ratio-scroll-screen-up)

;; Better support for files with long lines
(setq-default bidi-paragraph-direction 'left-to-right)
(setq-default bidi-inhibit-bpa t)
(global-so-long-mode 1)

(use-package savehist
  :init (savehist-mode))

(global-set-key (kbd "M-u") 'upcase-dwim)
(global-set-key (kbd "M-l") 'downcase-dwim)
(global-set-key (kbd "M-c") 'capitalize-dwim)

(use-package evil-nerd-commenter
  :bind ("M-/" . evilnc-comment-or-uncomment-lines))

(setq window-divider-default-places t
      window-divider-default-bottom-width 1
      window-divider-default-right-width 1)

(window-divider-mode)

(fset 'yes-or-no-p 'y-or-n-p)

(setq inhibit-startup-message t)

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)           ; Disable the toolbar
;(tooltip-mode -1)           ; Disable tooltips
;(set-fringe-mode 10)        ; Give some breathing room
(global-visual-line-mode 1)  ; Proper line wrapping
(set-fringe-mode '(0 . 0))   ; Disable fringe because I use visual-line-mode

(menu-bar-mode -1)           ; Disable the menu bar

(use-package beacon)
(beacon-mode 1)
;; Set up the visible bell
(setq visible-bell t)

(hl-line-mode 1) ; highlights the current line
;; (blink-cursor-mode -1) ; disables blinking cursor
(setq-default cursor-type 'bar)

(setq calendar-week-start-day 1); Calender should start on Monday

(column-number-mode)
  (global-display-line-numbers-mode t)

  ;; Disable line numbers for some modes
  (dolist (mode '(org-mode-hook
                  term-mode-hook
                  shell-mode-hook
                  eshell-mode-hook))
    (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; Override some modes which derive from the above
(dolist (mode '(org-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(set-face-attribute 'default nil :font "Fira Code Retina" :height lb/default-font-size)

;; Set the fixed pitch face
(set-face-attribute 'fixed-pitch nil :font "Fira Code Retina" :height lb/default-font-size)

;; Set the variable pitch face
(set-face-attribute 'variable-pitch nil :font "Cantarell" :height lb/default-font-size :weight 'regular)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package paren
  :config
  (set-face-attribute 'show-paren-match-expression nil :background "#363e4a")
  (show-paren-mode 1))

(use-package general
  :config
  (general-create-definer lb/leader-keys
    :prefix "C-c"
  )

  (lb/leader-keys
    "t"  '(:ignore t :which-key "toggles")
    "tt" '(counsel-load-theme :which-key "choose theme")))

; Example for how to set up keybindings using general
;(general-define-key
; "C-M-j" 'counsel-switch-buffer)

;; Make ESC quit prompts
;; (global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(customize-set-variable 'evil-want-keybinding nil)

  (use-package evil)
  (use-package evil-collection)


  (when ( < emacs-major-version 28)
   (use-package undo-tree)
   (global-undo-tree-mode)
  )



  (customize-set-variable 'evil-want-integration t)
  (customize-set-variable 'evil-want-C-i-jump nil)
  (customize-set-variable 'evil-respect-visual-line-mode t)
  ;; C-h is backspace in insert state
  (customize-set-variable 'evil-want-C-h-delete t)
  (if (< emacs-major-version 28)
    (customize-set-variable 'evil-undo-system 'undo-tree)
    (customize-set-variable 'evil-undo-system 'undo-redo)
  )



    (customize-set-variable 'evil-want-C-i-jump t)
;;  (customize-set-variable 'evil-want-Y-yank-to-eol nil)
    (customize-set-variable 'evil-want-fine-undo t)


    (customize-set-variable 'evil-emacs-state-cursor 'hbar)

;; Load Evil and enable it globally
  ;; (require 'evil)
  (evil-mode 1)


  ;; Make evil search more like vim
  (evil-select-search-module 'evil-search-module 'evil-search)
  (customize-set-variable 'evil-want-C-u-scroll t)
  ;; Make C-g revert to normal state
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)


  ;; Rebind `universal-argument' to 'C-M-u' since 'C-u' now scrolls the buffer
(global-set-key (kbd "C-M-u") 'universal-argument)

;; Use visual line motions even outside of visual-line-mode buffers
(evil-global-set-key 'motion "j" 'evil-next-visual-line)
(evil-global-set-key 'motion "k" 'evil-previous-visual-line)

(defun crafted-evil/discourage-arrow-keys ()
  (interactive)
  (message "Use HJKL keys instead!"))


;; Disable arrow keys in normal and visual modes
  (define-key evil-normal-state-map (kbd "<left>") 'crafted-evil/discourage-arrow-keys)
  (define-key evil-normal-state-map (kbd "<right>") 'crafted-evil/discourage-arrow-keys)
  (define-key evil-normal-state-map (kbd "<down>") 'crafted-evil/discourage-arrow-keys)
  (define-key evil-normal-state-map (kbd "<up>") 'crafted-evil/discourage-arrow-keys)
  (evil-global-set-key 'motion (kbd "<left>") 'crafted-evil/discourage-arrow-keys)
  (evil-global-set-key 'motion (kbd "<right>") 'crafted-evil/discourage-arrow-keys)
  (evil-global-set-key 'motion (kbd "<down>") 'crafted-evil/discourage-arrow-keys)
  (evil-global-set-key 'motion (kbd "<up>") 'crafted-evil/discourage-arrow-keys)

(dolist (mode '(custom-mode
                eshell-mode
                term-mode))
  (add-to-list 'evil-emacs-state-modes mode))

(evil-collection-init)

(use-package evil-goggles
    :config
    (evil-goggles-mode)
    (evil-goggles-use-diff-faces)
)


(setq evil-goggles-pulse t) ;; default is to pulse when running in a graphic display

(use-package command-log-mode)

(use-package modus-themes)

(setq modus-themes-region '(bg-only))

(setq modus-themes-paren-match '(bold intense))
(setq modus-themes-bold-constructs t)
(setq modus-themes-italic-constructs t)

(setq modus-themes-syntax '(yellow-comments))

(setq modus-themes-org-blocks 'tinted-background)

(setq modus-themes-tabs-accented t
            modus-themes-prompts '(bold intense)
            modus-themes-fringes 'subtle)

(load-theme 'modus-vivendi t)

(use-package all-the-icons
        :if (display-graphic-p))

      (use-package doom-modeline
        :init (doom-modeline-mode 1)
       ;:custom ((doom-modeline-height 10))
       )


(setq doom-modeline-height 10
      doom-modeline-bar-width 6
      ;doom-modeline-minor-modes t
      doom-modeline-buffer-file-name-style 'truncate-except-project)

(use-package which-key  
  :diminish which-key-mode
  :config
  (which-key-mode)
  (setq which-key-idle-delay 1))

(defun lb/minibuffer-backward-kill (arg)
  "When minibuffer is completing a file name delete up to parent folder, otherwise delete a word

   ARG is the thing being completed in the minibuffer."
  (interactive "p")
  (if minibuffer-completing-file-name
      ;; Borrowed from https://github.com/raxod502/selectrum/issues/498#issuecomment-803283608
      (if (string-match-p "/." (minibuffer-contents))
          (zap-up-to-char (- arg) ?/)
        (delete-minibuffer-contents))
      (backward-kill-word arg))
)

;; Just needed if straight is used, otherwise delete or comment it
  (add-to-list 'load-path
              (expand-file-name "straight/build/vertico/extensions"
                               straight-base-dir))

;; Here the real deal begins
    (use-package vertico
       :bind (
                :map minibuffer-local-map
                ("M-h" . lb/minibuffer-backward-kill)) ;"<Backspace>"
       :custom
       (vertico-cycle t)
       :init
       (vertico-mode)
    )

  (with-eval-after-load 'evil
    (define-key vertico-map (kbd "C-j") 'vertico-next)
    (define-key vertico-map (kbd "C-k") 'vertico-previous)
    (define-key vertico-map (kbd "M-h") 'vertico-directory-up))

    (define-key vertico-map (kbd "M-h") 'lb/minibuffer-backward-kill)

(use-package marginalia
    :after vertico
    :custom
    (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
    :init (marginalia-mode))

(use-package consult
       :bind ("C-s" . consult-line))


(define-key minibuffer-local-map (kbd "C-r") 'consult-history)

(setq completion-in-region-function #'consult-completion-in-region)

(use-package emacs
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; We display [CRM<separator>], e.g., [CRM,] if the separator is a comma.
  (defun crm-indicator (args)
    (cons (format "[CRM%s] %s"
                  (replace-regexp-in-string
                   "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                   crm-separator)
                  (car args))
          (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Emacs 28: Hide commands in M-x which do not work in the current mode.
  ;; Vertico commands are hidden in normal buffers.
   (setq read-extended-command-predicate
         #'command-completion-default-include-p)

  ;; Enable recursive minibuffers
  (setq enable-recursive-minibuffers t))

;; Optionally use the `orderless' completion style.
(use-package orderless
  :init
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (setq orderless-style-dispatchers '(+orderless-dispatch)
  ;;       orderless-component-separator #'orderless-escapable-split-on-space)
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion))))
)

;; Comment the other thing if this kind of completion without substring is not fitting
;;(setq completion-styles '(substring orderless basic))
(customize-set-variable 'completion-styles '(orderless basic))

(use-package compat
  :straight t)

(use-package embark
  :straight t)
(use-package embark-consult
  :straight t)

(global-set-key [remap describe-bindings] #'embark-bindings)
(global-set-key (kbd "C-.") 'embark-act)

;; Use Embark to show bindings in a key prefix with `C-h`
(setq prefix-help-command #'embark-prefix-help-command)

(with-eval-after-load 'embark-consult
  (add-hook 'embark-collect-mode-hook #'consult-preview-at-point-mode))

;; This is needed for straight installation:
  ;(add-to-list 'load-path
  ;             (expand-file-name "straight/build/corfu/extensions"
  ;                               straight-base-dir))

  (use-package corfu
    :straight (:files (:defaults "extensions/*")))


(unless (display-graphic-p)
  (require 'corfu-terminal)
  (corfu-terminal-mode +1))

;; Setup corfu for popup like completion
(customize-set-variable 'corfu-cycle t) ; Allows cycling through candidates
(customize-set-variable 'corfu-auto t)  ; Enable auto completion
(customize-set-variable 'corfu-auto-prefix 1) ; Complete with less prefix keys
(customize-set-variable 'corfu-auto-delay 0.5) ; No delay for completion
(customize-set-variable 'corfu-echo-documentation 0.25) ; Echo docs for current completion option

(global-corfu-mode 1)
(corfu-popupinfo-mode 1)
(eldoc-add-command #'corfu-insert)
(define-key corfu-map (kbd "M-p") #'corfu-popupinfo-scroll-down)
(define-key corfu-map (kbd "M-n") #'corfu-popupinfo-scroll-up)
(define-key corfu-map (kbd "M-d") #'corfu-popupinfo-toggle)


;; Deactivate Corfu in org and latex files:
(add-hook 'org-mode-hook (lambda () (corfu-mode -1)))
(add-hook 'LaTeX-mode-hook (lambda () (corfu-mode -1)))

;; Setup Cape for better completion-at-point support and more
(use-package cape)

;; Add useful defaults completion sources from cape
(add-to-list 'completion-at-point-functions #'cape-file)
(add-to-list 'completion-at-point-functions #'cape-dabbrev)

;; Silence the pcomplete capf, no errors or messages!
;; Important for corfu
(advice-add 'pcomplete-completions-at-point :around #'cape-wrap-silent)

;; Ensure that pcomplete does not write to the buffer
;; and behaves as a pure `completion-at-point-function'.
(advice-add 'pcomplete-completions-at-point :around #'cape-wrap-purify)
(add-hook 'eshell-mode-hook
          (lambda () (setq-local corfu-quit-at-boundary t
                            corfu-quit-no-match t
                            corfu-auto nil)
            (corfu-mode)))

(use-package helpful
    ;:custom
    ;(counsel-describe-function-function #'helpful-callable)
    ;(counsel-describe-variable-function #'helpful-variable)
    :bind
    ([remap describe-function] . helpful-callable) ;counsel-describe-function-function
    ([remap describe-command] . helpful-command)
    ([remap describe-variable] . helpful-variable) ;counsel-describe-variable-function
    ([remap describe-symbol] . helpful-symbol)
    ([remap describe-key] . helpful-key))



(global-set-key (kbd "C-h F") #'helpful-function)
;; Bind extra `describe-*' commands
(global-set-key (kbd "C-h K") #'describe-keymap)

(use-package eglot)

(use-package eldoc-box
  :commands (eldoc-box-hover-mode eldoc-box-hover-at-point-mode)
  :custom
  (eldoc-box-clear-with-C-g t))

;; (use-package eglot-ltex
;;   :straight
;;   (:host github :repo "emacs-languagetool/eglot-ltex")
;;   :hook (text-mode . (lambda ()
;;                        (require 'eglot-ltex)
;;                        (eglot-ensure)))
;;         (org-mode . (lambda ()
;;                        (require 'eglot-ltex)
;;                        (eglot-ensure)))
;;         (markdown-mode . (lambda ()
;;                        (require 'eglot-ltex)
;;                        (eglot-ensure)))
;;   :init
;;   (setq eglot-languagetool-server-path "~/Sync/Diverses/Programme/ltex-ls-16.0.0-linux-x64/ltex-ls-16.0.0/")
;; )

(use-package elpy
  :init
  (elpy-enable))

;;   (defun lb/lsp-mode-setup ()
;;   (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
;;   (lsp-headerline-breadcrumb-mode))

;; (use-package lsp-mode
;;   :commands (lsp lsp-deferred)
;;   :hook (lsp-mode . lb/lsp-mode-setup)
;;   :init
;;   (setq lsp-keymap-prefix "C-c l")  ;; Or 'C-l', 's-l'
;;   :config
;;   (lsp-enable-which-key-integration t))

;; (use-package lsp-ui
;;   :hook (lsp-mode . lsp-ui-mode)
;;   :custom
;;   (lsp-ui-doc-position 'bottom))

;; (setq lsp-latex-forward-search-executable "evince-synctex")
;; (setq lsp-latex-forward-search-args '("-f" "%l" "%p" "\"emacsclient +%l %f\""))

;; (use-package flycheck
;;   :straight t
;;   :init (global-flycheck-mode))

(defun lb/org-font-setup ()

  ;; Set faces for heading levels
  (dolist (face '((org-level-1 . 1.4)
                  (org-level-2 . 1.3)
                  (org-level-3 . 1.2)
                  (org-level-4 . 1.1)
                  (org-level-5 . 1.05)
                  (org-level-6 . 1.05)
                  (org-level-7 . 1.05)
                  (org-level-8 . 1.05)))
    (set-face-attribute (car face) nil :font "Cantarell" :weight 'regular :height (cdr face)))

  ;; Ensure that anything that should be fixed-pitch in Org files appears that way
  (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-table nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch))

(defun lb/org-mode-setup ()
        (org-indent-mode)
        (variable-pitch-mode 1)
        (visual-line-mode 1))

      (use-package org
        :commands (org-agenda org-capture)
        :hook (org-mode . lb/org-mode-setup)
        :config
        (setq org-ellipsis " ▾")

        ; I could just write them in a list
        ;(setq org-agenda-files '("~/Sync/ALT-Org/") )

        ;; This would be all files
        ;; (setq org-agenda-files (directory-files-recursively "~/Sync/Org" "\\.org$"))


        ;; You can also filter out certain directory from lookup by adding a array filter. Example, filtering out all org files in xxxx/xxx/daily/ directory:
         (setq org-agenda-files
          (seq-filter (lambda(x) (not (string-match "/Roam/"(file-name-directory x))))
           (directory-files-recursively "~/Sync/Org" "\\.org$")
          )
         )

        (setq org-agenda-start-with-log-mode t)
        (setq org-log-done 'time)
        (setq org-log-into-drawer t)

        (setq org-todo-keywords
          '((sequence "SOMEDAY(s!)" "WAIT(w!)" "TODO(t!)" "NEXT(n!)" "|" "DONE(d!)" "CANC(c@!)")
          ;  (sequence "BACKLOG(b)" "PLAN(p)" "READY(r)" "ACTIVE(a)" "REVIEW(v)" "WAIT(w@/!)" "HOLD(h)" "|" "COMPLETED(c)" "CANC(k@)")
          ;  (sequence "WAIT(w@)" "TODO(t!)" "NEXT(n!)" "|" "DONE(d!)")
          )
        )




      ;;(setq org-refile-targets
      ;; '(("~/Sync/Org/2-scheduled-waiting.org" :maxlevel . 1)
      ;;   ("~/Sync/Org/2-waiting.org" :maxlevel . 1))
      ;; )

      ;;(setq org-refile-targets
      ;; '(("5-archive.org" :maxlevel . 1))
      ;;)

      (setq org-refile-use-outline-path 'file)
      (setq org-refile-targets '((org-agenda-files :level . 1)))


    ;; Save Org buffers after refiling!
    ;; (advice-add 'org-refile :after 'org-save-all-org-buffers)
    ;; According to this issue https://github.com/Trevoke/org-gtd.el/issues/178 this is causing my error with org-gtd.
       (advice-add 'org-refile :after #'(lambda (&rest _) (org-save-all-org-buffers))) ;; This should fix the error and is better
    ;(setq org-archive-location '(("~/Sync/Org/5-archive.org" )))


    (setq org-archive-location (concat "~/Sync/Org/archive/archive-"
                                 (format-time-string "%Y-%m" (current-time))
                                 ".org_archive::"))



    (setq org-tag-alist
      '((:startgroup)
         ; Put mutually exclusive tags here
         (:endgroup)
         ("@errand" . ?e)
         ("@home" . ?h)
         ("@PC" . ?p)
         ("@recherche" . ?r)
         ("@neustadt" . ?n)
         ("@mail" . ?m)
         ("@call" . ?c)
         ("@phone" . ?P)
         ("@zug" . ?z)
         ("@uni" . ?u)
         ("kaufland" . ?k)
         ("onlineshop" . ?o)
         ("FSI" . ?f)
         ("FSV" . ?F)
         ))

    ;; Configure custom agenda views
    (setq org-agenda-custom-commands
     '(
       ("d" "Dashboard"
        ((agenda "" ((org-deadline-warning-days 7)))
          (todo "NEXT"
           ((org-agenda-overriding-header "Next Tasks"))
          )
          (tags-todo "agenda/ACTIVE"
           ((org-agenda-overriding-header "Active Projects"))
          )
        ))

      ;; ("n" "Next Tasks"
      ;;  ((todo "NEXT"
      ;;     ((org-agenda-overriding-header "Next Tasks"))
      ;;  ))
      ;; )

       ;; ("n" "Next actions by tag"
       ;; (lambda (arg)
       ;;   (interactive)
       ;;   (let my-tag (completing-read "Tag: " (mapcar 'car org-tag-alist)))
       ;;   (org-tags-view nil (format "+%s" my-tag))
       ;;   (org-agenda-list nil "+TODO=\"NEXT\"")
       ;;  ))


       ;; The next function does not work for some reason... Maybe ask stackexchange
       ("n" "Next actions by tag"
       (lambda (arg)
         (interactive)
         (setq my-tag (completing-read "Tag: " (mapcar 'car org-tag-alist)))

         (org-ql-block '(and (todo "NEXT")
                            (tags (format "%s" my-tag))
                        )
                      ((org-ql-block-header (format "NEXT tasks, whose tags match: %s" my-tag)))
                      (agenda)
         )
        )
       )



      ("z" "Im Zug" tags-todo "@zug"
          ((org-agenda-overriding-header "Eignet sich für Zugfahrt"))
       )

      ("N" "In Neustadt"
       ((org-ql-block '(and (todo "NEXT")
                            (tags "@neustadt")
                       )
                      ((org-ql-block-header "Was in Neustadt dringend getan werden muss"))
                      (agenda)
         ))
       )
       ("p" "Am PC"
       ((org-ql-block '(and (todo "NEXT" "TODO" )
                            (tags "@PC")
                       )
                      ((org-ql-block-header "Was am PC getan werden muss"))
                      (agenda)
         ))
       )
       ("h" "At home"
       ((org-ql-block '(and (todo "NEXT" "TODO" )
                            (tags "@home")
                       )
                      ((org-ql-block-header "Was am PC getan werden muss"))
                      (agenda)
         ))
       )


      )
    )







    (setq org-capture-templates
      `(("t" "Tasks / Projects")
        ("tt" "Task" entry (file "~/Sync/ALT-Org/Inbox.org")
             "* TODO %?\n  %U\n  %a\n  %i" :empty-lines 1)

        ("j" "Journal Entries")
        ("jj" "Journal" entry
             (file+olp+datetree "~/Sync/ALT-Org/Journal.org")
             "\n* %<%H:%M %p> - Journal :journal:\n\n%?\n\n"
             ;; ,(dw/read-file-as-string "~/Notes/Templates/Daily.org")
             :clock-in :clock-resume
             :empty-lines 1)


       )
    )



        (lb/org-font-setup)
      )



;; Return or left-click with mouse follows link
(customize-set-variable 'org-return-follows-link t)
(customize-set-variable 'org-mouse-1-follows-link t)

;; Display links as the description provided
(customize-set-variable 'org-link-descriptive t)


    ;(setq org-support-shift-select t)

(defun lb/org-mode-visual-fill ()
  (setq visual-fill-column-width 150
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . lb/org-mode-visual-fill))

(use-package org-modern)

  (add-hook 'org-mode-hook #'org-modern-mode)
  (add-hook 'org-agenda-finalize-hook #'org-modern-agenda)

(setq
 ;; Edit settings
 org-auto-align-tags nil
 org-tags-column 0
 org-fold-catch-invisible-edits 'show-and-error
 org-special-ctrl-a/e t
 org-insert-heading-respect-content t

 ;; Org styling, hide markup etc.
 ;; org-hide-emphasis-markers t
 org-pretty-entities t
 ;; org-ellipsis "…"

 ;; Agenda styling
 org-agenda-tags-column 0
 org-agenda-block-separator ?─
 org-agenda-time-grid
 '((daily today require-timed)
   (800 1000 1200 1400 1600 1800 2000)
   " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
 org-agenda-current-time-string
 "⭠ now ─────────────────────────────────────────────────")

(org-babel-do-load-languages
  'org-babel-load-languages
  '((emacs-lisp . t)
    (python . t)))

;; Automatically tangle our Emacs.org config file when we save it
(defun lb/org-babel-tangle-config ()
  (when (string-equal (buffer-file-name)
                      (expand-file-name "~/.emacs.d/Emacs.org"))
    ;; Dynamic scoping to the rescue
    (let ((org-confirm-babel-evaluate nil))
      (org-babel-tangle))))

(add-hook 'org-mode-hook (lambda () (add-hook 'after-save-hook #'lb/org-babel-tangle-config)))

(setq org-confirm-babel-evaluate nil)

;; This is needed as of Org 9.2
(require 'org-tempo)

(add-to-list 'org-structure-template-alist '("sh" . "src shell"))
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(add-to-list 'org-structure-template-alist '("py" . "src python"))

(setq org-src-tab-acts-natively t)

(setq org-pretty-entities t)

;;;; add inactive timestamp to every org-item
;; https://stackoverflow.com/a/52815573/5115219
;; https://emacs.stackexchange.com/a/45369/29404
(defun lb/insert-created-date (&rest ignore)
  "Insert inacative timestamp property,
but only in org-items, not in org-item-checkboxes."
  (interactive)
  (if (not (org-at-item-checkbox-p))
      (progn
        (insert (format-time-string
                 (concat "\n"
                         ":PROPERTIES:\n"
                         ":CREATED: "
                         "[%Y-%m-%d %a %H:%M]\n"
                         ":END:"
                         )))
        ;; in org-capture, this folds the entry; when inserting a heading, this moves point back to the heading line
        (org-back-to-heading)
        ;; when inserting a heading, this moves point to the end of the line
        (move-end-of-line ()))))
;;;; add inactive timestamp to  entries in org-mode
(advice-add 'org-insert-heading :after #'lb/insert-created-date)

;; (use-package org-ql
;;    :straight t)

;; (defun lb/org-archive-done-tasks-file ()
;;   (interactive)
;;   (org-map-entries
;;    (lambda ()
;;      (org-archive-subtree)
;;      (setq org-map-continue-from (org-element-property :begin (org-element-at-point))))
;;    "/DONE" 'file))

;; (defun lb/org-archive-done-tasks-agenda ()
;;   (interactive)
;;   (org-map-entries
;;    (lambda ()
;;      (org-archive-subtree)
;;      (setq org-map-continue-from (org-element-property :begin (org-element-at-point))))
;;    "/DONE" 'agenda))
;;

(defun lb/org-archive-done-tasks-file ()
  "Archive all tasks marked DONE in the file."
  (interactive)
  (mapc (lambda(entry)
          (goto-char entry)
          (org-archive-subtree))
        (reverse (org-map-entries (lambda () (point)) "TODO=\"★ DONE\"" 'file))))

(defun lb/org-archive-done-tasks-agenda ()
  "Archive all tasks marked DONE in the file."
  (interactive)
  (mapc (lambda(entry)
          (goto-char entry)
          (org-archive-subtree))
        (reverse (org-map-entries (lambda () (point)) "TODO=\"★ DONE\"" 'agenda))))

(use-package org-roam
  ;:straight (:files (:defaults "extensions/*"))
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/Sync/Org/Roam")
  (org-roam-completion-everywhere t)


  (org-roam-capture-templates
     '(("d" "default" plain
        "%?"
        :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
        :unnarrowed t)
     ;; ("p" "project" plain "* Goals\n\n%?\n\n* Tasks\n\n** TODO Add initial tasks\n\n* Dates\n\n"
     ;;  :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: Project")
     ;;  :unnarrowed t)
     )
  )


  :bind (("C-c r l" . org-roam-buffer-toggle)
         ("C-c r f" . org-roam-node-find)
         ("C-c r i" . org-roam-node-insert)
         ("C-c r I" . lb/org-roam-node-insert-immediate)
         :map org-mode-map
         ("C-M-i"    . completion-at-point)
         :map org-roam-dailies-map
         ("Y" . org-roam-dailies-capture-yesterday)
         ("T" . org-roam-dailies-capture-tomorrow)
        )
  :bind-keymap
  ("C-c r d" . org-roam-dailies-map)
  :config
  (require 'org-roam-dailies)
  (org-roam-setup)
)



(use-package org-roam-dailies :straight nil)

(setq org-roam-dailies-directory "daily/")

(setq org-roam-dailies-capture-templates
    '(("d" "default" entry
       "* %?"
       :target (file+head "%<%Y-%m-%d>.org"
                          "#+title: %<%Y-%m-%d>\n"
               )
       )
     )
)

(defun lb/org-roam-node-insert-immediate (arg &rest args)
  (interactive "P")
  (let ((args (cons arg args))
        (org-roam-capture-templates (list (append (car org-roam-capture-templates)
                                                  '(:immediate-finish t)))))
    (apply #'org-roam-node-insert args)))

(defun lb/org-roam-filter-by-tag (tag-name)
   (lambda (node)
     (member tag-name (org-roam-node-tags node))))

;; (defun lb/org-roam-list-notes-by-tag (tag-name)
;;   (mapcar #'org-roam-node-file
;;           (seq-filter
;;            (lb/org-roam-filter-by-tag tag-name)
;;            (org-roam-node-list))))

;; (defun lb/org-roam-refresh-agenda-list ()
;;   (interactive)
;;   (setq org-agenda-files (lb/org-roam-list-notes-by-tag "Project")))

;; ;; Build the agenda list the first time for the session
;; (lb/org-roam-refresh-agenda-list)

(defun lb/org-roam-capture-task ()
   (interactive)
   ;; Add the project file to the agenda after capture is finished
   (add-hook 'org-capture-after-finalize-hook #'lb/org-roam-project-finalize-hook)

   ;; Capture the new task, creating the project file if necessary
   (org-roam-capture- :node (org-roam-node-read
                             nil
                             (lb/org-roam-filter-by-tag "Project"))
                      :templates '(("p" "project" plain "* TODO %?"
                                    :if-new (file+head+olp "%<%Y%m%d%H%M%S>-${slug}.org"
                                                           "#+title: ${title}\n#+category: ${title}\n#+filetags: Project"
                                                           ("Tasks"))))))

 (global-set-key (kbd "C-c r/home/leonb/.emacs.d/Emacs.org t") #'lb/org-roam-capture-task)

(defun my/org-roam-copy-todo-to-today ()
  (interactive)
  (let ((org-refile-keep t) ;; Set this to nil to delete the original!
        (org-roam-dailies-capture-templates
          '(("t" "tasks" entry "%?"
             :if-new (file+head+olp "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n" ("Tasks")))))
        (org-after-refile-insert-hook #'save-buffer)
        today-file
        pos)
    (save-window-excursion
      (org-roam-dailies--capture (current-time) t)
      (setq today-file (buffer-file-name))
      (setq pos (point)))

    ;; Only refile if the target file is different than the current file
    (unless (equal (file-truename today-file)
                   (file-truename (buffer-file-name)))
      (org-refile nil nil (list "Tasks" today-file nil pos)))))

;; (add-to-list 'org-after-todo-state-change-hook
;;              (lambda ()
;;                (when (equal org-state "DONE")
;;                  (my/org-roam-copy-todo-to-today))))

;; Emacs version 27.2 required by 06.2023

    (use-package org-gtd
          :straight t
         ;; (:host github
         ;;  :repo "Trevoke/org-gtd.el")

         ;; :after org
         :init
         (setq org-gtd-update-ack "3.0.0")
         (setq org-gtd-update-ack "2.1.0")
         ;; :config
         ;; (setq org-gtd-directory "~/Sync/org-gtd")
         ;; (setq org-gtd-archive-location "~/Sync/org-gtd/archive")
         ;; (setq org-edna-use-inheritance t)
         ;; (org-edna-mode)
         :bind
         (("C-c d c" . org-gtd-capture)
         ("C-c d e" . org-gtd-engage)
         ("C-c d p" . org-gtd-process-inbox)
         ("C-c d n" . org-gtd-show-all-next)
         ("C-c d s" . org-gtd-show-stuck-projects))
         :bind
         (:map org-gtd-clarify-map
               ("C-c c" . org-gtd-organize))
    )


 (setq org-gtd-directory "~/Sync/org-gtd")
 ;; (setq org-gtd-archive-location "~/Sync/org-gtd/archive")
 (setq org-edna-use-inheritance t)
 (org-edna-mode)

(use-package org-gtd-agenda :straight nil)
(use-package org-gtd-archive :straight nil)
(use-package org-gtd-areas-of-focus :straight nil)
(use-package org-gtd-backward-compatibility :straight nil)
(use-package org-gtd-calendar :straight nil)
(use-package org-gtd-capture :straight nil)
(use-package org-gtd-clarify :straight nil)
(use-package org-gtd-core :straight nil)
(use-package org-gtd-delegate :straight nil)
(use-package org-gtd-files :straight nil)
(use-package org-gtd-habit :straight nil)
(use-package org-gtd-horizons :straight nil)
(use-package org-gtd-id :straight nil)
(use-package org-gtd-incubate :straight nil)
(use-package org-gtd-knowledge :straight nil)
(use-package org-gtd-mode :straight nil)
(use-package org-gtd-oops :straight nil)
(use-package org-gtd-organize :straight nil)
(use-package org-gtd-process :straight nil)
(use-package org-gtd-projects :straight nil)
(use-package org-gtd-quick-action :straight nil)
(use-package org-gtd-refile :straight nil)
(use-package org-gtd-review :straight nil)
(use-package org-gtd-single-action :straight nil)
(use-package org-gtd-skip :straight nil)
(use-package org-gtd-trash :straight nil)
(use-package org-gtd-upgrades :straight nil)

;; (use-package projectile
;;   :diminish projectile-mode
;;   :config (projectile-mode)
;;   :custom ((projectile-completion-system 'ivy))
;;   :bind-keymap
;;   ("C-c p" . projectile-command-map)
;;   :init
;;   ;; NOTE: Set this to the folder where you keep your Git repos!
;;   (when (file-directory-p "~/Projects/Code")
;;   ; If I have a folder, with the Path ~/Projects/Code, then when you list them with projectile you can see all of them
;;     (setq projectile-project-search-path '("~/Projects/Code"))
;;   )
;;   (setq projectile-switch-project-action #'projectile-dired)) ; When you switch through projects the first thing that opens up is dired

;; (use-package counsel-projectile
;;   :config (counsel-projectile-mode))

(use-package magit
  :commands magit-status
  ;:custom
  ;(magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1)
  ;; When magit does a diff, now it is just in 1 window instead of 2. Put this in, when you think this is usefull
  )

;; NOTE: Make sure to configure a GitHub token before using this package!
;; - https://magit.vc/manual/forge/Token-Creation.html#Token-Creation
;; - https://magit.vc/manual/ghub/Getting-Started.html#Getting-Started
(use-package forge
    :after magit)

(use-package tex
   ;; :straight (:type git :host nil :repo "https://git.savannah.gnu.org/git/auctex.git"
  ;;            :pre-build (
  ;;                        ;("./autogen.sh")
  ;;                        ;("./configure" "--without-texmf-dir" "--with-lispdir=.")
  ;;                        ;("make")
  ;;                        ;;or
  ;;                        (shell-command "./autogen.sh && ./configure --without-texmf-dir --with-lispdir=. && make")
  ;;                       )
  ;;            )

  :straight auctex
  :mode
  ;; ; https://www.mail-archive.com/auctex@gnu.org/msg07608.html
  ; https://www.gnu.org/software/emacs/manual/html_node/reftex/Installation.html
  ("\\.tex\\'" . latex-mode) ; Must first activate the inferior Emacs latex mode
  :hook
          (LaTeX-mode . TeX-PDF-mode)
          (LaTeX-mode . flyspell-mode)
  ;       (LaTeX-mode . flycheck-mode)
          (LaTeX-mode . LaTeX-math-mode)
          (LaTeX-mode . turn-on-reftex)
          (LaTeX-mode . turn-on-cdlatex)
  :init
  (load "auctex.el" nil t t)
  (load "preview.el" nil t t)
  (require 'reftex)

  ;;(setq-default TeX-master 'nil)


  ;; This does not have to be set here, but is set later.
  ;; " expands into csquotes macros (for this to work babel must be loaded after csquotes).
  ;;(setq LaTeX-csquotes-close-quote "}"
  ;;      LaTeX-csquotes-open-quote "\\enquote{")

  ;;Don't ask for optional argument in itemize, enumerate
  ;;(setq TeX-arg-item-label-p nil)

  ;;Default tabular width

  )

(setq-default TeX-master nil)

(setq TeX-data-directory (straight--repos-dir "auctex")
            TeX-lisp-directory TeX-data-directory

            ; Or custom-set-variables as follows.
            ; M-x describe-variable RET preview-TeX-style-dir RET
            ;`(preview-TeX-style-dir ,(concat ".:" (straight--repos-dir "auctex") "latex:"))
            preview-TeX-style-dir (concat ".:" (straight--repos-dir "auctex") "latex:")

            TeX-parse-self t ; parse on load
            TeX-auto-save t  ; parse on save

          ;Type of TeX engine to use.
          ;It should be one of the following symbols:
          ;* ‘default’
          ;* ‘luatex’
          ;* ‘omega’
          ;* ‘xetex’
            TeX-engine 'luatex
            TeX-auto-local ".auctex-auto" ; Directory containing automatically generated TeX information.
            TeX-style-local ".auctex-style" ; Directory containing hand generated TeX information.
            bibtex-dialect 'biblatex ; use biblatex by default
          ;; ##### Enable synctex correlation.
          ;; ##### From Okular just press `Shift + Left click' to go to the good line.
          ;; ##### From Evince just press `Ctrl + Left click' to go to the good line.
            TeX-source-correlate-mode t
            TeX-source-correlate-method 'synctex
            TeX-source-correlate-start-server t
            TeX-view-evince-keep-focus t
          ;; automatically insert braces after sub/superscript in math mode
          ;;  TeX-electric-sub-and-superscript t ; Deactivated since cdlatex does the same thing better
          ;; If non-nil, then query the user before saving each file with TeX-save-document.
            TeX-save-query nil

          ;      TeX-view-program-selection '((output-pdf "PDF Tools"))
            )

;; For some reason with straight, this did not work anymore
 ;;  (use-package tex
 ;;   ;:mode ("\\.tex\\'" . latex-mode)
 ;;   :straight auctex)




 ;;   (setq TeX-auto-save t)
 ;;   (setq TeX-parse-self t)

 (add-hook 'TeX-mode-hook (lambda () (TeX-fold-mode 1))) ; Automatically activate TeX-fold-mode.

;; ;; LaTeX-math-mode
;; ; http://www.gnu.org/s/auctex/manual/auctex/Mathematics.html
;(add-hook 'TeX-mode-hook 'LaTeX-math-mode)

;;  (setq TeX-engine 'luatex)

;;  (setq TeX-view-evince-keep-focus t)

;;  (setq TeX-save-query nil)

(add-hook 'LaTeX-mode-hook #'flymake-mode)

(eval-after-load "tex"
   '(define-key TeX-source-correlate-map [C-down-mouse-1]
                #'TeX-view-mouse))

;;(setq TeX-source-correlate-start-server t)

;; " expands into csquotes macros (for this to work babel must be loaded after csquotes).
              (setq LaTeX-csquotes-close-quote "}"
                    LaTeX-csquotes-open-quote "\\enquote{")

(add-hook 'plain-TeX-mode-hook
          (lambda () (set (make-local-variable 'TeX-electric-math)
                          (cons "$" "$"))))
(add-hook 'LaTeX-mode-hook
          (lambda () (set (make-local-variable 'TeX-electric-math)
                          (cons "\\(" "\\)"))))

;(setq LaTeX-electric-left-right-brace t)

(setq TeX-arg-item-label-p nil)

(setq LaTeX-default-width "\\linewidth")
(setq LaTeX-default-position "h!")

;(setq TeX-electric-escape t)

;; (add-hook
;;  'LaTeX-mode-hook
;;  (lambda ()
;;    (let ((math (reverse (append LaTeX-math-list LaTeX-math-default))))
;;      (while math
;;        (let ((entry (car math))
;;          value)
;;      (setq math (cdr math))
;;      (if (listp (cdr entry))
;;          (setq value (nth 1 entry))
;;        (setq value (cdr entry)))
;;      (if (stringp value)
;;          (fset (intern (concat "LaTeX-math-" value))
;;            (list 'lambda (list 'arg) (list 'interactive "*P")
;;              (list 'LaTeX-math-insert value
;;                    '(null (texmathp)))))))))))

;(setq TeX-electric-sub-and-superscript t)

(setq prettify-symbols-unprettify-at-point 'right-edge)
(add-hook 'TeX-mode-hook 'prettify-symbols-mode)

;(use-package xenops
; :defer)

(add-hook 'LaTeX-mode-hook
          (defun preview-larger-previews ()
            (setq preview-scale-function
                  (lambda () (* 1.25
                           (funcall (preview-scale-from-face)))))))

(setq TeX-parse-self t) ; Enable parse on load.
(setq TeX-auto-save t) ; Enable parse on save.

(setq TeX-auto-untabify t)

(add-hook 'TeX-mode-hook 'flyspell-mode) ; Enable Flyspell mode for TeX modes such as AUCTeX. Highlights all misspelled words.  
  (add-hook'emacs-lisp-mode-hook 'flyspell-prog-mode) ; Enable Flyspell program mode for emacs lisp mode, which highlights all misspelled words in comments and strings.  
  (setq ispell-dictionary "english") ; Default dictionary. To change do M-x ispell-change-dictionary RET.

;(add-hook 'TeX-language-de-hook
 ;         (lambda () (ispell-change-dictionary "german8")))
 
(add-hook 'TeX-language-en-hook
          (lambda () (ispell-change-dictionary "english")))
 

  (setq LaTeX-babel-hyphen nil) ; Disable language-specific hyphen insertion.

(use-package cdlatex
    :straight (:host github
              :repo "cdominik/cdlatex"
              :branch "master"
              )
    ;:ensure t
    :hook (LaTeX-mode . turn-on-cdlatex)
    :bind (:map cdlatex-mode-map
                ("<tab>" . cdlatex-tab))
  )

   (setq cdlatex-math-modify-prefix "#")


;; Yasnippet settings
  (use-package yasnippet
    ;:ensure t
    :bind (("C-c n" . yas-new-snippet)
           ("C-c v" . yas-visit-snippet-file))
    :hook ((LaTeX-mode . yas-minor-mode)
           (post-self-insert . lb/yas-try-expanding-auto-snippets))
    :config
    (use-package warnings
      :config
      (cl-pushnew '(yasnippet backquote-change)
                  warning-suppress-types
                  :test 'equal))

    (setq yas-triggers-in-field t)

    ;; Function that tries to autoexpand YaSnippets
    ;; The double quoting is NOT a typo!
    (defun lb/yas-try-expanding-auto-snippets ()
      (when (and (boundp 'yas-minor-mode) yas-minor-mode)
        (let ((yas-buffer-local-condition ''(require-snippet-condition . auto)))
          (yas-expand)))))

  ;; CDLatex integration with YaSnippet: Allow cdlatex tab to work inside Yas
  ;; fields
  (use-package cdlatex
    :hook ((cdlatex-tab . yas-expand)
           (cdlatex-tab . cdlatex-in-yas-field))
    :config
    (use-package yasnippet
      :bind (:map yas-keymap
             ("<tab>" . yas-next-field-or-cdlatex)
             ("TAB" . yas-next-field-or-cdlatex))
      :config
      (defun cdlatex-in-yas-field ()
        ;; Check if we're at the end of the Yas field
        (when-let* ((_ (overlayp yas--active-field-overlay))
                    (end (overlay-end yas--active-field-overlay)))
          (if (>= (point) end)
              ;; Call yas-next-field if cdlatex can't expand here
              (let ((s (thing-at-point 'sexp)))
                (unless (and s (assoc (substring-no-properties s)
                                      cdlatex-command-alist-comb))
                  (yas-next-field-or-maybe-expand)
                  t))
            ;; otherwise expand and jump to the correct location
            (let (cdlatex-tab-hook minp)
              (setq minp
                    (min (save-excursion (cdlatex-tab)
                                         (point))
                         (overlay-end yas--active-field-overlay)))
              (goto-char minp) t))))

      (defun yas-next-field-or-cdlatex nil
        (interactive)
        "Jump to the next Yas field correctly with cdlatex active."
        (if
            (or (bound-and-true-p cdlatex-mode)
                (bound-and-true-p org-cdlatex-mode))
            (cdlatex-tab)
          (yas-next-field-or-maybe-expand)))))


  (with-eval-after-load 'warnings
    (cl-pushnew '(yasnippet backquote-change) warning-suppress-types
                :test 'equal))

(setq yas-new-snippet-default "# -*- mode: snippet -*-\n# name: $1\n# key: ${2:${1:$(yas--key-from-desc yas-text)}}\n# group: math\n# condition: (and (texmathp) 'auto)\n# --\n$0`(yas-escape-text yas-selected-text)`")

; This makes yasnippets expands, when there is no whitespace before it
 (setq yas-key-syntaxes '(yas-longest-key-from-whitespace "w_.()" "w_." "w_" "w"))

(setq cdlatex-make-sub-superscript-roman-if-pressed-twice t)
(setq cdlatex-simplify-sub-super-scripts nil)

(setq cdlatex-use-dollar-to-ensure-math nil)

;(setq cdlatex-paired-parens "$[{")

(setq cdlatex-math-modify-alist
   '(
     ( ?o   "\\interior"               nil        t   t   nil )
     ( ?F   "\\mathfrak"               nil        t   nil nil )
     ( ?s   "\\mathscr"                nil        t   nil nil )
    )
   )

(defun lb-ddot (arg)
    (interactive "P")
    (progn (push ?: unread-command-events) (cdlatex-math-modify arg))
  )

  (defun lb-vec (arg)
    (interactive "P")
    (progn (push ?> unread-command-events) (cdlatex-math-modify arg))
  )

  (defun lb-dot (arg)
    (interactive "P")
    (progn (push ?. unread-command-events) (cdlatex-math-modify arg))
  )

  (defun lb-hat (arg)
    (interactive "P")
    (progn (push ?^ unread-command-events) (cdlatex-math-modify arg))
  )

  (defun lb-tilde (arg)
    (interactive "P")
    (progn (push ?~ unread-command-events) (cdlatex-math-modify arg))
  )

  (defun lb-bar (arg)
    (interactive "P")
    (progn (push ?- unread-command-events) (cdlatex-math-modify arg))
  )

  (defun lb-overline (arg)
    (interactive "P")
    (progn (push ?T unread-command-events) (cdlatex-math-modify arg))
  )

  (defun lb-widehat (arg)
    (interactive "P")
    (progn (push ?T unread-command-events) (cdlatex-math-modify arg))
  )

  (defun lb-interior (arg)
    (interactive "P")
    (progn (push ?o unread-command-events) (cdlatex-math-modify arg))
  )

(with-eval-after-load 'yasnippet
  (setq yas-snippet-dirs '("~/.emacs.d/etc/yasnippet/snippets/")) ;; path to snippets
  (yas-recompile-all)
  (yas-reload-all)
  (yas-global-mode 1)
)

; Array/tabular input with org-tables and cdlatex 
(use-package org
  :after cdlatex
  :bind (:map orgtbl-mode-map
              ("<tab>" . lazytab-org-table-next-field-maybe)
              ("TAB" . lazytab-org-table-next-field-maybe))
  :init
  (add-hook 'cdlatex-tab-hook 'lazytab-cdlatex-or-orgtbl-next-field 90)
  ;; Tabular environments using cdlatex
  (add-to-list 'cdlatex-command-alist '("smat" "Insert smallmatrix env"
                                       "\\left( \\begin{smallmatrix} ? \\end{smallmatrix} \\right)"
                                       lazytab-position-cursor-and-edit
                                       nil nil t))
  (add-to-list 'cdlatex-command-alist '("bmat" "Insert bmatrix env"
                                       "\\begin{bmatrix} ? \\end{bmatrix}"
                                       lazytab-position-cursor-and-edit
                                       nil nil t))
  (add-to-list 'cdlatex-command-alist '("pmat" "Insert pmatrix env"
                                       "\\begin{pmatrix} ? \\end{pmatrix}"
                                       lazytab-position-cursor-and-edit
                                       nil nil t))
  (add-to-list 'cdlatex-command-alist '("tbl" "Insert table"
                                        "\\begin{table}\n\\centering ? \\caption{}\n\\end{table}\n"
                                       lazytab-position-cursor-and-edit
                                       nil t nil))
  :config
  ;; Tab handling in org tables
  (defun lazytab-position-cursor-and-edit ()
    ;; (if (search-backward "\?" (- (point) 100) t)
    ;;     (delete-char 1))
    (cdlatex-position-cursor)
    (lazytab-orgtbl-edit))

  (defun lazytab-orgtbl-edit ()
    (advice-add 'orgtbl-ctrl-c-ctrl-c :after #'lazytab-orgtbl-replace)
    (orgtbl-mode 1)
    (open-line 1)
    (insert "\n|"))

  (defun lazytab-orgtbl-replace (_)
    (interactive "P")
    (unless (org-at-table-p) (user-error "Not at a table"))
    (let* ((table (org-table-to-lisp))
           params
           (replacement-table
            (if (texmathp)
                (lazytab-orgtbl-to-amsmath table params)
              (orgtbl-to-latex table params))))
      (kill-region (org-table-begin) (org-table-end))
      (open-line 1)
      (push-mark)
      (insert replacement-table)
      (align-regexp (region-beginning) (region-end) "\\([:space:]*\\)& ")
      (orgtbl-mode -1)
      (advice-remove 'orgtbl-ctrl-c-ctrl-c #'lazytab-orgtbl-replace)))
  
  (defun lazytab-orgtbl-to-amsmath (table params)
    (orgtbl-to-generic
     table
     (org-combine-plists
      '(:splice t
                :lstart ""
                :lend " \\\\"
                :sep " & "
                :hline nil
                :llend "")
      params)))

  (defun lazytab-cdlatex-or-orgtbl-next-field ()
    (when (and (bound-and-true-p orgtbl-mode)
               (org-table-p)
               (looking-at "[[:space:]]*\\(?:|\\|$\\)")
               (let ((s (thing-at-point 'sexp)))
                 (not (and s (assoc s cdlatex-command-alist-comb)))))
      (call-interactively #'org-table-next-field)
      t))

  (defun lazytab-org-table-next-field-maybe ()
    (interactive)
    (if (bound-and-true-p cdlatex-mode)
        (cdlatex-tab)
      (org-table-next-field))))

(use-package inkscape
  :straight (:host github
             :repo "Sinthoras7/inkscape.el"
             :branch "sinthoras-my-customizations"
             :files ("*.el" "*.svg")))

;;; RefTeX
;; Turn on RefTeX for AUCTeX   http://www.gnu.org/s/auctex/manual/reftex/reftex_5.html
(add-hook 'TeX-mode-hook 'turn-on-reftex)

(eval-after-load 'reftex-vars; Is this construct really needed?
    '(progn
       (setq reftex-cite-prompt-optional-args t); Prompt for empty optional arguments in cite macros.
       ;; Make RefTeX interact with AUCTeX, http://www.gnu.org/s/auctex/manual/reftex/AUCTeX_002dRefTeX-Interface.html
       (setq reftex-plug-into-AUCTeX t)
       ;; So that RefTeX also recognizes \addbibresource. Note that you
       ;; can't use $HOME in path for \addbibresource but that "~"
       ;; works.
       (setq reftex-bibliography-commands '("bibliography" "nobibliography" "addbibresource"))
  ;     (setq reftex-default-bibliography '("UNCOMMENT LINE AND INSERT PATH TO YOUR BIBLIOGRAPHY HERE")); So that RefTeX in Org-mode knows bibliography
       (setcdr (assoc 'caption reftex-default-context-regexps) "\\\\\\(rot\\|sub\\)?caption\\*?[[{]"); Recognize \subcaptions, e.g. reftex-citation
       (setq reftex-cite-format; Get ReTeX with biblatex, see https://tex.stackexchange.com/questions/31966/setting-up-reftex-with-biblatex-citation-commands/31992#31992
             '((?t . "\\textcite[]{%l}")
               (?a . "\\autocite[]{%l}")
               (?c . "\\cite[]{%l}")
               (?s . "\\smartcite[]{%l}")
               (?f . "\\footcite[]{%l}")
               (?n . "\\nocite{%l}")
               (?b . "\\blockcquote[]{%l}{}")))))

  ;; Fontification (remove unnecessary entries as you notice them) http://lists.gnu.org/archive/html/emacs-orgmode/2009-05/msg00236.html http://www.gnu.org/software/auctex/manual/auctex/Fontification-of-macros.html
  (setq font-latex-match-reference-keywords
        '(
          ;; biblatex
          ("printbibliography" "[{")
          ("addbibresource" "[{")
          ;; Standard commands
          ;; ("cite" "[{")
          ("Cite" "[{")
          ("parencite" "[{")
          ("Parencite" "[{")
          ("footcite" "[{")
          ("footcitetext" "[{")
          ;; ;; Style-specific commands
          ("textcite" "[{")
          ("Textcite" "[{")
          ("smartcite" "[{")
          ("Smartcite" "[{")
          ("cite*" "[{")
          ("parencite*" "[{")
          ("supercite" "[{")
          ; Qualified citation lists
          ("cites" "[{")
          ("Cites" "[{")
          ("parencites" "[{")
          ("Parencites" "[{")
          ("footcites" "[{")
          ("footcitetexts" "[{")
          ("smartcites" "[{")
          ("Smartcites" "[{")
          ("textcites" "[{")
          ("Textcites" "[{")
          ("supercites" "[{")
          ;; Style-independent commands
          ("autocite" "[{")
          ("Autocite" "[{")
          ("autocite*" "[{")
          ("Autocite*" "[{")
          ("autocites" "[{")
          ("Autocites" "[{")
          ;; Text commands
          ("citeauthor" "[{")
          ("Citeauthor" "[{")
          ("citetitle" "[{")
          ("citetitle*" "[{")
          ("citeyear" "[{")
          ("citedate" "[{")
          ("citeurl" "[{")
          ;; Special commands
          ("fullcite" "[{")))

  (setq font-latex-match-textual-keywords
        '(
          ;; biblatex brackets
          ("parentext" "{")
          ("brackettext" "{")
          ("hybridblockquote" "[{")
          ;; Auxiliary Commands
          ("textelp" "{")
          ("textelp*" "{")
          ("textins" "{")
          ("textins*" "{")
          ;; supcaption
          ("subcaption" "[{")))

  (setq font-latex-match-variable-keywords
        '(
          ;; amsmath
          ("numberwithin" "{")
          ;; enumitem
          ("setlist" "[{")
          ("setlist*" "[{")
          ("newlist" "{")
          ("renewlist" "{")
          ("setlistdepth" "{")
          ("restartlist" "{")))

(with-eval-after-load 'latex
   (add-to-list 'LaTeX-label-alist '("Theorem" . "thm") t))

 (with-eval-after-load 'reftex-vars
   (add-to-list 'reftex-label-alist
                '("Theorem" ?m "thm:" "~\\ref{%s}"
                  LaTeX-tcolorbox-lib-theorems-reftex-label-context-function
                  ("Theorem" "theorem") nil)
                t))

(setq researchproject "~/Sync/Uni/einzelneSemester/4-semester-fau/Forschungsprojekt/Waehrenddessen-Notizen")

(use-package dired
  :straight nil ; Don't install it, since it is already in Emacs
  :commands (dired dired-jump)
  :bind (("C-x C-j" . dired-jump))
  :custom ((dired-listing-switches "-agho --group-directories-first"))
)

(use-package dirvish
  :init
  (dirvish-override-dired-mode)
  :custom
  (dirvish-quick-access-entries
   '(("h" "~/"                          "Home")
     ("d" "~/Downloads/"                "Downloads")
     ("m" "/mnt/"                       "Drives")
     ("t" "~/.local/share/Trash/files/" "TrashCan")))
  ;; (dirvish-header-line-format '(:left (path) :right (free-space)))
  (dirvish-mode-line-format
   '(:left (sort file-time " " file-size symlink) :right (omit yank index)))
  (dirvish-attributes '(all-the-icons file-size collapse subtree-state vc-state git-msg))
  ;; Maybe the icons are too big to your eyes
  ;; (dirvish-all-the-icons-height 0.8)
  ;; In case you want the details at startup like `dired'
  ;; (dirvish-hide-details nil)
  :config
  ;; (dirvish-peek-mode) ; Preview files in minibuffer
  ;; Dired options are respected except a few exceptions, see *In relation to Dired* section above
  (setq dired-dwim-target t)
  (setq delete-by-moving-to-trash t)
  ;; Enable mouse drag-and-drop files to other applications
  (setq dired-mouse-drag-files t)                   ; added in Emacs 29
  (setq mouse-drag-and-drop-region-cross-program t) ; added in Emacs 29
  ;; See *Parsing switches*
  (setq dired-listing-switches
        "-l --almost-all --human-readable --time-style=long-iso --group-directories-first --no-group")
  :bind
  ;; Bind `dirvish|dirvish-side|dirvish-dwim' as you see fit
  (("C-c f" . dirvish-fd)
   ;; Dirvish has all the keybindings in `dired-mode-map' already
   :map dirvish-mode-map
    ("h" . dired-up-directory)
   ;; ("j" . dired-next-line)
   ;; ("k" . dired-previous-line)
    ("l" . dired-find-file)
   ;; ("i" . wdired-change-to-wdired-mode)
   ;; ("." . dired-omit-mode)
   ("a"   . dirvish-quick-access)
   ("f"   . dirvish-file-info-menu)
   ("y"   . dirvish-yank-menu)
   ("N"   . dirvish-narrow)
   ("^"   . dirvish-history-last)
   ("h"   . dirvish-history-jump) ; remapped `describe-mode'
   ("s"   . dirvish-quicksort)    ; remapped `dired-sort-toggle-or-edit'
   ("v"   . dirvish-vc-menu)      ; remapped `dired-view-file'
   ("TAB" . dirvish-subtree-toggle)
   ("M-f" . dirvish-history-go-forward)
   ("M-b" . dirvish-history-go-backward)
   ("M-l" . dirvish-ls-switches-menu)
   ("M-m" . dirvish-mark-menu)
   ("M-t" . dirvish-layout-toggle)
   ("M-s" . dirvish-setup-menu)
   ("M-e" . dirvish-emerge-menu)
   ("M-j" . dirvish-fd-jump)))

;;  (add-to-list 'load-path "~/.emacs.d/lb/")

;;  (add-hook 'LaTeX-mode-hook #'laas-mode)


(setq laas-accent-snippets nil)
(setq laas-basic-snippets nil)
;(setq laas-use-unicode t)
(use-package laas
    :hook (LaTeX-mode . laas-mode)
    :config
    (setq laas-basic-snippets
     '(:cond laas-mathp
       ";;;c" "\\cos")
    )

 )

(use-package unicode-math-input)

;; (set-input-method "unicode-math")

(use-package dictcc)
(setq dictcc-completion-backend 'completing-read)
(global-set-key (kbd "C-ü") 'dictcc)

(use-package markdown-mode)

(use-package gptel)
(setq gptel-api-key "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")


(defun lb/write-next-gpt-input ()
"Jump to the next markdown heading and move cursor to the end of the line."
(interactive)
(markdown-next-visible-heading 1)
(end-of-line)
(insert " "))

(eval-after-load 'markdown-mode
'(define-key markdown-mode-map (kbd "C-c h") 'lb/write-next-gpt-input))

(use-package jinx)

(add-hook 'emacs-startup-hook #'global-jinx-mode)
(keymap-global-set "M-$" #'jinx-correct)
(keymap-global-set "C-M-$" #'jinx-languages)

(setq jinx-languages "en_US de_DE")

(use-package vertico-directory :straight nil)
(use-package vertico-flat :straight nil)
(use-package vertico-indexed :straight nil)
(use-package vertico-mouse :straight nil)
(use-package vertico-quick :straight nil)
(use-package vertico-repeat :straight nil)
(use-package vertico-reverse :straight nil)

(use-package vertico-multiform
       :straight nil)

(add-to-list 'vertico-multiform-categories
             '(jinx grid (vertico-grid-annotate . 20)))
(vertico-multiform-mode 1)

(use-package term
  :config
  (setq explicit-shell-file-name "bash") ;; Change this to zsh, etc
  ;;(setq explicit-zsh-args '())         ;; Use 'explicit-<shell>-args for shell-specific args

  ;; Match the default Bash shell prompt.  Update this if you have a custom prompt
  (setq term-prompt-regexp "^[^#$%>\n]*[#$%>] *"))

(use-package eterm-256color
  :hook (term-mode . eterm-256color-mode))

(defun lb/configure-eshell ()
  ;; Save command history when commands are entered
  (add-hook 'eshell-pre-command-hook 'eshell-save-some-history)

  ;; Truncate buffer for performance
  (add-to-list 'eshell-output-filter-functions 'eshell-truncate-buffer)

  ;; Bind some useful keys for evil-mode
  ;; (evil-define-key '(normal insert visual) eshell-mode-map (kbd "C-r") 'counsel-esh-history)
  ;; (evil-define-key '(normal insert visual) eshell-mode-map (kbd "<home>") 'eshell-bol)
  ;; (evil-normalize-keymaps)

  (setq eshell-history-size         10000
        eshell-buffer-maximum-lines 10000
        eshell-hist-ignoredups t
        eshell-scroll-to-bottom-on-input t))

(use-package eshell-git-prompt)

(use-package eshell
  :hook (eshell-first-time-mode . lb/configure-eshell)
  :config

  (with-eval-after-load 'esh-opt
    (setq eshell-destroy-buffer-when-process-dies t)
    (setq eshell-visual-commands '("htop" "zsh" "vim")))

  (eshell-git-prompt-use-theme 'powerline))

(server-start)
