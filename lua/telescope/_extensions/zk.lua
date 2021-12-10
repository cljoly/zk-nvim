local has_telescope, telescope = pcall(require, 'telescope')
local main = require('telescope._extensions.zk.main')

if not has_telescope then
  error('This plugins requires https://github.com/nvim-telescope/telescope.nvim')
end

return telescope.register_extension{
  setup = main.setup,
  exports = { generic_picker = main.generic_picker }
}
