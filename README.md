# CoreKit Distribution

This repository hosts encrypted, ready-to-install distributions of CoreKit.

Copyright 2024-2026 Michele Dallachiesa. The source code is not publicly available, but it is open source: anyone who holds a copy may use, modify, and distribute it under the terms of the [Apache License, Version 2.0](LICENSE).

## Installation

Run the command below, replacing `<version:key>` with the version and
decryption key you were provided. It downloads the encrypted wheel, decrypts it
into a local `.vendor/` directory, and prints a snippet for your
`pyproject.toml`:

```sh
bash <(curl -fsSL https://raw.githubusercontent.com/elehcimd/corekit-dist/main/install.sh) <version:key>
```

When using [`uv`](https://docs.astral.sh/uv/), add the printed snippet to your
`pyproject.toml` to install CoreKit from the local wheel:

```toml
[tool.uv.sources]
corekit = { path = ".vendor/corekit-<version>-py3-none-any.whl" }
```

Then run `uv sync` to install it:

```sh
uv sync
```

Otherwise, install the wheel directly with `pip`:

```sh
pip install .vendor/corekit-<version>-py3-none-any.whl
```

## Contact

For access, versions, decryption keys, or integration support around CoreKit,
reach out at [michele.dallachiesa@sigforge.com](mailto:michele.dallachiesa@sigforge.com).

