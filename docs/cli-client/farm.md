# Farm

Farm module allows you to easily create farm activities on fury.

## Available Commands

| Name                              | Description                                           |
| --------------------------------- | ----------------------------------------------------- |
| [create](#fury-tx-farm-create)    | Create a new farm pool                                |
| [adjust](#fury-tx-farm-adjust)    | Adjust farm pool parameters                           |
| [destroy](#fury-tx-farm-destroy)  | Destroy the farm pool and get back the invested bonus |
| [stake](#fury-tx-farm-stake)      | Deposit liquidity token                               |
| [harvest](#fury-tx-farm-harvest)  | Get back the bonus for participating in the farm pool |
| [farmer](#fury-query-farm-farmer) | Query farmer information                              |
| [pool](#fury-query-farm-pool)     | Query the current status of a farm pool               |
| [pools](#fury-query-farm-pools)   | Query farm pool information by page                   |
| [params](#fury-query-farm-params) | Query the management parameters of the farm module    |

## fury tx farm create

Create a new farm pool and pay the handling fee and bonus.

```bash
fury tx farm create <Farm Pool Name> [flags]
```

**Flags:**

| Name, shorthand    | Required | Default | Description                                              |
| ------------------ | -------- | ------- | -------------------------------------------------------- |
| --lp-token-denom   | true     |         | The liquidity token accepted by farm pool                |
| --reward-per-block | true     |         | The reward per block,ex: 1grid,1atom                     |
| --total-reward     | true     |         | The Total reward for the farm pool                       |
| --description      | false    | ""      | The simple description of a farm pool                    |
| --start-height     | true     |         | The start height the farm pool                           |
| --editable         | false    | false   | Is it possible to adjust the parameters of the farm pool |

### fury tx farm adjust

Adjust the parameters of the pool before the farm pool ends, such as `reward-per-block`, `total-reward`.

```bash
fury tx farm adjust <Farm Pool Name> [flags]
```

**Flags:**

| Name, shorthand     | Required                                  | Default | Description                          |
| ------------------- | ----------------------------------------- | ------- | ------------------------------------ |
| --additional-reward | And `--reward-per-block` must choose one  | ""      | Bonuses added to the farm pool       |
| --reward-per-block  | And `--additional-reward` must choose one | ""      | The reward per block,ex: 1grid,1atom |

## fury tx farm destroy

Destroy the farm pool and get back the invested bonus.The rewards earned by the user farm ends at this moment, requiring the user to manually retrieve the income and the liquidity of the deposit.

```bash
fury tx farm destroy <Farm Pool Name> [flags]
```

### fury tx farm stake

The farmer participates in farm activities by staking the liquidity tokens specified by the pool. The rewards obtained by participating in the activities are related to the number of staking tokens and farm pool parameters.

```bash
fury tx farm stake <Farm Pool Name> <lp token> [flags]
```

### fury tx farm harvest

The farmer withdraws his rewards back.

```bash
fury tx farm harvest <Farm Pool Name>
```

### fury query farm farmer

Query farmer's information, including unclaimed rewards, mortgage liquidity, etc.

```bash
fury query farm farmer <Farmer Address> --pool-name <Farm Pool Name>
```

**Flags:**

| Name, shorthand | Required | Default | Description        |
| --------------- | -------- | ------- | ------------------ |
| --pool-name     | false    | ""      | the farm pool name |

### fury query farm pool

Query related information of a farm pool by name

```bash
fury query farm pool <Farm Pool Name>
```

### fury query farm pools

Paging query farm pool

```bash
fury query farm pools
```

### fury query farm params

Paging query farm pool

```bash
fury query farm params
```
