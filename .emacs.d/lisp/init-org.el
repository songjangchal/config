
(require 'ob-plantuml)

(setq org-plantuml-jar-path "~/software/plantuml.jar")
(setq org-confirm-babel-evaluate nil)


;;(require 'org-config)
;;(add-to-list 'load-path "~/site-lisp/ibus-el-0.3.2")
;;(require 'ibus)
;;(add-hook 'after-init-hook 'ibus-mode-on)
;;(setq ibus-agent-file-name "~/site-lisp/ibus-el-0.3.2/ibus-el-agent")

(defun my-org-publish-find-title (file project)
  "Find the title of FILE in PROJECT."
  (let ((file (org-publish--expand-file-name file project)))
    ;;    (or (org-publish-cache-get-file-property file :title nil t)
    (or nil
	(let* ((parsed-title (org-publish-find-property file :title project))
	       (title
		(if parsed-title
		    ;; Remove property so that the return value is
		    ;; cache-able (i.e., it can be `read' back).
		    (org-no-properties
		     (org-element-interpret-data parsed-title))
		  (file-name-nondirectory (file-name-sans-extension file)))))
	  (org-publish-cache-set-file-property file :title title)
	  title))))

(defun my-org-publish-sitemap-default-entry (entry style project)
  "Default format for site map ENTRY, as a string.
ENTRY is a file name.  STYLE is the style of the sitemap.
PROJECT is the current project."
  (print (my-org-publish-find-title entry project))
  (cond ((not (directory-name-p entry))
	 (format "[[file:%s][%s]]"
		 entry
		 (org-publish-find-title entry project)))
	((eq style 'tree)
	 ;; Return only last subdir.
	 (file-name-nondirectory (directory-file-name entry)))
	(t entry)))


(setq org-publish-project-alist
      '(("blog"
          :base-directory "~/szc_life/github/songjangchal.github.io/org"
          :base-extension "org"
          :publishing-directory "~/szc_life/github/songjangchal.github.io/"
          :publishing-function org-html-publish-to-html
          :style-include-default nil       
          :headline-levels 3
          :recursive 3
          :section-numbers nil
          :table-of-contents nil
          :auto-sitemap t                ; Generate sitemap.org automagically...
          :sitemap-filename "index.org"  ; ... call it sitemap.org (it's the default)...
          :sitemap-title "Sitemap"         ; ... with title 'Sitemap'.
          :sitemap-sort-files anti-chronologically
          :sitemap-format-entry my-org-publish-sitemap-default-entry
          :auto-preamble t
          :section-numbers nil
          :author "szc.buda"
          :email "szc.buda@yahoo.com"
          :creator-info nil
          )))

(provide 'init-org)