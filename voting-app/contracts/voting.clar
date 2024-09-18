;; Define a list to store candidates with their vote counts
(define-data-var candidate-list (list 10 (tuple (name (buff 20)) (vote-count uint))) (list))

;; Define a map to keep track of users who have voted
(define-map voter-votes {voter: principal} bool)

;; Function to add a candidate to the list
;; Only the contract deployer can add candidates
(define-public (add-candidate (candidate-name (buff 20)))
  (begin
    ;; Check if the caller is the contract deployer
    (asserts! (is-eq tx-sender (as-contract tx-sender)) (err u100))
    ;; Add the new candidate to the list
    (var-set candidate-list (cons {name: candidate-name, vote-count: u0} (var-get candidate-list)))
    (ok candidate-name)
  )
)

;; Function to submit a vote for a specific candidate
(define-public (submit-vote (candidate-name (buff 20)))
  (begin
    ;; Ensure the voter has not voted before
    (asserts! (is-none (map-get voter-votes {voter: tx-sender})) (err u101))

    ;; Find and update the candidate's vote count
    (let ((updated-candidates (map (lambda (candidate)
                                     (if (buff-eq? candidate-name (get name candidate))
                                         (tuple (name (get name candidate)) (vote-count (+ (get vote-count candidate) u1)))
                                         candidate))
                                   (var-get candidate-list))))
      (var-set candidate-list updated-candidates)
    )

    ;; Mark the voter as having voted
    (map-insert voter-votes {voter: tx-sender} true)
    
    (ok u1)
  )
)

;; Function to retrieve the list of candidates and their vote counts
(define-public (get-results)
  (ok (var-get candidate-list))
)
