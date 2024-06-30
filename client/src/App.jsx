import React, { useEffect, useState } from "react";
import getWeb3 from "./web3";
import getContract from "./MyToken";

const App = () => {
  const [web3, setWeb3] = useState(null);
  const [accounts, setAccounts] = useState([]);
  const [contract, setContract] = useState(null);
  const [balance, setBalance] = useState(0);
  const [transferTo, setTransferTo] = useState("");
  const [transferAmount, setTransferAmount] = useState("");

  useEffect(() => {
    const init = async () => {
      try {
        const web3Instance = await getWeb3();
        const accounts = await web3Instance.eth.getAccounts();
        const contractInstance = await getContract(web3Instance);

        setWeb3(web3Instance);
        setAccounts(accounts);
        setContract(contractInstance);

        const balance = await contractInstance.methods
          .balanceOf(accounts[0])
          .call();
        setBalance(balance);
      } catch (error) {
        console.error("Could not connect to contract or chain.", error);
      }
    };
    init();
  }, []);

  const handleTransfer = async () => {
    if (contract && accounts.length > 0) {
      try {
        const amountInSmallestUnit = web3.utils.toWei(transferAmount, "ether");

        await contract.methods
          .transfer(transferTo, amountInSmallestUnit)
          .send({ from: accounts[0] });
        const balance = await contract.methods.balanceOf(accounts[0]).call();
        setBalance(balance);
      } catch (error) {
        console.error("Transfer failed.", error);
      }
    }
  };

  return (
    <div className="App">
      <h1>MyToken DApp</h1>
      <p>Account: {accounts[0]}</p>
      <p>Balance: {web3 ? web3.utils.fromWei(balance, "ether") : 0} MTK</p>
      <div>
        <input
          type="text"
          placeholder="Recipient Address"
          value={transferTo}
          onChange={(e) => setTransferTo(e.target.value)}
        />
        <input
          type="text"
          placeholder="Amount"
          value={transferAmount}
          onChange={(e) => setTransferAmount(e.target.value)}
        />
        <button onClick={handleTransfer}>Transfer</button>
      </div>
    </div>
  );
};

export default App;
