(require 'snails-core)
(require 'bookmark)

(snails-create-sync-backend
 :name
 "BOOKMARKS"
 :candidate-filter
 (lambda (input)
   (let (candidates)
     (dolist (bookmark (bookmark-all-names))
       (when (or
              (string-equal input "")
              (string-match-p (regexp-quote input) bookmark))

         (add-to-list 'candidates
                      (list bookmark bookmark)
                      t)))
     candidates))

 :candiate-do
 (lambda (candidate)
   (bookmark-jump candidate)))h

(provide 'snails-backend-bookmarks)
