
(require 'ob-plantuml)
(require 'ob-ditaa)
(setq org-plantuml-jar-path "/usr/share/java/plantuml/plantuml.jar")

(setq org-babel-default-header-args:plantuml
      (cons '(:java . "-Dplantuml.include.path=\"/home/songzc/software/C4/\"")
            (assq-delete-all :java org-babel-default-header-args:plantuml)))


(setq plantuml-default-exec-mode 'jar)
(setq plantuml-jar-path "/usr/share/java/plantuml/plantuml.jar")

(setq org-ditaa-jar-path "/usr/share/java/ditaa/ditaa-0.11.jar")

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
          :publishing-directory "~/szc_life/github/songjangchal.github.io/html"
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


(setq org-image-actual-width nil)

;;Then in org-mode, you can use this for inline previews of JPGs and PNGs. Doesn't appear to work for SVGs (no idea why)

;; #+ATTR_ORG: :width 100
;; [[~/images/example.jpg]]

;; and if you want to size this for both inline previews and html output:

;; #+ATTR_HTML: width="100px"
;; #+ATTR_ORG: :width 100
;; [[~/images/example.jpg]]


(require 'ox-reveal)
(setq org-reveal-root "/home/songzc/codbase/reveal.js/release")
(setq org-reveal-mathjax-url "file:///home/songzc/codbase/reveal.js/MathJax-master/es5/tex-chtml.js")

;;(setq org-reveal-title-slide nil)

(require 'ox-md)
(require 'ox-pandoc-md)
; (require 'ox-confluence)
(require 'org-protocol)
(require 'org-capture)

;; org-brain
;;(use-package org-brain :ensure t
;;  :init
;;  (setq org-brain-path "~/szc_life/org-brain")
;;  :config
;;  (setq org-id-track-globally t)
;;  (setq org-id-locations-file "~/.emacs.d/.org-id-locations")
;;  (push '("b" "Brain" plain (function org-brain-goto-end)
;;          "* %i%?" :empty-lines 1)
;;        org-capture-templates)
;;  (setq org-brain-visualize-default-choices 'all)
;;  (setq org-brain-title-max-length 12))

(defun aa2u-buffer ()
  (aa2u (point-min) (point-max)))

(add-hook 'org-brain-after-visualize-hook #'aa2u-buffer)

(setq org-startup-truncated nil)


(setq web-capture-dir "~/szc_life/github/songjangchal.github.io/")
(setq org-capture-templates `(
	("p" "Protocol" entry (file+headline ,(concat web-capture-dir "notes.org") "Inbox")
         "* %^{Title}\nSource: [[%:link][%:description]], %u\n #+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n\n%?")
	("L" "Protocol Link" entry (file+headline ,(concat web-capture-dir "notes.org") "Inbox")
         "* %? [[%:link][%:description]] \nCaptured On: %U")
))

;;;(defun transform-square-brackets-to-round-ones(string-to-transform)
;;;  "Transforms [ into ( and ] into ), other chars left unchanged."
;;;  (concat 
;;;  (mapcar #'(lambda (c) (if (equal c ?[) ?\( (if (equal c ?]) ?\) c))) string-to-transform))
;;;  )
;;;
;;;(setq org-capture-templates `(
;;;	("p" "Protocol" entry (file+headline ,(concat org-directory "notes.org") "Inbox")
;;;        "* %^{Title}\nSource: %u, %c\n #+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n\n%?")	
;;;	("L" "Protocol Link" entry (file+headline ,(concat org-directory "notes.org") "Inbox")
;;;        "* %? [[%:link][%(transform-square-brackets-to-round-ones \"%:description\")]]\n")
;;;))

(setq org-bullets-bullet-list '("☰" "☷" "☯"))

(add-to-list 'auto-mode-alist '("\\.eml\\'" . org-mode))

(setq org-mime-library 'semi)

(setq org-roam-directory "~/new-brain")
; (add-hook 'after-init-hook 'org-roam-mode)

;(require 'org-roam-protocol)

;(require 'company-org-roam)
;(push 'company-org-roam company-backends)


;;(use-package org-download
;;  :after org
;;  :bind
;;  (:map org-mode-map
;;        (("s-Y" . org-download-screenshot)
;;         ("s-y" . org-download-yank))))



;;  org-journal
(defun org-journal-file-header-func (time)
  "Custom function to create journal header."
  (concat
   (pcase org-journal-file-type
     (`daily "#+TITLE: Daily Journal\n#+STARTUP: showeverything\n- tags :: [[yfile:%Y-%m.org][%Y-%m]]")
     (`weekly "#+TITLE: Weekly Journal\n#+STARTUP: folded")
     (`monthly "#+TITLE: Monthly Journal\n#+STARTUP: folded")
     (`yearly "#+TITLE: Yearly Journal\n#+STARTUP: folded"))))

;;   org-journal  Currently supported placeholders are:
;;%Y is the year.
;;%m is the numeric month.
;;%d is the day of the month, zero-padded.
;;%a is the locale’s abbreviated name of the day of week, %A the full name.
;;%b is the locale's abbreviated name of the month, %B the full name.
;;%F is the ISO 8601 date format (like \"%+4Y-%m-%d\").
(use-package org-journal
  :bind
  ("s-j" . org-journal-new-entry)
  :custom
  (org-journal-dir "~/new-brain")
  (org-journal-file-format "%Y-%m-%d.org")  
;  (org-journal-date-prefix "#+TITLE: ")
  (org-journal-date-format "%F, %A")
  (org-journal-file-header "#+TITLE: %F, %A, Dialy Journal\n#+STARTUP: showeverything\n- tags :: [[file:%Y-%m.org][%Y-%m]]"))
  ;;(org-journal-date-format "%a, %d %b %Y"))
;;  (org-journal-date-format "%A, %d %B %Y"))




(setq deft-directory "~/new-brain")
(setq deft-extensions '("org" "txt" "tex"))
(setq deft-new-file-format "%Y%m%d%H%M%S")

;;(setq deft-use-filter-string-for-filename t)
(setq deft-file-naming-rules '((noslash . "_")
                               (nospace . "_")
                               (case-fn . downcase)))


;;--------------replace deft.el deft-new-file by manualy
;;          (defun deft-new-file ()
;;            "Create a new file quickly.
;;          Use either an automatically generated filename or the filter string if non-nil
;;          and `deft-use-filter-string-for-filename' is set.  If the filter string is
;;          non-nil and title is not from filename, use it as the title."
;;            (interactive)
;;            (let* ((time-part (deft-unused-slug))
;;                   (name-part (deft-whole-filter-regexp))
;;                   (slug (concat time-part "-"  name-part)))
;;          ;;    (if (and deft-filter-regexp deft-use-filter-string-for-filename)
;;          ;;        ;; If the filter string is non-emtpy and titles are taken from
;;          ;;        ;; filenames is set, construct filename from filter string.
;;          ;;        (setq slug (deft-whole-filter-regexp))
;;          ;;      ;; If the filter string is empty, or titles are taken from file
;;          ;;      ;; contents, then use an automatically generated unique filename.
;;          ;;      (setq slug (deft-unused-slug)))
;;              (deft-new-file-named slug)))

(setq org-latex-to-mathml-convert-command
      "java -jar %j -unicode -force -df %o %I"
      org-latex-to-mathml-jar-file
      "~/software/mathtoweb.jar")

;; (setq org-latex-to-mathml-convert-command
;;        "/usr/bin/site_perl/latexmlmath \"%i\" --presentationmathml=%o")

;; (setq org-latex-to-mathml-convert-command
;;       "/usr/bin/latex2mathml -t \"%i\" > %o")


(provide 'init-org)

