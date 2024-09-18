import { Clarinet, Tx, Chain, Account, types } from "clarinet";

Clarinet.test({
  name: "Ensure the contract allows a user to vote and records votes correctly",
  async fn(chain: Chain, accounts: Map<string, Account>) {
    let deployer = accounts.get("deployer")!;
    let voter = accounts.get("wallet_1")!;
  },
});
