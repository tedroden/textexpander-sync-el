;;; textexpander-sync.el --- A utility to import textexpander entries into abbrev-mode

;; Copyright (C) 2009  Ted Roden <tedroden@gmail.com>

;; Author: Ted Roden <tedroden@gmail.com>

;; This file is free software; you can redistribute it and/or modify it
;; under the terms of the GNU General Public License as published by the
;; Free Software Foundation; either version 2, or (at your option) any
;; later version.

;; This file is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING. If not, write to the Free
;; Software Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
;; 02111-1307, USA.

;;; Instructions:

;; 1) Assuming that you have text expander setup
;; 2) put this file and osx-plist.el  in your lisp dir
;; 3) add to .emacs: 
;;   (require 'textexpander-sync)
;; 4) sync (and resync) via: M-x textexpander-sync
;; 5) In textexpander settings set "Expand In" to 
;;    "all applications excect" emacs
;; 
;; This code requires (osx-plist), which was probably included
;; If not, download it here:
;;   otherwise: http://edward.oconnor.cx/elisp/osx-plist.el
;; 


;;; Code:

(require 'osx-plist)

(defvar textexpander-sync-file "~/Library/Application Support/TextExpander/Settings.textexpander"
  "Your text epander settings")

(defun textexpander-sync ()
  "Grab TextExpander snippets " 
  (interactive)
  (let ((plist (osx-plist-parse-file textexpander-sync-file)))

	(let ((snippet (gethash "snippetsTE2" plist)))
	  (mapc (lambda (s)
			  (message "Importing %s" (gethash "abbreviation" s))
			  (setq abbrev (gethash "abbreviation" s))
			  (setq expand (gethash "plainText" s))
			  (define-abbrev global-abbrev-table abbrev expand)
			  )
			snippet)
	  )
	)
  )

(provide 'textexpander-sync)

