# zk-nvim
Neovim extension for zk

Optionally add this to your `init.lua`:
```lua
require'telescope'.load_extension('zk')
```
start with
```lua
:Telescope zk generic_sorter
```
or
```lua
:lua require'telescope'.extensions.zk.generic_picker({"-m", "zettel"})
:lua require'telescope'.extensions.zk.generic_picker({"-t", "mytag"})
```
