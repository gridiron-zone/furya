# NFT

`NFT` provides the ability to digitize assets. Through this module, each off-chain asset will be modeled as a unique on-chain nft.

## Available Commands

| Name                                          | Description                                                                                         |
| --------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| [issue](#fury-tx-nft-issue)                   | Specify the nft Denom (nft classification) and metadata JSON Schema to issue nft.                   |
| [transfer-denom](#fury-tx-nft-transfer-denom) | The owner of the NFT classification can transfer the ownership of the NFT classification to others. |
| [mint](#fury-tx-nft-mint)                     | Additional issuance (create) of specific nft of this type can be made.                              |
| [edit](#fury-tx-nft-edit)                     | The metadata of the specified nft can be updated.                                                   |
| [transfer](#fury-tx-nft-transfer)             | Transfer designated nft.                                                                            |
| [burn](#fury-tx-nft-burn)                     | Destroy the created nft.                                                                            |
| [supply](#fury-query-nft-supply)              | Query the total amount of nft according to Denom; accept the optional owner parameter.              |
| [owner](#fury-query-nft-owner)                | Query all nft owned by an account; you can specify the Denom parameter.                             |
| [collection](#fury-query-nft-collection)      | Query all nft according to Denom.                                                                   |
| [denom](#fury-query-nft-denom)                | Query nft denom information based on Denom.                                                         |
| [denoms](#fury-query-nft-denoms)              | Query the total amount of nft according to Denom; accept the optional owner parameter.              |
| [token](#fury-query-nft-token)                | Query specific nft based on Denom and ID.                                                           |

## fury tx nft issue

Specify the nft Denom (nft classification) and metadata JSON Schema to issue nft.

```bash
fury tx nft issue [denom-id] [flags]
```

**Flags:**

| Name, shorthand     | Required | Default                                                                                                                                                                                                                     | Description |
| ------------------- | -------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| --name              |          | The name of the denom                                                                                                                                                                                                       |             |
| --uri               |          | The uri of the denom                                                                                                                                                                                                        |             |
| --data              |          | Off-chain metadata for supplementation (JSON object)                                                                                                                                                                        |             |
| --schema            |          | Denom data structure definition                                                                                                                                                                                             |             |
| --symbol            |          | The symbol of the denom                                                                                                                                                                                                     |             |
| --mint-restricted   |          | This field indicates whether there are restrictions on the issuance of NFTs under this classification, true means that only Denom owners can issue NFTs under this classification, false means anyone can                   |             |
| --update-restricted |          | This field indicates whether there are restrictions on updating NFTs under this classification, true means that no one under this classification can update the NFT, false means that only the owner of this NFT can update |             |

## fury tx nft transfer-denom

The owner of the NFT classification can transfer the ownership of the NFT classification to others.

```bash
fury tx nft transfer-denom [recipient] [denom-id]
```

## fury tx nft mint

Additional issuance (create) of specific nft of this type can be made.  

```bash
fury tx nft mint [denomID] [tokenID] [flags]
```

**Flags:**

| Name, shorthand | Required | Default                     | Description |
| --------------- | -------- | --------------------------- | ----------- |
| --uri           |          | URI of off-chain token data |             |
| --recipient     |          | Receiver of the nft         |             |
| --name          |          | The name of nft             |             |

## fury tx nft edit

The metadata of the specified nft can be updated.

```bash
fury tx nft edit [denomID] [tokenID] [flags]
```

**Flags:**

| Name, shorthand | Required | Default                     | Description |
| --------------- | -------- | --------------------------- | ----------- |
| --uri           |          | URI of off-chain token data |             |
| --name          |          | The name of nft             |             |

## fury tx nft transfer

Transfer designated nft.

```bash
fury tx nft transfer [recipient] [denomID] [tokenID] [flags]
```

**Flags:**

| Name, shorthand | Required | Default                     | Description |
| --------------- | -------- | --------------------------- | ----------- |
| --uri           |          | URI of off-chain token data |             |
| --name          |          | The name of nft             |             |

## fury tx nft burn

Destroy the created nft.

```bash
fury tx nft burn [denomID] [tokenID] [flags]
```

## fury query nft

Query nft

### fury query nft supply

```bash
fury query nft supply [denomID]
fury query nft supply [denomID] --owner=<owner address>
```

### fury query nft owner

```bash
fury query nft owner [owner address]
fury query nft owner [owner address] --denom=<denomID>
```

### fury query nft collection

```bash
fury query nft collection [denomID]
```

### fury query nft denom

```bash
fury query nft denom [denomID]
```

### fury query nft denoms

```bash
fury query nft denoms
```

### fury query nft token

```bash
fury query nft token [denomID] [tokenID]
```
