<div align="center">

# **NeoVim Configuration**

<p>
    <a href="https://github.com/jeffercbs/nvim/pulse">
      <img alt="Last commit" src="https://img.shields.io/github/last-commit/jeffercbs/nvim?style=for-the-badge&logo=starship&color=8bd5ca&logoColor=D9E0EE&labelColor=302D41"/>
    </a>
    <a href="https://github.com/jeffercbs/nvim/blob/main/LICENSE">
      <img alt="License" src="https://img.shields.io/github/license/jeffercbs/nvim?style=for-the-badge&logo=starship&color=ee999f&logoColor=D9E0EE&labelColor=302D41" />
    </a>
    <a href="https://github.com/jeffercbs/nvim/stargazers">
      <img alt="Stars" src="https://img.shields.io/github/stars/jeffercbs/nvim?style=for-the-badge&logo=starship&color=c69ff5&logoColor=D9E0EE&labelColor=302D41" />
    </a>
    <a href="https://github.com/jeffercbs/nvim/issues">
      <img alt="Issues" src="https://img.shields.io/github/issues/jeffercbs/nvim?style=for-the-badge&logo=bilibili&color=F5E0DC&logoColor=D9E0EE&labelColor=302D41" />
    </a>
    <a href="https://github.com/jeffercbs/nvim">
      <img alt="Repo Size" src="https://img.shields.io/github/repo-size/jeffercbs/nvim?color=%23DDB6F2&label=SIZE&logo=codesandbox&style=for-the-badge&logoColor=D9E0EE&labelColor=302D41" />
    </a>
  </p>
</div>
<div align="center">
  <img src="./.github/screenshot.png" width="400"/>
</div>

---

## ⚡️ **Requirements**

- Neovim >= **0.8.0** (needs to be built with **LuaJIT**)
- Git >= **2.19.0** (for partial clones support)
- a [Nerd Font](https://www.nerdfonts.com/) **_(optional)_**

## 🚀 **Getting Started**

### windows

```shell
Invoke-WebRequest https://raw.githubusercontent.com/jeffercbs/nvim/main/scripts/win/install.ps1  -UseBasicParsing | Invoke-Expression
```

### linux

```shell
git clone https://github.com/jeffercbs/nvim.git ~/.config/nvim --depth 1 && nvim
```

## Uninstall

```shell
  # linux/macos (unix)
  rm -rf ~/.config/nvim
  rm -rf ~/.local/share/nvim
  rm -rf ~/.cache/nvim

  # windows
  Invoke-WebRequest https://raw.githubusercontent.com/jeffercbs/nvim/main/scripts/wins/uninstall.ps1 -UseBasicParsing | Invoke-Expression
```
