#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

function download() {
  local repo=$repo
  local branch=${branch:-main}
  local remote_path=$remote_path
  local local_path=${local_path:-$remote_path}
  mkdir --parents "$(dirname -- "$local_path")"
  wget --output-document="$local_path" "https://raw.githubusercontent.com/$repo/refs/heads/$branch/$remote_path"
}

repo="liblaf/copier-python" remote_path="template/.github/linters/.ruff.toml" local_path=".github/linters/.ruff.toml" download
repo="liblaf/copier-python" remote_path="template/.github/linters/pyrightconfig.json" local_path=".github/linters/pyrightconfig.json" download
