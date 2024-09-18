;; Define a list to store candidates with their vote counts
(define-data-var candidates (list 10 (tuple (name (buff 20)) (votes uint))) (list))

;; Define a map to keep track of users who have voted
(define-map votes-map {voter: principal} bool)

;; Function to add a candidate to the list
;; Only the contract deployer can add candidates
(define-public (add-candidate (candidate-name (buff 20)))
  (begin
    ;; Check if the caller is the contract deployer
    (asserts! (is-eq tx-sender (as-contract tx-sender)) (err u100 "Only the contract deployer can add candidates"))
    ;; Add the new candidate to the list
    (var-set candidates (cons {name: candidate-name, votes: u0} (var-get candidates)))
    (ok candidate-name)
  )
)

;; Function to submit a vote for a specific candidate
(define-public (submit-vote (candidate-name (buff 20)))
  (begin
    ;; Ensure the voter has not voted before
    (asserts! (is-none (map-get votes-map {voter: tx-sender})) (err u101 "You have already voted"))

    ;; Find and update the candidate's vote count
    (let ((updated-candidates (map (lambda (candidate)
                                     (if (buff-eq? candidate-name (get name candidate))
                                         (tuple (name (get name candidate)) (votes (+ (get votes candidate) u1)))
                                         candidate))
                                   (var-get candidates))))
      (var-set candidates updated-candidates))
    
    ;; Mark the voter as having voted
    (map-insert votes-map {voter: tx-sender} true)
    
    (ok u1)
  )
)

;; Function to get the list of candidates and their vote counts
(define-public (get-results)
  (ok (var-get candidates))
)