
This elisp file will sync your TextExpander snippets with emacs so
that you can use them in abbrev mode. 

The official way to support textexpander is to remap meta-v to
yank... but an self respecting emacs user who would do that might as
well switch to vi. 

So, this script can import your snippets to emacs and make them
available via abbrev-mode. Just download, require and run: 

  M-x textexpander-sync

You'll also want to run abbrev-mode most of the time, something like
this should do it:

  (setq default-abbrev-mode t))

By: Ted Roden <tedroden@gmail.com>
