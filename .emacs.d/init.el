;-*-lisp-*-
;===================
; general settings
(setq column-number-mode t)
(setq inhibit-startup-message t)
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'LaTeX-hide-environment 'disabled nil)
(global-font-lock-mode t)
(show-paren-mode t)
(setq show-paren-style 'parentheses)

(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)
(setq tab-stop-list ())

(global-set-key [(control h)] 'delete-backward-char)
;;(keyboard-translate ?\C-h ?\C-?)

(global-set-key [(meta h)] 'backward-kill-word)
(global-set-key (kbd "M-g g") 'goto-line)

(setq scroll-step 1
      scroll-margin 3
      scroll-conservatively 10000)
(mouse-avoidance-mode 'animate)


(auto-image-file-mode)
;;(setq grep-command "findstr /n /s ") ; for windows

(tool-bar-mode 0)
(menu-bar-mode 0)

;;backup
;; 所有的备份文件转移到~/backups目录下
(setq version-control t)
(setq kept-old-versions 2)
(setq kept-new-versions 5)
(setq delete-old-versions t)
(setq backup-directory-alist '(("." . "~/backups")))
(setq backup-by-copying t)
;; Emacs 中，改变文件时，默认都会产生备份文件(以 ~ 结尾的文件)。可以完全去掉
;; (并不可取)，也可以制定备份的方式。这里采用的是，把所有的文件备份都放在一
;; 个固定的地方("~/var/tmp")。对于每个备份文件，保留最原始的两个版本和最新的
;; 五个版本。并且备份的时候，备份文件是复本，而不是原件。
;;不产生备份文件

(global-set-key [f11] 'my-fullscreen)

(defun my-fullscreen ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(2 "_NET_WM_STATE_FULLSCREEN" 0))
  )


;;chinese
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)
;
;;(create-fontset-from-fontset-spec
;; "-*-fixed-medium-r-normal-*-24-*-*-*-*-*-fontset-standard,
;;  chinese-gb2312:-*-*-medium-r-normal-*-24-*-*-*-*-*-gb2312.1980-*,
;;	korean-ksc5601:-*-medium-r-normal-*-16-*-ksc5601*-*,
;;	chinese-cns11643-1:-*-medium-r-normal-*-16-*-cns11643*-1,
;;	chinese-cns11643-2:-*-medium-r-normal-*-16-*-cns11643*-2,
;;	chinese-cns11643-3:-*-medium-r-normal-*-16-*-cns11643*-3,
;;	chinese-cns11643-4:-*-medium-r-normal-*-16-*-cns11643*-4,
;;	chinese-cns11643-5:-*-medium-r-normal-*-16-*-cns11643*-5,
;;	chinese-cns11643-6:-*-medium-r-normal-*-16-*-cns11643*-6,
;;	chinese-cns11643-7:-*-medium-r-normal-*-16-*-cns11643*-7" t)

;;(custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;; '(default ((t (:inherit nil :stipple nil ; :background "#ffffff" :foreground "#000000"
;;                         :inverse-video nil :box nil :strike-through nil  verline nil
;;                         :underline nil :slant normal :weight normal :height 120
;;                         :width normal :foundry "unknown" :family "Liberation Mono")))))


; (if (and (fboundp 'daemonp) (daemonp))
;     (add-hook 'after-make-frame-functions
;               (lambda (frame)
;                 (with-selected-frame frame
;                   (set-fontset-font "fontset-default"
;                                     'chinese-gbk "WenQuanYi Micro Hei Mono 15"))))
;   (set-fontset-font "fontset-default" 'chinese-gbk "WenQuanYi Micro Hei Mono 15"))
; 
; 
; (defun wl-org-column-view-uses-fixed-width-face ()
;   ;; copy from org-faces.el
;   (when (fboundp 'set-face-attribute)
;     ;; Make sure that a fixed-width face is used when we have a column table.
;     (set-face-attribute 'org-column nil
;                         :height (face-attribute 'default :height)
;                         :family (face-attribute 'default :family))))
; 
; (when (and (fboundp 'daemonp) (daemonp))
;   (add-hook 'org-mode-hook 'wl-org-column-view-uses-fixed-width-face))


(set-language-environment 'Chinese-GB)
(set-keyboard-coding-system 'chinese-iso-8bit)
(set-terminal-coding-system 'chinese-iso-8bit)
(set-locale-environment "zh_CN.utf8")

;(set-clipboard-coding-system 'chinese-iso-8bit)

(setq visible-bell t)
(setq default-major-mode 'text-mode)
(put 'narrow-to-page 'disabled nil)
(server-start) 
(appt-activate)

(require 'dired-x)
 (add-hook 'dired-load-hook
               (lambda ()
                 (load-library "dired-x")
                 ;; Set dired-x global variables here.  For example:
                 ;; (setq dired-guess-shell-gnutar "gtar")
                 ;; (setq dired-x-hands-off-my-keys nil)
                 ))
 (add-hook 'dired-mode-hook
               (lambda ()
                 ;; Set dired-x buffer-local variables here.  For example:
                 ;; (dired-omit-mode 1)
                 (setq dired-omit-extensions
                       (append '(".d" ".o" ".a" ".so" ".bak")  dired-omit-extensions ))
                 ))


;;=============================
;; add packege path

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))


;; add package management
(require 'package)
(add-to-list 'package-archives'
  ("elpa" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives' 
  ("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives'
  ("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)


;;=============================
;;  color-theme
;;  sublime theme
(load-theme 'spolsky t)

;;=============================
;; programming languages
(require 'init-c-c++)
(require 'init-scheme)

;;=============================
;; org-mode
(require 'init-org)


(require 'server)
(unless (server-running-p)
  (server-start))


;; xml settings
(setq auto-mode-alist
      (cons '("\\.\\(xml\\|xsl\\|rng\\|xhtml\\)\\'" . nxml-mode)
            auto-mode-alist))
(eval-after-load "nxml-mode" '(define-key nxml-mode-map "\M-h" 'backward-kill-word))


;; python
;(setq load-path (cons "~/site-lisp/python-mode-1.0" load-path))
(setq auto-mode-alist
      (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist
      (cons '("python" . python-mode)
            interpreter-mode-alist))
(autoload 'python-mode "python-mode" "Python editing mode." t)


;; lua mode
(setq auto-mode-alist (cons '("\\.lua$" . lua-mode) auto-mode-alist))
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)

;
;;; yasnippet
;(add-to-list 'load-path "~/site-lisp/yasnippet")
;(require 'yasnippet)
;(yas/initialize)
;(yas/load-directory "~/site-lisp/yasnippet/snippets")


(setq auto-mode-alist (append '(("/*.\.page$" . markdown-mode)) auto-mode-alist))

;;
;; ace jump mode major function
;; 
(add-to-list 'load-path "/full/path/where/ace-jump-mode.el/in/")
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
;; you can select the key you prefer to
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)


;; avy
;;(global-set-key (kbd "C-,") 'avy-goto-char)

(define-key global-map (kbd "C-,") 'avy-goto-char)
(global-set-key (kbd "C-.") 'avy-goto-word-1)


;;(require 'taskjuggler-mode)
(global-auto-revert-mode 1)

(defun my-js-mode-hook ()
  "My personal Javascript mode hook."
  (setq js-indent-level 2))

(add-hook 'js-mode-hook 'my-js-mode-hook)
(setq ibus-agent-file-name "~/site-lisp/ibus-el-0.3.2/ibus-el-agent")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (avy htmlize tide plantuml-mode org))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
