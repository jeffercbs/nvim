#!/bin/bash

export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export NVIM_HOME="$XDG_CONFIG_HOME/nvim"
export NVIM_DATA_HOME="$XDG_CONFIG_HOME/nvim-data"
export NVIM_TEMP="${XDG_CACHE_HOME:-$HOME/.cache}/nvim"

NVIM_DIRS=("$NVIM_HOME" "$NVIM_DATA_HOME" "$NVIM_TEMP")

uninstall() {
  pkill nvim

  echo -e "\e[33m!!Warning!! -> Removing all nvim related config because of the --uninstall flag\e[0m"
  read -p "Are you sure you want to continue? [y/n] " answer

  if [[ "$answer" != [yY] ]]; then
    echo -e "\e[31mAborting uninstallation\e[0m"
    exit 1
  fi

  for dir in "${NVIM_DIRS[@]}"; do
    if [[ -d "$dir" ]]; then
      echo -e "\e[32mRemoving $dir\e[0m"
      rm -rf "$dir"
    fi
  done
}

uninstall "$@"
