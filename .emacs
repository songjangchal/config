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
                                        ;(setq default-tab-width 4)
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

 ;(setq grep-command "findstr /n /s ") ; for windows

;(set-background-color "gray90")
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
;
;
;(defun my-maximized ()
;  (interactive)
;  (x-send-client-message
;   nil 0 nil "_NET_WM_STATE" 32
;   '(1 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
;  (interactive)
;  (x-send-client-message
;   nil 0 nil "_NET_WM_STATE" 32
;   '(1 "_NET_WM_STATE_MAXIMIZED_VERT" 0)))
;
;
;(my-maximized)

;;chinese
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)

                                        ;(create-fontset-from-fontset-spec
                                        ; "-*-fixed-medium-r-normal-*-24-*-*-*-*-*-fontset-standard,
                                        ;  chinese-gb2312:-*-*-medium-r-normal-*-24-*-*-*-*-*-gb2312.1980-*,
                                        ;	korean-ksc5601:-*-medium-r-normal-*-16-*-ksc5601*-*,
                                        ;	chinese-cns11643-1:-*-medium-r-normal-*-16-*-cns11643*-1,
                                        ;	chinese-cns11643-2:-*-medium-r-normal-*-16-*-cns11643*-2,
                                        ;	chinese-cns11643-3:-*-medium-r-normal-*-16-*-cns11643*-3,
                                        ;	chinese-cns11643-4:-*-medium-r-normal-*-16-*-cns11643*-4,
                                        ;	chinese-cns11643-5:-*-medium-r-normal-*-16-*-cns11643*-5,
                                        ;	chinese-cns11643-6:-*-medium-r-normal-*-16-*-cns11643*-6,
                                        ;	chinese-cns11643-7:-*-medium-r-normal-*-16-*-cns11643*-7" t)

;(custom-set-faces
;  ;; custom-set-faces was added by Custom.
;  ;; If you edit it by hand, you could mess it up, so be careful.
;  ;; Your init file should contain only one such instance.
;  ;; If there is more than one, they won't work right.
; '(default ((t (:inherit nil :stipple nil ; :background "#ffffff" :foreground "#000000"
;                         :inverse-video nil :box nil :strike-through nil  verline nil
;                         :underline nil :slant normal :weight normal :height 120
;                         :width normal :foundry "unknown" :family "Liberation Mono")))))


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
;=============================
; programming languages
;;  ---c/c++
(setq c-default-style "linux")
(setq c-basic-offset 4)
                                        ;(setq c-brace-imaginary-offset 0)

                                        ;(setq  c-hanging-braces-alist
                                        ;       '((brace-list-open)
                                        ;         (brace-entry-open)
                                        ;         (substatement-open after)
                                        ;         (block-close . c-snug-do-while)
                                        ;         (arglist-cont-nonempty)))
                                        ;

