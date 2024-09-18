;; Helper function to check if the voter has already voted
(define-private (has-voted (voter principal))
  (is-some (map-get voters-map {voter-address: voter}))
)

(define-public (cast-vote (candidate-name (buff 20)))
  (begin
    ;; Ensure the user hasn't already voted by calling the helper function
    (asserts! (not (has-voted tx-sender)) (err u101))

    ;; Increment the candidate's vote count
    (let ((current-votes (default-to u0 (map-get candidate-votes {candidate-name: candidate-name}))))
      (map-insert candidate-votes {candidate-name: candidate-name} (+ current-votes u1)))

    ;; Mark the user as having voted
    (map-insert voters-map {voter-address: tx-sender} true)
    (ok u1)
  )
)
