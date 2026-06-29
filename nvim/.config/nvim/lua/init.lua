local function load_dir(dir_name)
	local path = vim.fn.stdpath("config") .. "/lua/" .. dir_name
	local files = vim.fn.split(vim.fn.glob(path .. "/*.lua"), "\n")
	for _, file in ipairs(files) do
		if file ~= "" then
			local module_name = vim.fn.fnamemodify(file, ":t:r")
			local ok, err = pcall(require, dir_name .. "." .. module_name)
			if not ok then
				vim.notify("Error loading " .. dir_name .. "/" .. module_name .. "\n" .. err, vim.log.levels.ERROR)
			end
		end
	end
end

load_dir("core")
load_dir("plugins")
