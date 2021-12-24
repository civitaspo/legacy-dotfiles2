#!/bin/bash

set -euo pipefail

MITAMAE_VERSION="1.12.7"
MITAMAE_CACHE="mitamae-${MITAMAE_VERSION}"
MITAMAE_ARCH="$(uname -m)"
if [ "${MITAMAE_ARCH}" = "arm64" ]; then
    MITAMAE_ARCH="aarch64"
fi
MITAMAE_KERNEL_LC="$(uname | tr '[:upper:]' '[:lower:]')"
MITAMAE_BIN="mitamae-${MITAMAE_ARCH}-${MITAMAE_KERNEL_LC}"
MITAMAE_REPO_URL="https://github.com/itamae-kitchen/mitamae"
MITAMAE_BIN_URL="${MITAMAE_REPO_URL}/releases/download/v${MITAMAE_VERSION}/${MITAMAE_BIN}.tar.gz"

MITAMAE_ROOT_DIR=$(cd $(dirname $0); pwd)
MITAMAE_BIN_DIR="${MITAMAE_ROOT_DIR}/bin"

__setup() {
    mkdir -p ${MITAMAE_BIN_DIR}
    if [ -f "${MITAMAE_BIN_DIR}/${MITAMAE_CACHE}" ]; then
        echo " INFO : '${MITAMAE_BIN_DIR}/${MITAMAE_CACHE}' already exists. Skip to download the binary."
        echo " INFO : Link: '${MITAMAE_CACHE}' -> '${MITAMAE_BIN_DIR}/mitamae'"
        ln -sf "${MITAMAE_CACHE}" "${MITAMAE_BIN_DIR}/mitamae"
        return 0
    fi
    echo " INFO : Download the binary from: ${MITAMAE_BIN_URL}"
    curl -o "${MITAMAE_BIN_DIR}/${MITAMAE_BIN}.tar.gz" -fsL "${MITAMAE_BIN_URL}"
    echo " INFO : Extract: ${MITAMAE_BIN_DIR}/${MITAMAE_BIN}.tar.gz"
    tar xvzf "${MITAMAE_BIN_DIR}/${MITAMAE_BIN}.tar.gz"
    echo " INFO : Delete: ${MITAMAE_BIN_DIR}/${MITAMAE_BIN}.tar.gz"
    rm "${MITAMAE_BIN_DIR}/${MITAMAE_BIN}.tar.gz"
    echo " INFO : Move and rename: '${MITAMAE_BIN}' -> '${MITAMAE_BIN_DIR}/${MITAMAE_CACHE}'"
    mv "${MITAMAE_BIN}" "${MITAMAE_BIN_DIR}/${MITAMAE_CACHE}"
    chmod +x "${MITAMAE_BIN_DIR}/${MITAMAE_CACHE}"
    echo " INFO : Link: '${MITAMAE_CACHE}' -> '${MITAMAE_BIN_DIR}/mitamae'"
    ln -sf "${MITAMAE_CACHE}" "${MITAMAE_BIN_DIR}/mitamae"
}

__main() {
    case "${MITAMAE_KERNEL_LC}" in
        "darwin")
            echo ' INFO : Please input sudo password to avoid being asked for a password during provisioning.'
            sudo -v && sudo -l mkdir &>/dev/null
            bin/mitamae local lib/recipe.rb "$@"
            ;;
        *)
            sudo -E bin/mitamae local lib/recipe.rb "$@"
            ;;
    esac
}

__setup
__main "$@"
