# CoreKit Distribution

This repository hosts encrypted, ready-to-install distributions of CoreKit.

CoreKit is authored by Michele Dallachiesa <<michele.dallachiesa@sigforge.com>> and it is open source ([Apache 2.0](LICENSE)); the source is not publicly distributed, but anyone who receives a copy may use, modify, and redistribute it.

## Installation

Run the command below, replacing `<version:key>` with the version and
decryption key you were provided. It downloads the encrypted wheel, decrypts it
into a local `.vendor/` directory, and prints a snippet for your
`pyproject.toml`:

```sh
bash <(curl -fsSL https://raw.githubusercontent.com/elehcimd/corekit-dist/main/install.sh) <version:key>
```

## Contact

For access, versions, decryption keys, or integration support around CoreKit,
reach out at [michele.dallachiesa@sigforge.com](mailto:michele.dallachiesa@sigforge.com).

