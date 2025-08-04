# _hyperscript ⋅ Vim / Neovim syntax files

Adds full syntax highlighting, JS‑region embedding, and basic filetype
detection for [_hyperscript](https://hyperscript.org).

## Installation

<details>
<summary>Using native <code>pack/*/start</code> (Vim 8 / Neovim)</summary>

```sh
git clone https://github.com/AnswerDotAI/hyperscript-vim \
  ~/.config/nvim/pack/plugins/start/hyperscript-vim   # or ~/.vim/pack/…
````

Restart Vim (or run `:helptags ALL`).

</details>

<details>
<summary>With plugin managers</summary>

* **vim‑plug**

  ```vim
  Plug 'AnswerDotAI/hyperscript-vim'
  ```

* **lazy.nvim**

  ```lua
  { 'AnswerDotAI/hyperscript-vim', ft = '_hyperscript' }
  ```

* **packer**

  ```lua
  use { 'AnswerDotAI/hyperscript-vim', ft = '_hyperscript' }
  ```

</details>

### File detection

Files ending in `.hyperscript` or `.hyper` are recognized automatically.
If you embed `_hyperscript` within `<script type="text/hyperscript">`
tags in HTML, consider *vim‑html*’s heredoc rules or using Treesitter
instead.

## License

MIT
