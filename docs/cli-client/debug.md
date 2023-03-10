# Debug

A tool for simple debugging.

## Available Commands

| Name                               | Description                                          |
| ---------------------------------- | ---------------------------------------------------- |
| [addr](#fury-debug-addr)           | Convert an address between hex and bech32            |
| [pubkey](#fury-debug-pubkey)       | Decode a ED25519 pubkey from hex, base64, or bech32  |
| [raw-bytes](#fury-debug-raw-bytes) | Convert raw bytes output (eg. [10 21 13 127]) to hex |

### fury debug addr

```bash
fury debug addr fury:fury:aa1rulhmls7g9cjh239vnkjnw870t5urrutsfwvmc
```

returns

```bash
Address: [31 63 125 254 30 65 113 43 170 37 100 237 41 184 254 122 233 193 143 139]
Address (hex): 1F3F7DFE1E41712BAA2564ED29B8FE7AE9C18F8B
Bech32 Acc: fury:fury:aa1rulhmls7g9cjh239vnkjnw870t5urrutsfwvmc
Bech32 Val: iva1rulhmls7g9cjh239vnkjnw870t5urrut9cyrxl
```

### fury debug pubkey

The following give the same result:

```bash
fury debug pubkey TZTQnfqOsi89SeoXVnIw+tnFJnr4X8qVC0U8AsEmFk4=
fury debug pubkey 4D94D09DFA8EB22F3D49EA17567230FAD9C5267AF85FCA950B453C02C126164E
  ```

### fury debug raw-bytes

Convert raw bytes output (eg. [10 21 13 127]) to hex

```bash
fury debug raw-bytes <raw-bytes>
fury debug raw-bytes "[10 21 13 127]"
```
