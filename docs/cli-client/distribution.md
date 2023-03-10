# Distribution

The distribution module allows you to manage your [Staking Rewards](../concepts/general-concepts.md#staking-rewards).

## Available Subcommands

| Name                                                                                    | Description                                                                                                                                           |
| --------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| [commission](#fury-query-distribution-commission)                                       | Query distribution validator commission                                                                                                               |
| [community-pool](#fury-query-distribution-community-pool)                               | Query the amount of coins in the community pool                                                                                                       |
| [params](#fury-query-distribution-params)                                               | Query distribution params                                                                                                                             |
| [rewards](#fury-query-distribution-rewards)                                             | Query all distribution delegator rewards or rewards from a particular validator                                                                       |
| [slashes](#fury-query-distribution-slashes)                                             | Query distribution validator slashes.                                                                                                                 |
| [validator-outstanding-rewards](#fury-query-distribution-validator-outstanding-rewards) | Query distribution outstanding (un-withdrawn) rewards for a validator and all their delegations                                                       |
| [fund-community-pool](#fury-tx-distribution-fund-community-pool)                        | Funds the community pool with the specified amount                                                                                                    |
| [set-withdraw-addr](#fury-tx-distribution-set-withdraw-addr)                            | Set the withdraw address for rewards associated with a delegator address                                                                              |
| [withdraw-all-rewards](#fury-tx-distribution-withdraw-all-rewards)                      | Withdraw all rewards for a single delegator                                                                                                           |
| [withdraw-rewards](#fury-tx-distribution-withdraw-rewards)                              | Withdraw rewards from a given delegation address,and optionally withdraw validator commission if the delegation address given is a validator operator |

## fury query distribution commission

Query validator commission rewards from delegators to that validator.

```bash
fury query distribution commission [validator] [flags]
```

## fury query distribution community-pool

Query all coins in the community pool which is under Governance control.

```bash
fury query distribution community-pool [flags]
```

## fury query distribution params

Query distribution params.

```bash
 fury query distribution params [flags]
```

## fury query distribution rewards

Query all rewards earned by a delegator, optionally restrict to rewards from a single validator.

```bash
fury query distribution rewards [delegator-addr] [validator-addr] [flags]
```

## fury query distribution slashes

Query all slashes of a validator for a given block range.

```bash
fury query distribution slashes [validator] [start-height] [end-height] [flags]
```

## fury query distribution validator-outstanding-rewards

Query distribution outstanding (un-withdrawn) rewards for a validator and all their delegations.

```bash
fury query distribution validator-outstanding-rewards [validator] [flags]
```

## fury tx distribution fund-community-pool

Funds the community pool with the specified amount.

```bash
fury tx distribution fund-community-pool [amount] [flags]
```

## fury tx distribution set-withdraw-addr

Set the withdraw address for rewards associated with a delegator address.

```bash
fury tx distribution set-withdraw-addr [withdraw-addr] [flags]
```

## fury tx distribution withdraw-all-rewards

Withdraw all rewards for a single delegator.

```bash
fury tx distribution withdraw-all-rewards [flags]
```

## fury tx distribution withdraw-rewards

Withdraw rewards from a given delegation address, and optionally withdraw validator commission if the delegation address given is a validator operator.

```bash
fury tx distribution withdraw-rewards [validator-addr] [flags]
```
