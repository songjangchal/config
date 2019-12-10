;;  ---c/c++
(setq c-default-style "linux")
(setq c-basic-offset 4)
;;(setq c-brace-imaginary-offset 0)

;;(setq  c-hanging-braces-alist
;;       '((brace-list-open)
;;         (brace-entry-open)
;;         (substatement-open after)
;;         (block-close . c-snug-do-while)
;;         (arglist-cont-nonempty)))
;;

(c-set-offset 'case-label 4)
(c-set-offset 'statement-case-open 0)
(c-set-offset 'substatement-open 0)
(c-set-offset 'block-open 0)
(c-set-offset 'inline-open 0)

;;; cscope
(add-hook 'c-mode-common-hook
          '(lambda ()
             (require 'xcscope)
             (cscope-setup)))

(add-hook 'c-mode-common-hook
          (lambda () (subword-mode 1)))


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


(provide 'init-c-c++)
