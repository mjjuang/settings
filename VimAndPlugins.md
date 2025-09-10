# Vim and Plugins

```bash
~/.vimrc        # Main config file, loaded at startup
~/.vim/
├── autoload/      # Scripts loaded on demand with `:call`
├── colors/        # Color scheme files (*.vim), used by `:colorscheme`
├── compiler/      # Compiler settings for `:compiler` command
├── doc/           # Help documentation for plugins (:help myplugin)
├── ftdetect/      # File type detection scripts
│   └── python.vim # Syntax overrides for python
├── ftplugin/      # Filetype-specific settings (e.g. python.vim, html.vim)
│   └── python.vim # Syntax overrides for python
├── indent/        # Indentation rules per filetype
├── keymap/        # Alternative keymaps for languages (rarely used)
├── plugin/        # General plugins loaded at startup
├── syntax/        # Syntax highlighting rules
├── after/         # Overrides for above dirs (autoloaded last)
│   ├── ftplugin/  # Filetype-specific overrides
│   └── syntax/    # Syntax overrides
└── pack/          # Newer package system (Vim 8+)
    └── <name>/
        └── start/ # Auto-loaded plugins
        └── opt/   # Optional plugins (load via :packadd)
```

- `pack`: Newer package system (since Vim 8), natively supported by vim.

## vim-fugitive

Fugitive is the premier Vim plugin for Git.

```bash
mkdir -p ~/.vim/pack/plugins/start
cd ~/.vim/pack/plugins/start
git clone https://tpope.io/vim/fugitive.git

:helptags ~/.vim/pack/plugins/start/fugitive/doc
```

## vim-airline

A nice statusline at the bottom of each vim window.

```bash
cd ~/.vim/pack/plugins/start
git clone https://github.com/vim-airline/vim-airline

:helptags ~/.vim/pack/plugins/start/vim-airline/doc
```

## vim-go

- Prerequisites: install Golang

```bash
cd ~/.vim/pack/plugins/start
git clone https://github.com/fatih/vim-go.git

:helptags ~/.vim/pack/plugins/start/vim-go/doc
:helptags ALL
```

## The `vim-plug` (optional)

The third-party vim plugin manager.

- Install the vim-plug:

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs [https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim](https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim)
```

Install the the plugin, ex: `vim-airline` 

- Add vim-airline to the .vimrc:

```bash
call plug#begin()
Plug 'vim-airline/vim-airline'
call plug#end()
```

- Have `vim-plug` to install the listed plugins with `:PlugInstall`