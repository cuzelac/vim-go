## 1.6 (unreleased)

FEATURES:

* New `CHANGELOG.md` file (which you're reading now). This will make it easier
  for me to track changes and release versions
* **`:GoCoverage`**: is now highlighting the current source file for
  covered/uncovered lines. If called again it clears the highlighting. This is
  a pretty good addition to vim-go and I suggest to check out the gif that shows
  it in action: https://twitter.com/fatih/status/716722650383564800 [gh-786]
* **`:GoCoverageBrowser`**: opens a new annotated HTML page. This is the old
  `:GoCoverage` behavior [gh-786]
* **`guru support`**: we don't use `oracle` anymore. `oracle` is renamed to
  `guru` with some internal and public facing changes. vim-go is now fully
  compatible with `guru`.
* **`guru support`**: `oracle` is replaced by the new tool `guru`. `oracle.vim`
  is therefore renamed to `guru.vim`. I've also refactored the code to make it
  much more easier to maintain and add additional features in future (such as
  upcoming JSON decoding). vim-go is now fully compatible with `guru`. Please
  be sure you have installed `guru`. You can easily do it with
  `:GoInstallBinaries`.
* **`:GoDef`** uses now `guru definition` under the hood instead of `godef`.
  This fixes the following issues: 1. dot imports 2. vendor imports 3. folder
  != package name imports. The tool `godef` is also deprecated and not used
  anymore.

BUG FIXES:

* Syntax: fix gotexttmpl identifier highlighting [gh-778]

IMPROVEMENTS:

* **`:GoCoverage`** is now executed async when used within Neovim [gh-686]

BUG FIXES:

* Term mode: fix closing location list if result is successful after a failed attempt [gh-768]
* Syntax: fix gotexttmpl identifier highlighting [gh-778]

BACKWARDS INCOMPATIBILITIES:

* `:GoDef` doesn't accept any identifier as an argument. This is not suported
  via `guru definition` and also was not widely used either. Also with this, we
  significantly simplified the existing def.vim code
* `:GoOracleScope`  and `:GoOracleTags` are deprecated in favor of
  `:GoGuruScope` and `:GoGuruTags`. Also `g:go_oracle_scope` is renamed to
  `g:go_guru_scope`
* `g:go_guru_scope` accepts a variable in type of `list` instead of `string`.
  i.g: `let g:go_guru_scope = ["github.com/fatih/structs", "golang.org/x/tools/..."]`

