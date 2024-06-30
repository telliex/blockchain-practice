# Frontend Application

The frontend application is built using React and Web3.js to interact with the smart contract.

Currently, two official plugins are available:

- [@vitejs/plugin-react](https://github.com/vitejs/vite-plugin-react/blob/main/packages/plugin-react/README.md) uses [Babel](https://babeljs.io/) for Fast Refresh
- [@vitejs/plugin-react-swc](https://github.com/vitejs/vite-plugin-react-swc) uses [SWC](https://swc.rs/) for Fast Refresh


### MetaMask Configuration

```bash
  Open MetaMask extension in your browser.
  Connect MetaMask to the local Ganache network:
  Network Name: Ganache
  New RPC URL: http://127.0.0.1:7545
  Chain ID: 1337
  Currency Symbol: ETH
  Import an account using the private key provided by Ganache.
```