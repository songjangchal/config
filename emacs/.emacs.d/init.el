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

(setq word-wrap t)

;; (setq org-startup-indented t)

(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)
(setq tab-stop-list ())


(setq scroll-step 1
      scroll-margin 3
      scroll-conservatively 10000)
(mouse-avoidance-mode 'animate)


(auto-image-file-mode)
;;(setq grep-command "findstr /n /s ") ; for windows

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(display-time-mode 1)

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
(appt-activate)

(toggle-debug-on-error)

(require 'server)
(unless (server-running-p)
  (server-start))

(setq dired-listing-switches "-al --group-directories-first ")

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
                       (append '(".d" ".o" ".a" ".so" ".bak" ".cmd" ".ko" ".mod.c")  dired-omit-extensions ))
                 (setq dired-omit-files
                       (concat  "cscope\\..*\\|" "^\\..*\\|" dired-omit-files))
                 ))


;;=============================
;; add packege path
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
;; other package that not in elpa
(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))



;;=============================
;;  color-theme
;;  sublime theme
(add-hook 'after-init-hook (lambda () (load-theme 'spolsky t)))

;; add package management

;; see https://mirrors.tuna.tsinghua.edu.cn/help/elpa/

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
;; (add-to-list 'package-archives'
;;              ("elpa" . "http://tromey.com/elpa/") t)
;; (add-to-list 'package-archives'
;;              ("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives'
             ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/") t)
(package-initialize)

;; (add-to-list 'load-path "~/.emacs.d/el-get/el-get")

;; (unless (require 'el-get nil 'noerror)
;;  (with-current-buffer
;;      (url-retrieve-synchronously
;;       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
;;    (goto-char (point-max))
;;    (eval-print-last-sexp)))

;; (add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
;; (el-get 'sync)


;;=============================
(require 'taskjuggler-mode)

;;=============================
;; programming languages
(require 'init-c-c++)
(require 'init-scheme)

;;=============================
;; org-mode
(require 'init-org)

;; (require 'init-exwm)



(require 'pyim)
(require 'pyim-basedict) ; 拼音词库设置，五笔用户 *不需要* 此行设置
(pyim-basedict-enable)   ; 拼音词库，五笔用户 *不需要* 此行设置
(setq default-input-method "pyim")


;; xml settings
(setq auto-mode-alist
      (cons '("\\.\\(xml\\|xsl\\|xsd\\|rng\\|xhtml\\)\\'" . nxml-mode)
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


(setq auto-mode-alist (append '(("/*.\.fbs$" . protobuf-mode)) auto-mode-alist))

;; avy
;;(global-set-key (kbd "C-,") 'avy-goto-char)
(define-key global-map (kbd "C-,") 'avy-goto-char)
(global-set-key (kbd "C-.") 'avy-goto-word-1)



;;(require 'taskjuggler-mode)
(global-auto-revert-mode 1)

(setq auto-mode-alist (cons '("\\.\\(g\\|g4\\|g3\\)$" . antlr-mode) auto-mode-alist))

(defun my-js-mode-hook ()
  "My personal Javascript mode hook."
  (setq js-indent-level 2))

(add-hook 'js-mode-hook 'my-js-mode-hook)
;;(setq ibus-agent-file-name "~/site-lisp/ibus-el-0.3.2/ibus-el-agent")


(setq exec-path-from-shell-variables '("PATH" "MANPATH" "GOROOT" "GOPATH" "EDITOR" "PYTHONPATH"))
;; 设成nil 则不从 .zshrc 读 只从 .zshenv读（可以加快速度，但是需要你将环境变量相关的都放到 .zshenv 中，而非 .zshrc 中）
;;(setq exec-path-from-shell-check-startup-files nil) ;
;;(setq exec-path-from-shell-arguments '("-l" )) ;remove -i read form .zshenv
(exec-path-from-shell-initialize)

(global-set-key (kbd "M-o") 'ace-window)
(setq aw-keys '(?a ?o ?e ?u ?i ?d ?h ?t ?n))
(setq aw-leading-char-style 'path)



(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'wl-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'wl-user-agent
      'wl-user-agent-compose
      'wl-draft-send
      'wl-draft-kill
      'mail-send-hook))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(debug-on-error t)
 '(display-time-mode t)
 '(package-selected-packages
   (quote
    (calfw-org calfw calfw-cal org-journal deft org-roam org-roam-bibtex org-roam-server dts-mode yaml-mode cmake-font-lock google-translate org-web-tools ggtags w3 xcscope dismal julia-mode yasnippet-snippets wanderlust prettier-js cal-china-x e2wm popwin treemacs pyim exwm-x exwm exec-path-from-shell ox-pandoc protobuf-mode ascii-art-to-unicode use-package vue-mode org-plus-contrib org-brain sicp php-mode lua-mode markdown-mode python-mode haskell-mode helm-ag json-mode helm company ox-reveal sublime-themes avy htmlize tide plantuml-mode yasnippet)))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(yas-global-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "DAMA" :slant normal :weight normal :height 120 :width normal)))))
;;  '(default ((t (:family "Noto Sans Mono" :foundry "DAMA" :slant normal :weight normal :height 110 :width normal)))))


;; global key settings
(global-set-key [(control h)] 'delete-backward-char)
;;(keyboard-translate ?\C-h ?\C-?)

(global-set-key [(meta h)] 'backward-kill-word)
(global-set-key (kbd "M-g g") 'goto-line)

;;
(global-set-key (kbd "M-+") 'text-scale-increase)
(global-set-key (kbd "M--") 'text-scale-decrease)
(global-set-key (kbd "s-i") 'org-roam-insert)
(global-set-key (kbd "s-f") 'org-roam-find-file)
(global-set-key (kbd "s-d") 'deft)


;;(require 'calfw)
(require 'calfw-org)
