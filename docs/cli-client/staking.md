# Staking

Staking module provides a set of subcommands to query staking state and send staking transactions.

## Available Commands

| Name                                                                         | Description                                                                                   |
| ---------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- |
| [validator](#fury-query-staking-validator)                                   | Query a validator                                                                             |
| [validators](#fury-query-staking-validators)                                 | Query for all validators                                                                      |
| [delegation](#fury-query-staking-delegation)                                 | Query a delegation based on address and validator address                                     |
| [delegations](#fury-query-staking-delegations)                               | Query all delegations made from one delegator                                                 |
| [delegations-to](#fury-query-staking-delegations-to)                         | Query all delegations to one validator                                                        |
| [unbonding-delegation](#fury-query-staking-unbonding-delegation)             | Query an unbonding-delegation record based on delegator and validator address                 |
| [unbonding-delegations](#fury-query-staking-unbonding-delegations)           | Query all unbonding-delegations records for one delegator                                     |
| [unbonding-delegations-from](#fury-query-staking-unbonding-delegations-from) | Query all unbonding delegatations from a validator                                            |
| [redelegations-from](#fury-query-staking-redelegations-from)                 | Query all outgoing redelegatations from a validator                                           |
| [redelegation](#fury-query-staking-redelegation)                             | Query a redelegation record based on delegator and a source and destination validator address |
| [redelegations](#fury-query-staking-redelegations)                           | Query all redelegations records for one delegator                                             |
| [pool](#fury-query-staking-pool)                                             | Query the current staking pool values                                                         |
| [params](#fury-query-staking-params)                                         | Query the current staking parameters information                                              |
| [historical-info](#fury-query-staking-historical-info)                       | Query historical info at given height                                                         |
| [create-validator](#fury-tx-staking-create-validator)                        | Create new validator initialized with a self-delegation to it                                 |
| [edit-validator](#fury-tx-staking-edit-validator)                            | Edit existing validator account                                                               |
| [delegate](#fury-tx-staking-delegate)                                        | Delegate liquid tokens to an validator                                                        |
| [unbond](#fury-tx-staking-unbond)                                            | Unbond shares from a validator                                                                |
| [redelegate](#fury-tx-staking-redelegate)                                    | Redelegate illiquid tokens from one validator to another                                      |

## fury query staking validator

### Query a validator by validator address

```bash
fury query staking validator <iva...>
```

## fury query staking validators

### Query all validators

```bash
fury query staking validators
```

## fury query staking delegation

Query a delegation based on delegator address and validator address.

```bash
fury query staking delegation [delegator-addr] [validator-addr]
```

### Query a delegation

```bash
fury query staking delegation <did:fury:aa...> <iva...>
```

Example Output:

```bash
Delegation:
  Delegator:  fury:fury:aa13lcwnxpyn2ea3skzmek64vvnp97jsk8qrcezvm
  Validator:  iva15grv3xg3ekxh9xrf79zd0w077krgv5xfzzunhs
  Shares:     1.0000000000000000000000000000
  Height:     26
```

## fury query staking delegations

Query all delegations delegated from one delegator.

```bash
fury query staking delegations [delegator-address] [flags]
```

### Query all delegations of a delegator

```bash
fury query staking delegations <did:fury:aa...>
```

## fury query staking delegations-to

Query all delegations to one validator.

```bash
fury query staking delegations-to [validator-address] [flags]
```

### Query all delegations to one validator

```bash
fury query staking delegations-to <iva...>
```

Example Output:

```bash
Delegation:
  Delegator:  fury:fury:aa13lcwnxpyn2ea3skzmek64vvnp97jsk8qrcezvm
  Validator:  iva1yclscskdtqu9rgufgws293wxp3njsesxxlnhmh
  Shares:     100.0000000000000000000000000000
  Height:     0
Delegation:
  Delegator:  fury:fury:aa1td4xnefkthfs6jg469x33shzf578fed6n7k7ua
  Validator:  iva1yclscskdtqu9rgufgws293wxp3njsesxxlnhmh
  Shares:     1.0000000000000000000000000000
  Height:     26
```

## fury query staking unbonding-delegation

Query an unbonding-delegation record based on delegator and validator address.

```bash
fury query staking unbonding-delegation [delegator-addr] [validator-addr] [flags]
```

### Query an unbonding delegation record

```bash
fury query staking unbonding-delegation <did:fury:aa...> <iva...>
```

## fury query staking unbonding-delegations

### Query all unbonding delegations records of a delegator

```bash
fury query staking unbonding-delegations <did:fury:aa...>
```

## fury query staking unbonding-delegations-from

### Query all unbonding delegations from a validator

```bash
fury query staking unbonding-delegations-from <iva...>
```

## fury query staking redelegations-from

Query all outgoing redelegations of a validator

```bash
fury query staking redelegations-from [validator-address] [flags]
```

### Query all outgoing redelegatations of a validator

```bash
fury query staking redelegations-from <iva...>
```

## fury query staking redelegation

Query a redelegation record based on delegator and source validator address and destination validator address.

```bash
fury query staking redelegation [delegator-addr] [src-validator-addr] [dst-validator-addr] [flags]
```

### Query a redelegation record

```bash
fury query staking redelegation <did:fury:aa...> <iva...> <iva...>
```

## fury query staking redelegations

### Query all redelegations records of a delegator

```bash
fury query staking redelegations <did:fury:aa...>
```

## fury query staking pool

### Query the current staking pool values

```bash
fury query staking pool
```

Example Output:

```bash
Pool:
  Loose Tokens:   1409493892.759816067399143966
  Bonded Tokens:  590526409.65743521209068061
  Token Supply:   2000020302.417251279489824576
  Bonded Ratio:   0.2952602076
```

## fury query staking params

### Query the current staking parameters information

```bash
fury query staking params
```

## fury query staking historical-info

### Query historical info at given height

```bash
fury query staking historical-info <height>
```

## fury tx staking create-validator

Send a transaction to apply to be a validator and delegate a certain amount of fury to it.

```bash
fury tx staking create-validator [flags]
```

**Flags:**

| Name, shorthand              | type   | Required | Default | Description                                                                                      |
| ---------------------------- | ------ | -------- | ------- | ------------------------------------------------------------------------------------------------ |
| --amount                     | string | Yes      |         | Amount of coins to bond                                                                          |
| --commission-rate            | float  | Yes      | 0.0     | The initial commission rate percentage                                                           |
| --commission-max-rate        | float  |          | 0.0     | The maximum commission rate percentage                                                           |
| --commission-max-change-rate | float  |          | 0.0     | The maximum commission change rate percentage (per day)                                          |
| --min-self-delegation        | string |          |         | The minimum self delegation required on the validator                                            |
| --details                    | string |          |         | Optional details                                                                                 |
| --genesis-format             | bool   |          | false   | Export the transaction in gen-tx format; it implies --generate-only                              |
| --identity                   | string |          |         | Optional identity signature (ex. UPort or Keybase)                                               |
| --ip                         | string |          |         | Node's public IP. It takes effect only when used in combination with                             |
| --node-id                    | string |          |         | The node's ID                                                                                    |
| --moniker                    | string | Yes      |         | Validator name                                                                                   |
| --pubkey                     | string | Yes      |         | Go-Amino encoded hex PubKey of the validator. For Ed25519 the go-amino prepend hex is 1624de6220 |
| --website                    | string |          |         | Optional website                                                                                 |
| --security-contact           | string |          |         | The validator's (optional) security contact email                                                |

### Create a validator

```bash
fury tx staking create-validator --chain-id=fury --from=<key-name> --fees=0.3grid --pubkey=<validator-pubKey> --commission-rate=0.1 --amount=100grid --moniker=<validator-name>
```

:::tip
Follow the [Mainnet](../get-started/mainnet.md#create-validator) instructions to learn more.
:::

## fury tx staking edit-validator

Edit an existing validator's settings, such as commission rate, name, etc.

```bash
fury tx staking edit-validator [flags]
```

**Flags:**

| Name, shorthand       | type   | Required | Default | Description                                           |
| --------------------- | ------ | -------- | ------- | ----------------------------------------------------- |
| --commission-rate     | float  |          | 0.0     | Commission rate percentage                            |
| --moniker             | string |          |         | Validator name                                        |
| --identity            | string |          |         | Optional identity signature (ex. UPort or Keybase)    |
| --website             | string |          |         | Optional website                                      |
| --details             | string |          |         | Optional details                                      |
| --security-contact    | string |          |         | The validator's (optional) security contact email     |
| --min-self-delegation | string |          |         | The minimum self delegation required on the validator |

### Edit validator information

```bash
fury tx staking edit-validator --from=<key-name> --chain-id=fury --fees=0.3grid --commission-rate=0.10 --moniker=<validator-name>
```

### Upload validator avatar

Please refer to [How to upload my validator's logo to the Explorers](../concepts/validator-faq.md#how-to-upload-my-validator-s-logo-to-the-explorers)

## fury tx staking delegate

Delegate tokens to a validator.

```bash
fury tx staking delegate [validator-addr] [amount] [flags]
```

```bash
fury tx staking delegate <iva...> <amount> --chain-id=fury --from=<key-name> --fees=0.3grid
```

## fury tx staking unbond

Unbond tokens from a validator.

```bash
fury tx staking unbond [validator-addr] [amount] [flags]
```

### Unbond some tokens from a validator

```bash
fury tx staking unbond <iva...> 10grid --from=<key-name> --chain-id=fury --fees=0.3grid
```

## fury tx staking redelegate

Transfer delegation from one validator to another.

:::tip
There is no `unbonding time` during the redelegation, so you will not miss the rewards. But you can only redelegate once per validator, until a period (= `unbonding time`) exceed.
:::

```bash
fury tx staking redelegate [src-validator-addr] [dst-validator-addr] [amount] [flags]
```

### Redelegate some tokens to another validator

```bash
fury tx staking redelegate <iva...> <iva...> 10grid --chain-id=fury --from=<key-name> --fees=0.3grid
```
