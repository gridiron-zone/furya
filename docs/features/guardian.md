# Guardian

## Summary

GRIDhub introduce two types of privileged system user controlled by foundations, the profiler and the trustee.

* Profiler privileges
    1. Submit software upgrade/halt proposal by governance.
    2. Invocate a service by `profiling` mode, under which service fees can be exempted.

* Trustee privileges
    1. To be the destination address if the usage type of a `CommunityTaxUsage` proposal is `Distribute` or `grant`.
    2. Send `withdraw-tax` transaction to withdraw coins to an account from system service fee tax pool.

* Genesis Profiler/Genesis Trustee (Defined in genesis.json)
    1. Only Genesis Profiler can add/delete Ordinary Profiler account
    2. Only Genesis Trustee can add/delete Ordinary Trustee account

## Usage Scenario

1. Add Profiler and Trustee

    Add Profiler (Genesis Profiler account only)

    ```bash
    fury tx guardian add-profiler --address=<profiler-address> --description=<profiler-description> --chain-id=fury --from=<key-name> --fees=0.3grid
    ```

    Add Trustee (Genesis Trustee account only)

    ```bash
    fury tx guardian add-trustee --address=<trustee-address> --description=<trustee-description> --chain-id=fury --from=<key-name> --fees=0.3grid
    ```

2. Query Profiler and Trustee list

    Query Profiler list

    ```bash
    fury q guardian profilers
    ```

    Query Trustee list

    ```bash
    fury q guardian trustees
    ```

3. Profiler submit software upgrade/halt proposal

    Details in [upgrade](upgrade.md)

4. Profiler call a service by `profiling` mode

    Service fee exempted

    ```bash
    fury tx service call --def-chain-id=<def-chain-id> --service-name=<service-name> --method-id=<method-id> --bind-chain-id=<bind-chain-id> --provider=<provider-address> --service-fee=1grid --request-data=<request-data> --chain-id=fury --from=<key-name> --fees=0.3grid --profiling=true
    ```

5. Trustee to be the destination address of `CommunityTaxUsage` proposal

    Details in [governance](governance.md#proposals-on-community-funds-usage)

6. Delete Profiler and Trustee (Genesis Trustee account only)

    Delete Profiler (Genesis Trustee account only)

    ```bash
    fury tx guardian delete-profiler --chain-id=fury --from=<key-name> --fees=0.3grid --address=<profiler-address>
    ```

    Delete Trustee (Genesis Trustee account only)

    ```bash
    fury tx guardian delete-trustee --chain-id=fury --from=<key-name> --fees=0.3grid --address=<trustee-address>
    ```
