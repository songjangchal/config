
;; noweb
(autoload 'noweb-mode "noweb-mode" "Editing noweb files." t)
(setq auto-mode-alist (append (list (cons "\\.nw$" 'noweb-mode))
			      auto-mode-alist))


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


;;; cscope
(add-hook 'java-mode-hook
          '(lambda ()
             (require 'xcscope)))

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


