;;; ox-md.el --- Markdown Back-End for Org Export Engine -*- lexical-binding: t; -*-

;; Copyright (C) 2012-2018 Free Software Foundation, Inc.

;; Author: Nicolas Goaziou <n.goaziou@gmail.com>
;; Keywords: org, wp, markdown

;; This file is part of GNU Emacs.

;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; This library implements a Markdown back-end (vanilla flavor) for
;; Org exporter, based on `html' back-end.  See Org manual for more
;; information.

;;; Code:

(require 'cl-lib)
(require 'ox-md)
(require 'ox-publish)

;;; User-Configurable Variables

(defgroup org-export-pandoc-md nil
  "Options specific to pandoc Markdown export back-end."
  :tag "Org Markdown"
  :group 'org-export
  :version "24.4"
  :package-version '(Org . "8.0"))

;;; Define Back-End

(org-export-define-derived-backend 'pandoc-md 'md
  :menu-entry
  '(?M "Export to Pandoc Markdown"
       ((?M "To temporary buffer"
	    (lambda (a s v b) (org-pandoc-md-export-as-markdown a s v)))
	(?m "To file" (lambda (a s v b) (org-pandoc-md-export-to-markdown a s v)))
	(?o "To file and open"
	    (lambda (a s v b)
	      (if a (org-pandoc-md-export-to-markdown t s v)
		(org-open-file (org-pandoc-md-export-to-markdown nil s v)))))))
  :translate-alist '(
;;;                     (table . org-pandoc-md-table)
;;;                     (table-cell . org-pandoc-md-table-cell)
;;;		     (table-row . org-pandoc-md-table-row)))
                     
                     (table . pandoc-md-org-identity)
                     (table-cell .  pandoc-md-org-identity)
		     (table-row .  pandoc-md-org-identity)))
                     

;;; Transcode Functions
(defun org-pandoc-md-table (table contents info)
  contents)

(defun org-pandoc-md-table-row  (table-row contents info)
  (concat
   (if (org-string-nw-p contents) (format "|%s" contents)
     "")
   (when (org-export-table-row-ends-header-p table-row info)
     "|")))

(defun org-pandoc-md-table-cell  (table-cell contents info)
  (let ((table-row (org-export-get-parent table-cell)))
    (concat (and (org-export-table-row-starts-header-p table-row info) "|")
            ;;	    (if (= (length contents) 0) " " contents)
            contents
	    "|")))


(defun pandoc-md-org-identity (blob contents _info)
  "Transcode BLOB element or object back into Org syntax.
CONTENTS is its contents, as a string or nil.  INFO is ignored."
  (let ((case-fold-search t))
    (replace-regexp-in-string
     "^[ \t]*#\\+ATTR_[-_A-Za-z0-9]+:\\(?: .*\\)?\n" ""
     (org-export-expand blob contents t))))


;;; Interactive function

;;;###autoload
(defun org-pandoc-md-export-as-markdown (&optional async subtreep visible-only)
  "Export current buffer to a Markdown buffer.

If narrowing is active in the current buffer, only export its
narrowed part.

If a region is active, export that region.

A non-nil optional argument ASYNC means the process should happen
asynchronously.  The resulting buffer should be accessible
through the `org-export-stack' interface.

When optional argument SUBTREEP is non-nil, export the sub-tree
at point, extracting information from the headline properties
first.

When optional argument VISIBLE-ONLY is non-nil, don't export
contents of hidden elements.

Export is done in a buffer named \"*Org MD Export*\", which will
be displayed when `org-export-show-temporary-export-buffer' is
non-nil."
  (interactive)
  (org-export-to-buffer 'pandoc-md "*Org Pandoc MD Export*"
    async subtreep visible-only nil nil (lambda () (text-mode))))

;;;###autoload
(defun org-pandoc-md-convert-region-to-md ()
  "Assume the current region has Org syntax, and convert it to Markdown.
This can be used in any buffer.  For example, you can write an
itemized list in Org syntax in a Markdown buffer and use
this command to convert it."
  (interactive)
  (org-export-replace-region-by 'pandoc-md))


;;;###autoload
(defun org-pandoc-md-export-to-markdown (&optional async subtreep visible-only)
  "Export current buffer to a Markdown file.

If narrowing is active in the current buffer, only export its
narrowed part.

If a region is active, export that region.

A non-nil optional argument ASYNC means the process should happen
asynchronously.  The resulting file should be accessible through
the `org-export-stack' interface.

When optional argument SUBTREEP is non-nil, export the sub-tree
at point, extracting information from the headline properties
first.

When optional argument VISIBLE-ONLY is non-nil, don't export
contents of hidden elements.

Return output file's name."
  (interactive)
  (let ((outfile (org-export-output-file-name ".md" subtreep)))
    (org-export-to-file 'pandoc-md outfile async subtreep visible-only)))

;;;###autoload
(defun org-pandoc-md-publish-to-md (plist filename pub-dir)
  "Publish an org file to Markdown.

FILENAME is the filename of the Org file to be published.  PLIST
is the property list for the given project.  PUB-DIR is the
publishing directory.

Return output file name."
  (org-publish-org-to 'pandoc-md filename ".md" plist pub-dir))

(provide 'ox-pandoc-md)

;; Local variables:
;; generated-autoload-file: "org-loaddefs.el"
;; End:

;;; ox-md.el ends here
