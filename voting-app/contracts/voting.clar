;; Variable to store a list of candidates, each with a name and vote count
(define-data-var election-candidates (list 10 (tuple (candidate-name (buff 20)) (vote-count uint))) (list))

;; Map to track which users (voters) have already voted
(define-map voters-map {voter-address: principal} bool)

;; Function to allow only the contract deployer to register new candidates
(define-public (register-candidate (candidate-name (buff 20)))
  (begin
    ;; Ensure the caller is the contract itself (deployer)
    (asserts! (is-eq tx-sender (as-contract tx-sender)) (err u100))
    
    ;; Add the candidate with a vote count of 0
    (var-set election-candidates (cons {candidate-name: candidate-name, vote-count: u0} (var-get election-candidates)))
    (ok candidate-name)
  )
)

;; Function to allow users to cast their vote for a specific candidate
(define-public (cast-vote (candidate-name (buff 20)))
  (begin
    ;; Ensure the user hasn't already voted
    (asserts! (is-none (map-get voters-map {voter-address: tx-sender})) (err u101))

    ;; Search for the candidate and increase their vote count
    (map (lambda (candidate)
           (if (buff-eq? candidate-name (get candidate-name candidate))
               (tuple (candidate-name (get candidate-name candidate)) (vote-count (+ (get vote-count candidate) u1)))
               candidate))
         (var-get election-candidates))
    
    ;; Mark the user as having voted
    (map-insert voters-map {voter-address: tx-sender} true)
    (ok u1)
  )
)

;; Function to retrieve the list of all candidates and their vote counts
(define-public (view-results)
  (ok (var-get election-candidates))
)
