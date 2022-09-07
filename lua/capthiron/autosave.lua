local autosave = require("auto-save")

autosave.hook_after_saving = function ()
	--[[ if vim.bo.filetype == "elm" then
		vim.lsp.buf.formatting()
	end ]]
end

autosave.setup({
	write_all_buffers = true
})
