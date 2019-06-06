#!/usr/bin/env bash

# TODO remove this once got accepted by upstream
git.remove_include() {
  git config --global --unset-all include.path "$1"
}

pkg.install() {
  git.add_include "${PKG_PATH}/config"
}

# Do not link config. It is imported by setting include.path.
pkg.link() {
  :
}

pkg.uninstall() {
  git.remove_include "${PKG_PATH}/config"
}
