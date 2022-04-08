local autosave = require("autosave")

autosave.hook_after_saving = function ()
	local file = '%F'
	if file:sub(-4) == ".elm" then
		vim.lsp.buf.formatting()
	end
end

autosave.setup()
