#!/bin/bash

set -eux

CLOJURE_VERSION=1.10.1.763
CLOJURE_LSP_VERSION=2021.02.02-14.02.23

INSTALL_SCRIPT="linux-install-${CLOJURE_VERSION}.sh"
curl -O https://download.clojure.org/install/${INSTALL_SCRIPT}
chmod +x ${INSTALL_SCRIPT}
./${INSTALL_SCRIPT}

wget https://github.com/clojure-lsp/clojure-lsp/releases/download/${CLOJURE_LSP_VERSION}/clojure-lsp-native-linux-amd64.zip
unzip clojure-lsp-native-linux-amd64.zip
install -m 0755 ./clojure-lsp /usr/local/bin/

wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
install -m 0755 lein /usr/local/bin/
lein
