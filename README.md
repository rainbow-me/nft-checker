<img align="right" width="150" height="150" top="100" src="./assets/face-with-monocle.png">

# nft-checker • [![ci](https://github.com/rainbow-me/nft-checker/actions/workflows/ci.yml/badge.svg)](https://github.com/rainbow-me/nft-checker/actions/workflows/ci.yml) [![license](https://img.shields.io/badge/License-Apache_3.0-blue.svg?label=license)](https://opensource.org/licenses/Apache-3.0) ![solidity](https://img.shields.io/badge/solidity-^0.8.15-lightgrey)

Wrapper for Batching NFT Ownership checks.


## Overview

[nft-checker](https://github.com/rainbow-me/nft-checker) is a wrapper to check an array of contracts against an array of addresses.

**Deployment Status**

**Ethereum MAINNET**: [`0x47c9c137fc9aa5ccdbea707b0b27d52780565476`](https://etherscan.io/address/0x47c9c137fc9aa5ccdbea707b0b27d52780565476)

**Arbitrum One**: [`0x2a0332e28913a06fa924d40a3e2160f763010417`](https://arbiscan.io/address/0x2a0332e28913a06fa924d40a3e2160f763010417)

**Optimism MAINNET**: [`0x400a9f1bb1db80643c33710c2232a0d74ef5cff1`](https://optimistic.etherscan.io/address/0x400a9f1bb1db80643c33710c2232a0d74ef5cff1)

**Polygon MAINNET**: [`0x400a9f1bb1db80643c33710c2232a0d74ef5cff1`](https://polygonscan.com/address/0x400a9f1bb1db80643c33710c2232a0d74ef5cff1)

**Zora Network**: [`0x12A39421C23f4D3f788C33f0F9281652Ac4f909a`](https://explorer.zora.energy/address/0x12A39421C23f4D3f788C33f0F9281652Ac4f909a)

**BSC Mainnet**: [`0x5a9d9ffbd5a22f2790af726550920b845c3a6b35`](https://bscscan.com/address/0x5a9d9ffbd5a22f2790af726550920b845c3a6b35)

**BASE Mainnet**: [`0x7edddf0b8e7471e0ebf0df67ad179598c0bef695`](https://basescan.org/address/0x7edddf0b8e7471e0ebf0df67ad179598c0bef695)

**Gnosis Chain**: [`0x12a39421c23f4d3f788c33f0f9281652ac4f909a`](https://gnosisscan.io/address/0x12a39421c23f4d3f788c33f0f9281652ac4f909a)


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
forge script script/DeployArbOne.s.sol:DeployArbOne --rpc-url $ARBITRUM_ONE --private-key $DEPLOYER_PRIVATE_KEY --broadcast --verify --etherscan-api-key $ETHERSCAN_API_KEY_ABRITRUM -vvvv
```

**Deploying to Zora Network**
```bash
source .env
forge script script/DeployZoraMainnet.s.sol:DeployZoraMainnet --rpc-url $ZORA_MAINNET --private-key $DEPLOYER_PRIVATE_KEY --broadcast -vvvv
```

**Deploying to Base Network**
```bash
source .env
forge script script/DeployBaseMainnet.s.sol:DeployBaseMainnet --rpc-url $BASE_MAINNET --private-key $DEPLOYER_PRIVATE_KEY --broadcast -vvvv
```

**Deploying to BSC**
```bash
source .env
forge script script/DeployBSCMainnet.s.sol:DeployBSCMainnet --rpc-url $BSC_MAINNET --private-key $DEPLOYER_PRIVATE_KEY --broadcast --verify --etherscan-api-key $ETHERSCAN_API_KEY_BSC -vvvv
```

**Deploying to Gnosis**
```bash
source .env
forge script script/DeployGnosisMainnet.s.sol:DeployGnosisMainnet --rpc-url $GNOSIS_MAINNET --private-key $DEPLOYER_PRIVATE_KEY --broadcast --verify --etherscan-api-key $ETHERSCAN_API_KEY_GNOSIS -vvvv
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
├─ DeployPolygonMainnet.s.sol — Polygon Deployment Script
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
