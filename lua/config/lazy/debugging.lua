return {
	{
		"mfussenegger/nvim-dap",
		dependencies = { "rcarriga/nvim-dap-ui", "nvim-neotest/nvim-nio" },
		config = function()
            -- TODO set up debuggers for specific languages
            -- Go example: https://youtu.be/oYzZxi3SSnM?si=9_cvGF6AgUiR79pi&t=530
			local dap, dapui = require("dap"), require("dapui")

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			vim.keymap.set("n", "<Leader>dc", function()
				dap.continue()
			end)
			vim.keymap.set("n", "<Leader>db", function()
				dap.toggle_breakpoint()
			end)
		end,
	},
}
