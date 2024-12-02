<img align="right" width="150" height="150" top="100" src="./assets/face-with-monocle.png">

# nft-checker • [![ci](https://github.com/rainbow-me/nft-checker/actions/workflows/ci.yml/badge.svg)](https://github.com/rainbow-me/nft-checker/actions/workflows/ci.yml) [![license](https://img.shields.io/badge/License-Apache_3.0-blue.svg?label=license)](https://opensource.org/licenses/Apache-3.0) ![solidity](https://img.shields.io/badge/solidity-^0.8.20-lightgrey)

Wrapper for Batching NFT Ownership checks.


## Overview

[nft-checker](https://github.com/rainbow-me/nft-checker) is a wrapper to check an array of contracts against an array of addresses.

**Deployment Status**

**Ethereum MAINNET**: [`0xc4A8619B3980d84F6d59d416d415007A1217fEc8`](https://etherscan.io/address/0xc4A8619B3980d84F6d59d416d415007A1217fEc8)

**Arbitrum One**: [`0x5A9D9FFBd5a22f2790AF726550920B845c3A6B35`](https://arbiscan.io/address/0x5A9D9FFBd5a22f2790AF726550920B845c3A6B35)

**Optimism MAINNET**: [`0x5A9D9FFBd5a22f2790AF726550920B845c3A6B35`](https://optimistic.etherscan.io/address/0x5A9D9FFBd5a22f2790AF726550920B845c3A6B35)

**Polygon MAINNET**: [`0x3e3937C119BD854059844D3D03A8116a18Afa409`](https://polygonscan.com/address/0x3e3937C119BD854059844D3D03A8116a18Afa409)

**Zora Network**: [`0x75efed6B8AF6B0490c2899e489c58EF26E3D0898`](https://explorer.zora.energy/address/0x75efed6B8AF6B0490c2899e489c58EF26E3D0898)

**BSC Mainnet**: [`0x50a42aB85A09e24229e42dAd31Cb44B42E83b2De`](https://bscscan.com/address/0x50a42aB85A09e24229e42dAd31Cb44B42E83b2De)

**BASE Mainnet**: [`0xa5d7b264ad7039F54A670c27Fe5A64CAd0FE0cCe`](https://basescan.org/address/0xa5d7b264ad7039F54A670c27Fe5A64CAd0FE0cCe)

**Gnosis Chain**: [`0x2488F7B6FD1A0949391fE6a533D7E5c4704173E2`](https://gnosisscan.io/address/0x2488F7B6FD1A0949391fE6a533D7E5c4704173E2)

**Avalanche**: [`0x2a0332E28913A06Fa924d40A3E2160f763010417`](https://snowtrace.io/address/0x2a0332E28913A06Fa924d40A3E2160f763010417)


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
forge script script/DeployArbOne.s.sol:DeployArbOne --rpc-url $ARBITRUM_ONE --private-key $DEPLOYER_PRIVATE_KEY --broadcast --verify --etherscan-api-key $ETHERSCAN_API_KEY_ARBITRUM -vvvv
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

**Deploying to Avalanche**
```bash
source .env
forge script script/DeployAvalancheMainnet.s.sol:DeployAvalancheMainnet --rpc-url $AVALANCHE_MAINNET --private-key $DEPLOYER_PRIVATE_KEY --broadcast --verify --etherscan-api-key $ETHERSCAN_API_KEY_AVALANCHE -vvvv
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
