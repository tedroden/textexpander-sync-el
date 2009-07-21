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

;; 1) Assumming that you have text expander setup
;; 2) Download and add osx-plist.el to your emacs config
;;    http://edward.oconnor.cx/elisp/osx-plist.el
;; 3) Add this code below to your .emacs file (or include it like anything else)
;; 4) Whenever you want to resync your updates run this: M-x textexpander-sync


;;; Code:

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

