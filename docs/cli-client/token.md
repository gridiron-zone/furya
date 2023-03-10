# Token

Token module allows you to manage assets on FURY Hub

## Available Commands

| Name                                       | Description                                |
| ------------------------------------------ | ------------------------------------------ |
| [issue](#fury-tx-token-issue)              | Issue a new token                          |
| [edit](#fury-tx-token-edit)                | Edit an existing token                     |
| [transfer](#fury-tx-token-transfer)        | Transfer the ownership of a token          |
| [mint](#fury-tx-token-mint)                | Mint tokens to a specified address         |
| [burn](#fury-tx-token-burn)                | Burn some tokens                           |
| [token](#fury-query-token-token)           | Query a token by symbol                    |
| [tokens](#fury-query-token-tokens)         | Query tokens by owner                      |
| [fee](#fury-query-token-fee)               | Query the token related fees               |
| [params](#fury-query-token-params)         | Query the token related params             |
| [total-burn](#fury-query-token-total-burn) | Query the total amount of all burn tokens. |

## fury tx token issue

Issue a new token

```bash
fury tx token issue [flags]
```

**Flags:**

| Name, shorthand  | Type    | Required | Default       | Description                                                                                                                    |
| ---------------- | ------- | -------- | ------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| --name           | string  | Yes      |               | Name of the newly issued token, limited to 32 unicode characters, e.g. "FURY Network"                                          |
| --symbol         | string  | Yes      |               | The symbol of the token, length between 3 and 8, alphanumeric characters beginning with alpha, case insensitive                |
| --initial-supply | uint64  | Yes      |               | The initial supply of this token. The amount before boosting should not exceed 100 billion.                                    |
| --max-supply     | uint64  |          | 1000000000000 | The hard cap of this token, total supply can not exceed max supply. The amount before boosting should not exceed 1000 billion. |
| --min-unit       | string  |          |               | The alias of minimum uint                                                                                                      |
| --scale          | uint8   | Yes      |               | A token can have a maximum of 18 digits of decimal                                                                             |
| --mintable       | boolean |          | false         | Whether this token could be minted(increased) after the initial issuing                                                        |

### Issue a token

```bash
fury tx token issue \
    --name="Kitty Token" \
    --symbol="kitty" \
    --min-unit="kitty" \
    --scale=0 \
    --initial-supply=100000000000 \
    --max-supply=1000000000000 \
    --mintable=true \
    --from=<key-name> \
    --chain-id=<chain-id> \
    --fees=<fee>
```

### Send tokens

You can send any tokens you have just like [sending fury](./bank.md#fury-tx-bank-send)

#### Send tokens

```bash
fury tx bank send [from_key_or_address] [to_address] [amount] [flags]
```

## fury tx token edit

Edit an existing token

```bash
fury tx token edit [symbol] [flags]
```

**Flags:**

| Name         | Type   | Required | Default | Description                                       |
| ------------ | ------ | -------- | ------- | ------------------------------------------------- |
| --name       | string |          |         | The token name, e.g. FURY Network                 |
| --max-supply | uint64 |          | 0       | The max supply of the token                       |
| --mintable   | bool   |          | false   | Whether the token can be minted, default to false |

`max-supply` should not be less than the current total supply

### Edit Token

```bash
fury tx token edit <symbol> --name="Cat Token" --max-supply=100000000000 --mintable=true --from=<key-name> --chain-id=<chain-id> --fees=<fee>
```

## fury tx token transfer

Transfer the ownership of a token

```bash
fury tx token transfer [symbol] [flags]
```

**Flags:**

| Name | Type   | Required | Default | Description           |
| ---- | ------ | -------- | ------- | --------------------- |
| --to | string | Yes      |         | The new owner address |

### Transfer Token Owner

```bash
fury tx token transfer <symbol> --to=<to> --from=<key-name> --chain-id=<chain-id> --fees=<fee>
```

## fury tx token mint

Mint tokens to a specified address

```bash
fury tx token mint [symbol] [flags]
```

**Flags:**

| Name     | Type   | Required | Default | Description                                                             |
| -------- | ------ | -------- | ------- | ----------------------------------------------------------------------- |
| --to     | string |          |         | Address to which the token will be minted, default to the owner address |
| --amount | uint64 | Yes      | 0       | Amount of the tokens to be minted                                       |

### Mint Token

```bash
fury tx token mint <symbol> --amount=<amount> --to=<to> --from=<key-name> --chain-id=<chain-id> --fees=<fee>
```

## fury tx token burn

Burn some tokens

```bash
fury tx token burn [symbol] [flags]
```

**Flags:**

| Name     | Type   | Required | Default | Description                   |
| -------- | ------ | -------- | ------- | ----------------------------- |
| --amount | uint64 | Yes      | 0       | Amount of the tokens to burnt |

### Burn Token

```bash
fury tx token burn <symbol> --amount=<amount> --from=<key-name> --chain-id=<chain-id> --fees=<fee>
```

## fury query token token

Query a token by symbol

```bash
fury query token token [denom] [flags]
```

### Query a token

```bash
fury query token token <denom>
```

## fury query token tokens

Query tokens by the owner which is optional

```bash
fury query token tokens [owner] [flags]
```

### Query all tokens

```bash
fury query token tokens
```

### Query tokens with the specified owner

```bash
fury query token tokens <owner>
```

## fury query token fee

Query the token related fees, including token issuance and minting

```bash
fury query token fee [symbol] [flags]
```

### Query fees of issuing and minting a token

```bash
fury query token fee kitty
```

## fury query token params

Query token module params

```bash
fury query token params [flags]
```

### Query token module params

```bash
fury query token params
```

## fury query token total-burn

Query the total amount of all burn tokens

```bash
fury query token total-burn [flags]
```

### Query the total amount of all burn tokens

```bash
fury query token total-burn
```
