(define-data-var candidate-list (list 10 (tuple (name (buff 20)) (vote-count uint))) (list))

;; Store the addresses of users who have voted
(define-map voter-votes {voter: principal} bool)
