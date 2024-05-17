# Dotfiles

Hello, it's my dotfiles and if you install it you can use it

# How to install neovim

<details>
<summary>Install With <a href="https://github.com/folke/lazy.nvim">lazyvim</a></summary>
  
```
{
  "iafshinafshin/end-line.nvim",
  event = { "BufReadPre", "BufNewFile" },
  lazy = false,
  config = function()
    require("end-line").setup()
  end,
}
```

</details>

<details>
<summary>Install With <a href="https://github.com/wbthomason/packer.nvim">packer.nvim</a></summary>

```
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use({
    'iafshinafshin/end-line.nvim',
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("end-line").setup()
    end,
  })
end)

```

</details>
<details>
<summary>Instal With <a href="https://github.com/junegunn/vim-plug">vim-plug</a></summary>

```
call plug#begin()
  Plug 'iafshinafshin/end-line.nvim'
call plug#end()
lua <<EOF
require("end-line").setup()
EOF
```

</details>

<br>
