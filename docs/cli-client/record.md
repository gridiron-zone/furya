# Record

Record module allows you to manage record on FURY Hub

## Available Commands

| Name                                | Description        |
| ----------------------------------- | ------------------ |
| [create](#fury-tx-record-create)    | Create a record    |
| [record](#fury-query-record-record) | Query record by id |

## fury tx record create

Create a record

```bash
fury tx record create [digest] [digest-algo] [flags]
```

**Flags:**

| Name, shorthand | Type   | Required | Default | Description                                |
| --------------- | ------ | -------- | ------- | ------------------------------------------ |
| --uri           | string |          |         | Source uri of record, such as an ipfs link |
| --meta          | string |          |         | meta data of record                        |

## fury query record record

Query record by id

```bash
fury query record record [record-id]
```
