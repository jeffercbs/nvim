#!/bin/bash
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

Branch=${Branch:-"main"}
Remote=${Remote:-"jeffercbs/nvim"}
NVIM_HOME="$XDG_CONFIG_HOME/nvim"

function CheckSytem {
  git --version > /dev/null 2>&1

  if [ $? -ne 0 ]; then
    echo -e "\033[0;31mGit is not installed\033[0m"
    exit 1
  fi
}

function Install {
  CheckSytem

  cmd=$(git clone "https://github.com/$Remote" --branch "$Branch" --depth 1 "$NVIM_HOME")
  cmd="$cmd && nvim"
  sh -c "$cmd" || {
    echo -e "\033[0;31mError: $?\033[0m"
    exit 1
  }

  rm -rf "$XDG_DATA_HOME/nvim-data"
}

Install $args
