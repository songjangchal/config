(require 'exwm)

;; before calling (exwm-enable).
(require 'exwm-randr)
(setq exwm-randr-workspace-output-plist '(1 "HDMI1" 2 "VGA1"))
(add-hook 'exwm-randr-screen-change-hook
          (lambda ()
            (start-process-shell-command
             "xrandr" nil "xrandr --output HDMI1 --right-of VGA1 --auto")))
(exwm-randr-enable)

;; before (exwm-enable)
(require 'exwm-systemtray)
(exwm-systemtray-enable)

(require 'exwm-x)
(add-to-list 'load-path (expand-file-name "elpa/exwm-x-20180227.257" user-emacs-directory))
;;(require 'exwmx-example) ;; Adjust this line.

;;(setq exwm-workspace-minibuffer-position 'bottom)

(require 'exwm-config)
(exwm-config-default)




(provide 'init-exwm)
