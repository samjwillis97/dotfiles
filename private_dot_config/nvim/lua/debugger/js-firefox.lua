local dap = require("dap")
dap.adapters.firefox = {
	type = "executable",
	command = "firefox-debug-adapter",
	-- args = { os.getenv("HOME") .. "/path/to/vscode-firefox-debug/dist/adapter.bundle.js" },
}

dap.configurations.typescript = {
	name = "Debug with Firefox",
	type = "firefox",
	request = "launch",
	reAttach = true,
	url = "http://localhost:4200",
	webRoot = "${workspaceFolder}",
	firefoxExecutable = "/usr/bin/firefox",
}
