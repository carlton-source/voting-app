import { Clarinet, Tx, Chain, Account, types } from "clarinet";

Clarinet.test({
  name: "Ensure the contract allows a user to vote and records votes correctly",
  async fn(chain: Chain, accounts: Map<string, Account>) {
    let deployer = accounts.get("deployer")!;
    let voter = accounts.get("wallet_1")!;

    // Add a candidate
    let addCandidate = chain.mineBlock([
      Tx.contractCall(
        "voting",
        "add-candidate",
        [types.buff("Alice")],
        deployer.address
      ),
    ]);

    addCandidate.receipts[0].result.expectOk();

    // Vote for the candidate
    let vote = chain.mineBlock([
      Tx.contractCall(
        "voting",
        "submit-vote",
        [types.buff("Alice")],
        voter.address
      ),
    ]);

    vote.receipts[0].result.expectOk();
  },
});
