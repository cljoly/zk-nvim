local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values

local M = {}

M.setup = function(setup_config)
end

M.generic_picker = function(query, opts)
	opts = opts or {}
	query = query or {}

	zk_cmd = { "zk", "list", "-f", "jsonl" }
	vim.list_extend(zk_cmd, query)

	pickers.new(opts, {
		-- TODO Change this
		prompt_title = "generic_picker",
		sorter = conf.generic_sorter(opts),
		previewer = conf.file_previewer(opts),
		finder = finders.new_oneshot_job(zk_cmd, {
			entry_maker = function(entry)
				local zettel = vim.json.decode(entry)
				local display = zettel.title
				if display == "" then
					display = zettel.filename
				end
				return {
					value = zettel.absPath,
					display = display,
					ordinal = zettel.modified,
				}
			end,
			--TODO Allow user to set cwd?
		}),
	}):find()
end

return M

-- TODO
-- * picker to select a tag and then select a zettel with this tag
-- * live query
-- * use colored output and more fields from the JSON from zk

-- Example use
-- generic_picker({}, {'-m', 'zettel'}) -- Search for the word “zettel”
-- generic_picker({}, {'-mention='..vim.fn.bufnr('%')}) -- Notes mentioning the currently opened note
