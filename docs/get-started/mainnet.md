---
order: 3
---

# Join The Mainnet

:::tip
**Requirements:** [install fury](install.md)
:::

## Run a Full Node

### Start node from genesis

:::tip
**We recommend running a full node via state sync** (see the next subsection). But if you want to start from genesis, you must use fury [v1.0.1](https://github.com/gridiron-zone/fury/releases/tag/v1.0.1) to initialize your node.
:::

```bash
# initialize node configurations
fury init <moniker> --chain-id=fury-1

# download mainnet public config.toml and genesis.json
curl -o ~/.fury/config/config.toml https://raw.githubusercontent.com/irisnet/mainnet/master/config/config.toml
curl -o ~/.fury/config/genesis.json https://raw.githubusercontent.com/irisnet/mainnet/master/config/genesis.json

# start the node (you can also use "nohup" or "systemd" to run in the background)
fury start
```

Next, your node will process all chain upgrades. Between each upgrade, you must use the specified version to catch up with the block. Don't worry about using the old version at the upgrade height, the node will be halted automatically.

| Proposal | Start height | Upgrade height | fury version |
| -------- | ------------ | -------------- | ----- |
| genesis  |  9146456     |  9593205  | [v1.0.1](https://github.com/gridiron-zone/fury/releases/tag/v1.0.1) |
| [#1](https://fury.iobscan.io/#/ProposalsDetail/1)  |  9593206     |    | [v1.1.0](https://github.com/gridiron-zone/fury/releases/tag/v1.1.0), [v1.1.1](https://github.com/gridiron-zone/fury/releases/tag/v1.1.1)|
| [#8](https://fury.iobscan.io/#/ProposalsDetail/8)  |  12393048     | 12534300 | [v1.2.0](https://github.com/gridiron-zone/fury/releases/tag/v1.2.0), [v1.2.1](https://github.com/gridiron-zone/fury/releases/tag/v1.2.1) |
| [#11](https://fury.iobscan.io/#/ProposalsDetail/11)  |  14166918     |  14301916  | [v1.3.0](https://github.com/gridiron-zone/fury/releases/tag/v1.3.0) |
| [#19](https://fury.iobscan.io/#/gov/proposals/19)  |       |  17685953  | [v1.4.1](https://github.com/gridiron-zone/fury/releases/tag/v1.4.1) |

:::tip
You may see some connection errors, it does not matter, the P2P network is trying to find available connections

Try to add some of the [Community Peers](https://github.com/irisnet/mainnet/blob/master/config/community-peers.md) to `persistent_peers` in the config.toml

If you want to quickly start the node and join FURY Hub without historical data, you can consider using the [state_sync](./state-sync.md) function.
:::

### Quick Start via State Sync

To quickly get started, node operators can choose to sync via State Sync. State Sync works by replaying larger chunks of application state directly rather than replaying individual blocks or consensus rounds.

The newest state sync configs can be found [here](https://ping.pub/fury/statesync). **Please remember to modify state sync configs.**

```bash
# Build fury binary and initialize chain
fury init <moniker> --chain-id=fury-1

# Configure State sync
[statesync]
enable = true
rpc_servers = "http://34.82.96.8:26657,http://34.77.68.145:26657"
trust_height = 17613000
trust_hash = "990f1eaf06d456bc22891327e006d520cb407f8ad3bfee1edd43df0de1e1da1c"
trust_period = "168h"  # 2/3 of unbonding time

#Start Fury
fury start --x-crisis-skip-assert-invariants
```

## Upgrade to Validator Node

### Create a Wallet

You can [create a new wallet](../cli-client/keys.md#create-a-new-key) or [import an existing one](../cli-client/keys.md#recover-an-existing-key-from-seed-phrase), then get some FURY from the exchanges or anywhere else into the wallet you just created, .e.g.

```bash
# create a new wallet
fury keys add <key-name>
```

:::warning
**Important**

write the seed phrase in a safe place! It is the only way to recover your account if you ever forget your password.
:::

### Confirm your node has caught-up

```bash
# if you have not installed jq
# apt-get update && apt-get install -y jq

# if the output is false, means your node has caught-up
fury status | jq .sync_info.catching_up
```

### Create Validator

Only if your node has caught-up, you can run the following command to upgrade your node to be a validator.

```bash
fury tx staking create-validator \
    --pubkey=$(fury tendermint show-validator) \
    --moniker=<your-validator-name> \
    --amount=<amount-to-be-delegated, e.g. 10000grid> \
    --min-self-delegation=1 \
    --commission-max-change-rate=0.1 \
    --commission-max-rate=0.1 \
    --commission-rate=0.1 \
    --gas=100000 \
    --fees=0.6grid \
    --chain-id=fury-1 \
    --from=<key-name>
```

:::warning
**Important**

Backup the `config` directory located in your fury home (default ~/.fury/) carefully! It is the only way to recover your validator.
:::

If there are no errors, then your node is now a validator or candidate (depending on whether your delegation amount is in the top 100)

Read more:

- Concepts
  - [General Concepts](../concepts/general-concepts.md)
  - [Validator FAQ](../concepts/validator-faq.md)
- Validator Security
  - [Sentry Nodes (DDOS Protection)](../concepts/sentry-nodes.md)
  - [Key Management](../tools/kms.md)

## Faucet

Request GRIDnet mainnet tokens from the Faucet powered by Stakely.

For the usage, please refer to the guideline on the Faucet page: https://stakely.io/faucet/irisnet-fury
