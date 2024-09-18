;; Variable to store election candidates
(define-data-var election-candidates (list 10 (tuple (candidate-name (buff 20)) (vote-count uint))) (list))

;; Map for candidate votes
(define-map candidate-votes {candidate-name: (buff 20)} uint)

;; Map to track voters
(define-map voters-map {voter-address: principal} bool)

;; Error constants
(define-constant ERR-NOT-DEPLOYER u100)
(define-constant ERR-ALREADY-VOTED u101)
(define-constant ERR-CANDIDATE-NOT-FOUND u102)

;; Helper function to check if the user has voted
(define-private (has-voted (voter principal))
  (is-some (map-get voters-map {voter-address: voter}))
)

;; Function to register candidates (only deployer)
(define-public (register-candidate (candidate-name (buff 20)))
  (begin
    (asserts! (is-eq tx-sender (as-contract tx-sender)) (err ERR-NOT-DEPLOYER))
    (map-insert candidate-votes {candidate-name: candidate-name} u0)
    (ok candidate-name)
  )
)

;; Function to allow users to vote for a candidate
(define-public (cast-vote (candidate-name (buff 20)))
  (begin
    (asserts! (not (has-voted tx-sender)) (err ERR-ALREADY-VOTED))
    (asserts! (is-some (map-get candidate-votes {candidate-name: candidate-name})) (err ERR-CANDIDATE-NOT-FOUND))
    
    ;; Increment the vote count for the selected candidate
    (let ((current-votes (default-to u0 (map-get candidate-votes {candidate-name: candidate-name}))))
      (map-insert candidate-votes {candidate-name: candidate-name} (+ current-votes u1)))

    ;; Mark the voter as having voted
    (map-insert voters-map {voter-address: tx-sender} true)
    (ok u1)
  )
)

;; Function to view election results
(define-public (view-results)
  (ok (map-get candidate-votes))
)
