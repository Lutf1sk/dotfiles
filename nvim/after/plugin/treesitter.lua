
require'nvim-treesitter.configs'.setup {
	ensure_installed = { "javascript", "css", "html", "cpp", "haskell", "make", "nasm", "bash", "hare", "gitcommit", "gitignore", "git_config", "git_rebase", "gitattributes", "glsl", "c_sharp", "printf", "xml", "yaml", "toml", "c", "lua", "vim", "vimdoc", "query" },

	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,

		disable = function(lang, buf)
			local max_filesize = 1024 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,

		additional_vim_regex_highlighting = false,
	},
}

