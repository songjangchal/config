
(autoload 'scheme-mode "iuscheme" "Major mode for Scheme." t)
(autoload 'run-scheme "iuscheme" "Switch to interactive Scheme buffer." t)
(setq auto-mode-alist (cons '("\\.\\(ss\\|sls\\)" . scheme-mode) auto-mode-alist))
(put 'form-id 'scheme-indent-function 4)

(autoload 'balanced-toggle "balanced" "Toggle balanced ``mode''" t)
(autoload 'balanced-on "balanced" "Turn on balanced ``mode''" t)
(add-hook 'scheme-mode-hook 'balanced-on)


(provide 'init-scheme)
