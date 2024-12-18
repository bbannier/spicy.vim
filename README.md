Syntax highlightning for Spicy
==============================

This repository contains Vim syntax highlighting for
[Spicy](https://docs.zeek.org/projects/spicy/en/latest/).

Formatting
----------

This plugin provides integration for automatic source formatting with
[ALE](https://github.com/dense-analysis/ale) and
[spicy-format](https://github.com/bbannier/spicy-format) if they are available.
Call `:ALEFix` to format the current buffer.

To enable formatting on save add the following setting to `~/.vimrc`:

```vim
let g:ale_fix_on_save = 1
```

Note that this enables fixing and formatting for any filetypes ALE understands,
not just `.spicy`. Put it into `~/.vim/ftplugin/spicy.vim` if that is unwanted.

A different path to the `spicy-format` binary can be configured in `~/.vimrc`
like e.g.,

```vim
let g:ale_spicy_format_executable = '/PATH/TO/spicy-format'
```
