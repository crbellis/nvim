local lsp = require("lsp-zero")

lsp.preset("recommended")
lsp.ensure_installed({
	"tsserver", 
	"eslint", 
	"rust_analyzer",
})

local cmp = require("cmp")

lsp.setup()