(c-set-offset 'case-label 4)
(c-set-offset 'statement-case-open 0)
(c-set-offset 'substatement-open 0)
(c-set-offset 'block-open 0)
(c-set-offset 'inline-open 0)

;;; cscope
(add-hook 'c-mode-common-hook
          '(lambda ()
             (require 'xcscope)))

;;; cscope
(add-hook 'java-mode-hook
          '(lambda ()
             (require 'xcscope)))

(add-hook 'c-mode-common-hook
               (lambda () (subword-mode 1)))
(add-to-list 'load-path "~/site-lisp")

(add-to-list 'load-path "~/site-lisp/cedet/semantic")
(add-to-list 'load-path "~/site-lisp/cedet/common")
(add-to-list 'load-path "~/site-lisp/cedet/cogre")
(add-to-list 'load-path "~/site-lisp/cedet/contrib")
(add-to-list 'load-path "~/site-lisp/cedet/ede")
(add-to-list 'load-path "~/site-lisp/cedet/eieio")
(add-to-list 'load-path "~/site-lisp/cedet/speedbar")
                                        ;setq(setq semantic-load-turn-everything-on t)
                                        ;(load-file "~/site-lisp/cedet/semantic/semantic-load.el")
                                        ;:browse confirm wa
; (load-file "~/site-lisp/cedet/common/cedet.el")
; (global-ede-mode 1)
; (semantic-load-enable-gaudy-code-helpers)
; (global-srecode-minor-mode 1)
;                                         ;(semantic-load-enable-code-helpers)
; (require 'semantic-sb)
; (add-to-list 'load-path "~/site-lisp/ecb-2.40")
; (require 'ecb-autoloads)

;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(custom-safe-themes
;;    (quote
;;     ("0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" "e26780280b5248eb9b2d02a237d9941956fc94972443b0f7aeec12b5c15db9f3" default)))
;;  '(org-babel-tangle-comment-format-beg "%source-name")
;;  '(org-babel-tangle-comment-format-end "end %source-name")
;;  '(org-export-odt-inline-image-extensions (quote ("png" "jpeg" "jpg" "gif" "svg")))
;;  '(org-export-with-sub-superscripts nil)
;;  '(org-use-sub-superscripts nil)
;; ;; '(package-selected-packages (quote (plantuml-mode org tide)))
;;  '(semantic-idle-scheduler-idle-time 200))


;(require 'ebnf2ps)

;;color theme
;(add-to-list 'load-path "~/site-lisp/color-theme-6.6.0")
;(require 'color-theme)

;(load "~/site-lisp/color-theme-molokai.el")
;(color-theme-molokai)
;(add-to-list 'custom-theme-load-path "~/site-lisp/emacs-color-themes/themes")
;(load-theme 'spolsky t)

;;; graphviz dot
;(load "~/site-lisp/graphviz-dot-mode.el")

;; haskell-mode
;;(load "~/site-lisp/haskell-mode/haskell-site-file")
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-ghci)
;;(add-hook 'haskell-mode-hook 'font-lock-mode)
;;(global-set-key [(control meta down-mouse-3)] 'imenu)
;;(add-hook 'haskell-mode-hook 'imenu-add-menubar-index)

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


;; TeX (ConTeX)
;(add-to-list 'load-path "~/site-lisp/auctex")
;(load "auctex.el" nil t t)
;;(load "preview-latex.el" nil t t)
;(setq TeX-default-mode 'context-en-mode)
;;(setq TeX-auto-save t)
;;(setq TeX-parse-self t)
;;(setq-default TeX-master nil)
; 
;;(setq exec-path (cons "~/site-lisp/xref" exec-path))
;;(setq load-path (cons "~/site-lisp/xref/emacs" load-path))
;;(load "xrefactory")
;
;
;;; git-emacs
;(add-to-list 'load-path "~/site-lisp/git-emacs")
;(require 'git-emacs)
;
;;; yasnippet
;(add-to-list 'load-path "~/site-lisp/yasnippet")
;(require 'yasnippet)
;(yas/initialize)
;(yas/load-directory "~/site-lisp/yasnippet/snippets")

;; rfc doc
;;(autoload 'get-rfc-view-rfc "get-rfc" "Get and view an RFC" t nil)
;;(autoload 'get-rfc-view-rfc-at-point "get-rfc" "View the RFC at point" t nil)
(autoload 'get-rfc-grep-rfc-index "get-rfc" "Grep rfc-index.txt" t nil)
(setq get-rfc-remote-rfc-index "ftp://ftp.rfc-editor.org/in-notes/rfc-index.txt")
(setq get-rfc-local-rfc-directory "~/library/rfcs/")
;;
;;(setq auto-mode-alist
;;      (cons '("/\\(draft[-].+\\|rfc[0-9]+\\)\\.txt\\(\\.gz\\)?\\'" . rfcview-mode)
;;            auto-mode-alist))
;;(autoload 'rfcview-mode "rfcview" nil t)
;;(eval-after-load "speedbar" '(load-library "sb-rfcview"))


;; plantuml
;(autoload 'plantuml-mode "plantuml-mode.el" nil t)
;(push '("\\.uml$" . plantuml-mode) auto-mode-alist)

;; org-mode
;(setq load-path (cons "/usr/local/share/emacs/site-lisp" load-path))
;(setq load-path (cons "~/site-lisp/org-8.2.10/lisp/" load-path))
(add-to-list 'load-path "~/szc_life/emacs.d")
;(require 'org-config)

;(add-to-list 'load-path "~/site-lisp/ibus-el-0.3.2")
;(require 'ibus)
;(add-hook 'after-init-hook 'ibus-mode-on)
;(setq ibus-agent-file-name "~/site-lisp/ibus-el-0.3.2/ibus-el-agent")

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


;; noweb
(autoload 'noweb-mode "noweb-mode" "Editing noweb files." t)
(setq auto-mode-alist (append (list (cons "\\.nw$" 'noweb-mode))
			      auto-mode-alist))

;;(require 'gyp)
;;(custom-set-faces
;; ;; custom-set-faces was added by Custom.
;; ;; If you edit it by hand, you could mess it up, so be careful.
;; ;; Your init file should contain only one such instance.
;; ;; If there is more than one, they won't work right.
;; )
;;
;;(require 'qml-mode)
;;
;;(require 'cmake-mode)  
;;(setq auto-mode-alist  
;;      (append '(("CMakeLists\\.txt\\'" . cmake-mode)  
;;                ("\\.cmake\\'" . cmake-mode))  
;;              auto-mode-alist)) 
;;(setq auto-mode-alist
;;      (cons '("\\.\\(qml\\)\\'" . qml-mode)
;;            auto-mode-alist))
;;
;;(require 'taskjuggler-mode)
;;
;;(require 'psvn)



;;(defun cpp-highlight-if-0/1 ()
;;  "Modify the face of text in between #if 0 ... #endif."
;;  (interactive)
;;  (setq cpp-known-face '(background-color . "dim gray"))
;;  (setq cpp-unknown-face 'default)
;;  (setq cpp-face-type 'dark)
;;  (setq cpp-known-writable 't)
;;  (setq cpp-unknown-writable 't)
;;  (setq cpp-edit-list
;;        '((#("1" 0 1
;;             (fontified nil))
;;           nil
;;           (background-color . "dim gray")
;;           both nil)
;;          (#("0" 0 1
;;             (fontified nil))
;;           (background-color . "dim gray")
;;           nil
;;           both nil)))
;;  (cpp-highlight-buffer t))
;;
;;(defun jpk/c-mode-hook ()
;;  (cpp-highlight-if-0/1)
;;  (add-hook 'after-save-hook 'cpp-highlight-if-0/1 'append 'local)
;;  )
;;
;;(add-hook 'c-mode-common-hook 'jpk/c-mode-hook)


(defun my-c-mode-font-lock-if0 (limit)
  (save-restriction
    (widen)
    (save-excursion
      (goto-char (point-min))
      (let ((depth 0) str start start-depth)
        (while (re-search-forward "^\\s-*#\\s-*\\(if\\|else\\|endif\\)" limit 'move)
          (setq str (match-string 1))
          (if (string= str "if")
              (progn
                (setq depth (1+ depth))
                (when (and (null start) (looking-at "\\s-+0"))
                  (setq start (match-end 0)
                        start-depth depth)))
            (when (and start (= depth start-depth))
              (c-put-font-lock-face start (match-beginning 0) 'font-lock-comment-face)
              (setq start nil))
            (when (string= str "endif")
              (setq depth (1- depth)))))
        (when (and start (> depth 0))
          (c-put-font-lock-face start (point) 'font-lock-comment-face)))))
  nil)

(defun my-c-mode-common-hook ()
  (font-lock-add-keywords
   nil
   '((my-c-mode-font-lock-if0 (0 font-lock-comment-face prepend))) 'add-to-end))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;;(autoload 'php-mode "php-mode.el" "Php mode." t)
;;(setq auto-mode-alist (append '(("/*.\.php[345]?$" . php-mode)) auto-mode-alist))


(setq auto-mode-alist (append '(("/*.\.page$" . markdown-mode)) auto-mode-alist))
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;  color-theme
;;  sublime theme
(load-theme 'spolsky t)
;(require 'capnp-mode)
;(add-to-list 'auto-mode-alist '("\\.capnp\\'" . capnp-mode))

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



;; 
;; enable a more powerful jump back function from ace jump mode
;;
;(autoload
;  'ace-jump-mode-pop-mark
;  "ace-jump-mode"
;  "Ace jump back:-)"
;  t)
;(eval-after-load "ace-jump-mode"
;  '(ace-jump-mode-enable-mark-sync))
;(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

;;If you use viper mode :
;;(define-key viper-vi-global-user-map (kbd "SPC") 'ace-jump-mode)
;;If you use evil
;;(define-key evil-normal-state-map (kbd "SPC") 'ace-jump-mode)

;(add-to-list 'load-path "~/site-lisp/avy-0.4.0")
;(mapc #'byte-compile-file '("avy.el"))
;(require 'avy)
;(if (fboundp 'checkdoc-file)
;    (checkdoc-file "avy.el")
;  (require 'checkdoc)
;  (with-current-buffer (find-file "avy.el")
;    (checkdoc-current-buffer t)))

                                        ;(global-set-key (kbd "C-,") 'avy-goto-char)
(define-key global-map (kbd "C-,") 'avy-goto-char)
(global-set-key (kbd "C-.") 'avy-goto-word-1)

(require 'package)
(add-to-list 'package-archives'
  ("elpa" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives' 
  ("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives'
  ("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)


;(add-to-list 'load-path "~/site-lisp/tide-2.0.0-beta")
;;(require 'tide)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)

;; format options
(setq tide-format-options '(:insertSpaceAfterFunctionKeywordForAnonymousFunctions t :placeOpenBraceOnNewLineForFunctions nil))
;;(add-hook 'typescript-mode-hook #'setup-tide-mode)

;;(require 'taskjuggler-mode)

(global-auto-revert-mode 1)



(defun my-js-mode-hook ()
  "My personal Javascript mode hook."
  (setq js-indent-level 2))

(add-hook 'js-mode-hook 'my-js-mode-hook)


(autoload 'scheme-mode "iuscheme" "Major mode for Scheme." t)
(autoload 'run-scheme "iuscheme" "Switch to interactive Scheme buffer." t)
(setq auto-mode-alist (cons '("\\.\\(ss\\|sls\\)" . scheme-mode) auto-mode-alist))
(put 'form-id 'scheme-indent-function 4)

(autoload 'balanced-toggle "balanced" "Toggle balanced ``mode''" t)
(autoload 'balanced-on "balanced" "Turn on balanced ``mode''" t)
(add-hook 'scheme-mode-hook 'balanced-on)

(require 'ob-plantuml)

(setq ibus-agent-file-name "~/site-lisp/ibus-el-0.3.2/ibus-el-agent")

(setq org-plantuml-jar-path "~/software/plantuml.jar")
(setq org-confirm-babel-evaluate nil)
