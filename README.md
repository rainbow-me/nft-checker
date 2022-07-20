<img align="right" width="150" height="150" top="100" src="./assets/readme.jpg">

# op-nft • [![ci](https://github.com/rainbow-me/op-nft/actions/workflows/ci.yml/badge.svg)](https://github.com/rainbow-me/op-nft/actions/workflows/ci.yml) ![license](https://img.shields.io/github/license/rainbow-me/op-nft?label=license) ![solidity](https://img.shields.io/badge/solidity-^0.8.15-lightgrey)

Wrapper for Batching Optimism NFT Balance Requests.


## Overview

[op-nft](https://github.com/rainbow-me/op-nft) is a wrapper for the Official Optimism NFT to batch balance calls.


**Optimism NFT KOVAN**: [`0x58AcA48312f44C2f8215E5FBa67078Fb0cfd45bA`](https://kovan-optimistic.etherscan.io/address/0x58AcA48312f44C2f8215E5FBa67078Fb0cfd45bA)

**Optimism NFT MAINNET**: [`0x81b30ff521D1fEB67EDE32db726D95714eb00637`](https://optimistic.etherscan.io/address/0x81b30ff521D1fEB67EDE32db726D95714eb00637)


**Deployment Status**

[Optimism Mainnet] [`OpWrap`](./src/OpWrap.sol): [``](https://optimistic.etherscan.io/address/)

[Optimism Kovan] [`OpWrap`](./src/OpWrap.sol): [``](https://kovan-optimismic.etherscan.io/address/)


## Deployment Notes

**Deploying to Optimism Mainnet**
```bash
source .env
forge script script/Deploy.s.sol:Deploy --rpc-url $OPTIMISM_MAINNET --private-key $DEPLOYER_PRIVATE_KEY --broadcast --verify --etherscan-api-key $ETHERSCAN_API_KEY -vvvv
```

**Deploying to Optimism Kovan**
```bash
source .env
forge script script/Deploy.s.sol:Deploy --rpc-url $OPTIMISM_KOVAN --private-key $DEPLOYER_PRIVATE_KEY --broadcast --verify --etherscan-api-key $ETHERSCAN_API_KEY -vvvv
```


## Blueprint

```ml
lib
├─ forge-std — https://github.com/foundry-rs/forge-std
├─ solmate — https://github.com/Rari-Capital/solmate
scripts
├─ Deploy.s.sol — Simple Deployment Script
src
├─ OpWrap — The Wrapper Contract
test
└─ OpWrap.t — Tests
```


## License

[AGPL-3.0-only](https://github.com/abigger87/femplate/blob/master/LICENSE)


## Acknowledgements

- [femplate](https://github.com/abigger87/femplate)
- [foundry](https://github.com/foundry-rs/foundry)
- [solmate](https://github.com/Rari-Capital/solmate)
- [forge-std](https://github.com/brockelmore/forge-std)
- [forge-template](https://github.com/foundry-rs/forge-template)
- [foundry-toolchain](https://github.com/foundry-rs/foundry-toolchain)


## Disclaimer

_These smart contracts are being provided as is. No guarantee, representation or warranty is being made, express or implied, as to the safety or correctness of the user interface or the smart contracts. They have not been audited and as such there can be no assurance they will work as intended, and users may experience delays, failures, errors, omissions, loss of transmitted information or loss of funds. The creators are not liable for any of the foregoing. Users should proceed with caution and use at their own risk._
