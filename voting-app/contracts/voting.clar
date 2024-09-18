(define-data-var election-candidates (list 10 (tuple (candidate-name (buff 20)) (vote-count uint))) (list))
(define-map candidate-votes {candidate-name: (buff 20)} uint)
(define-map voters-map {voter-address: principal} bool)

(define-public (register-candidate (candidate-name (buff 20)))
  (begin
    (asserts! (is-eq tx-sender (as-contract tx-sender)) (err u100))
    
    ;; Add the candidate with an initial vote count of 0
    (map-insert candidate-votes {candidate-name: candidate-name} u0)
    (ok candidate-name)
  )
)

(define-public (cast-vote (candidate-name (buff 20)))
  (begin
    (asserts! (is-none (map-get voters-map {voter-address: tx-sender})) (err u101))

    ;; Retrieve and increment the candidate's vote count
    (let ((current-votes (default-to u0 (map-get candidate-votes {candidate-name: candidate-name}))))
      (map-insert candidate-votes {candidate-name: candidate-name} (+ current-votes u1)))

    ;; Mark the user as having voted
    (map-insert voters-map {voter-address: tx-sender} true)
    (ok u1)
  )
)

(define-public (view-results)
  (ok (map-get candidate-votes))
)
