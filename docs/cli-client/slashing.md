# Slashing

Slashing module can unjail validator previously jailed for downtime

## Available Commands

| Name                                                | Description                                     |
| --------------------------------------------------- | ----------------------------------------------- |
| [unjail](#fury-tx-slashing-unjail)                  | Unjail validator previously jailed for downtime |
| [params](#fury-query-slashing-params)               | Query the current slashing parameters           |
| [signing-info](#fury-query-slashing-signing-info)   | Query a validator's signing information         |
| [signing-infos](#fury-query-slashing-signing-infos) | Query signing information of all validators     |

## fury tx slashing unjail

Unjail validator previously jailed for downtime.

```bash
fury tx slashing unjail [flags]
```

## fury query slashing params

Query the current slashing parameters.

```bash
fury query slashing params  [flags]
```

## fury query slashing signing-info

Query a validator's signing information.

```bash
fury query slashing signing-info [validator-conspub] [flags]
```

## fury query slashing signing-infos

Query signing information of all validators.

```bash
fury query slashing signing-infos [flags]
```
