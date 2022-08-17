<img align="right" width="150" height="150" top="100" src="./assets/optimism.svg">

# nft-checker • [![ci](https://github.com/rainbow-me/nft-checker/actions/workflows/ci.yml/badge.svg)](https://github.com/rainbow-me/nft-checker/actions/workflows/ci.yml) [![license](https://img.shields.io/badge/License-Apache_3.0-blue.svg?label=license)](https://opensource.org/licenses/Apache-3.0) ![solidity](https://img.shields.io/badge/solidity-^0.8.15-lightgrey)

Wrapper for Batching NFT Ownership checks.


## Overview

[nft-checker](https://github.com/rainbow-me/nft-checker) is a wrapper to check an array of contracts against an array of addresses.


**Ethereum MAINNET**: [`TBD`](https://optimistic.etherscan.io/address/TBD)
**Arbitrum One**: [`TBD`](https://optimistic.etherscan.io/address/TBD)
**Optimism MAINNET**: [`TBD`](https://optimistic.etherscan.io/address/TBD)
**Polygon MAINNET**: [`TBD`](https://optimistic.etherscan.io/address/TBD)


**Deployment Status**

[Ethereum Mainnet] [`NftChecker`](./src/NftChecker.sol): [`TBD`](https://etherscan.io/address/TBD)
[Arbitrum One] [`NftChecker`](./src/NftChecker.sol): [`TBD`](https://arbiscan.io/address/TBD)
[Optimism Mainnet] [`NftChecker`](./src/NftChecker.sol): [`TBD`](https://optimistic.etherscan.io/address/TBD)
[Polygon Mainnet] [`NftChecker`](./src/NftChecker.sol): [`TBD`](https://polyscan.io/address/TBD)


## Deployment Notes

**Deploying to Ethereum Mainnet**
```bash
source .env
forge script script/DeployEthMainnet.s.sol:DeployEthMainnet --rpc-url $ETHEREUM_MAINNET --private-key $DEPLOYER_PRIVATE_KEY --broadcast --verify --etherscan-api-key $ETHERSCAN_API_KEY_MAINNET -vvvv
```

**Deploying to Optimism Mainnet**
```bash
source .env
forge script script/DeployOpMainnet.s.sol:DeployOpMainnet --rpc-url $OPTIMISM_MAINNET --private-key $DEPLOYER_PRIVATE_KEY --broadcast --verify --etherscan-api-key $ETHERSCAN_API_KEY_OPTIMISM -vvvv
```

**Deploying to Polygon Mainnet**
```bash
source .env
forge script script/DeployPolygonMainnet.s.sol:DeployPolygonMainnet --rpc-url $POLYGON_MAINNET --private-key $DEPLOYER_PRIVATE_KEY --broadcast --verify --etherscan-api-key $ETHERSCAN_API_KEY_POLYGON -vvvv
```

**Deploying to Arbitrum One**
```bash
source .env
forge script script/DeployArbMainnet.s.sol:DeployArbMainnet --rpc-url $ARBITRUM_ONE --private-key $DEPLOYER_PRIVATE_KEY --broadcast --verify --etherscan-api-key $ETHERSCAN_API_KEY_ABRITRUM -vvvv
```


## Blueprint

```ml
lib
├─ forge-std — https://github.com/foundry-rs/forge-std
├─ solmate — https://github.com/transmissions11/solmate
scripts
├─ DeployArbOne.s.sol — Arbitrum One Deployment Script
├─ DeployEthMainnet.s.sol — Ethereum Mainnet Deployment Script
├─ DeployOpMainnet.s.sol — Optimism Mainnet Deployment Script
├─ DeployPolgonMainnet.s.sol — Polygon Deployment Script
src
├─ NftChecker — The Checker Contract
test
└─ NftChecker.t — Tests
```


## License

[AGPL-3.0-only](https://github.com/rainbow-me/nft-checker/blob/main/LICENSE)


## Acknowledgements

- [femplate](https://github.com/abigger87/femplate)
- [foundry](https://github.com/foundry-rs/foundry)
- [solmate](https://github.com/Rari-Capital/solmate)
- [forge-std](https://github.com/brockelmore/forge-std)
- [forge-template](https://github.com/foundry-rs/forge-template)
- [foundry-toolchain](https://github.com/foundry-rs/foundry-toolchain)


## Disclaimer

_These smart contracts are being provided as is. No guarantee, representation or warranty is being made, express or implied, as to the safety or correctness of the user interface or the smart contracts. They have not been audited and as such there can be no assurance they will work as intended, and users may experience delays, failures, errors, omissions, loss of transmitted information or loss of funds. The creators are not liable for any of the foregoing. Users should proceed with caution and use at their own risk._
