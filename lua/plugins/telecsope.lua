return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-telescope/telescope-live-grep-args.nvim",
		--"nvim-telescope/telescope-fzf-native.nvim",
	},
	keys = {
		{
			"<leader>fb",
			function()
				require("telescope").extensions.file_browser.file_browser({
					cwd = vim.fn.getcwd(),
					theme = "ivy",
				})
			end,
			desc = "Find Plugin File",
		},
	},
	config = function(_, opts)
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local sorters = require("telescope.sorters")
		local fb_actions = require("telescope").extensions.file_browser.actions

		opts.defaults = {
			sorting_strategy = "ascending",
			initial_mode = "normal",
			mappings = {
				n = {
					["q"] = actions.close,
				},
			},
			file_sorter = sorters.get_fzy_sorter,
			generic_sorter = sorters.get_generic_fuzzy_sorter,
		}

		opts.pickers = {
			diagnostics = {
				theme = "ivy",
				initial_mode = "normal",
				layout_config = {
					preview_cutoff = 9999,
				},
			},
		}

		opts.extensions = {
			file_browser = {
				theme = "ivy",
				hijack_netrw = true,
				grouped = true,
				sort_lastused = false,
				sort_mru = false,
				respect_gitignore = true,
				path_display = { "absolute" },
				layout_strategy = "horizontal",
				layout_config = {
					preview_width = 0.5,
				},
				sorting_strategy = "ascending",
				mappings = {
					i = {
						["<C-w>"] = function()
							vim.cmd("normal vbd")
						end,
					},
					n = {
						["<C-c>"] = fb_actions.create,
						["<C-d>"] = fb_actions.remove,
						["<C-r>"] = fb_actions.rename,
						["<C-y>"] = fb_actions.copy,
						["PageUp"] = actions.preview_scrolling_up,
						["PageDown"] = actions.preview_scrolling_down,
					},
				},
			},
			["ui-select"] = {
				require("telescope.themes").get_dropdown({}),
			},
		}

		telescope.setup(opts)
		require("telescope").load_extension("file_browser")
		--require("telescope").load_extension("fzf")
		require("telescope").load_extension("ui-select")
		require("telescope").load_extension("live_grep_args")
	end,
}
