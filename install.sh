#!/usr/bin/env bash
# Download and decrypt a CoreKit wheel from the dist repository into vendor/.

# Fail fast on errors, unset variables, and broken pipes.
set -euo pipefail

# Split the single "<version>:<key>" argument into its parts. The trailing `_`
# discards anything after a second colon so an unexpected extra field is ignored.
IFS=':' read -r VERSION KEY _ <<<"${1:-}"

# Both fields are mandatory; bail out with usage if either is missing.
if [[ -z "${VERSION}" || -z "${KEY}" ]]; then
    echo "Usage: install-corekit.sh <version:key>" >&2
    exit 1
fi

# Derive the wheel name, its encrypted counterpart, and the remote download URL.
WHL="corekit-${VERSION}-py3-none-any.whl"
ENC="${WHL}.enc"
URL="https://raw.githubusercontent.com/elehcimd/corekit-dist/main/dist/${ENC}"

# Directory to store the decrypted wheel.
VENDOR_DIR=".vendor"

# Destination for the decrypted wheel, consumed by the project as a path source.
mkdir -p "${VENDOR_DIR}"

# Fetch the encrypted wheel into the current directory.
curl -fsSL -O "${URL}"

# Decrypt it (AES-256-CBC, PBKDF2) using the key from the argument into vendor/.
openssl enc -d -aes-256-cbc -pbkdf2 -iter 600000 \
    -in "${ENC}" -out "${VENDOR_DIR}/${WHL}" -pass "pass:${KEY}"

# Drop the encrypted artifact now that the plaintext wheel is in place.
rm -f "${ENC}"

echo "Fetched CoreKit ${VERSION} into ${VENDOR_DIR}/${WHL}"
echo "To install it, add the following to your pyproject.toml:"
echo ""
echo "[tool.uv.sources]"
echo "corekit = { path = \"${VENDOR_DIR}/${WHL}\" }"
echo ""
