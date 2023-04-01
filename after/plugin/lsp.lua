local lsp = require("lsp-zero")

lsp.preset("recommended")
lsp.ensure_installed({
	"tsserver", 
	"eslint", 
	"rust_analyzer",
})

local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()

local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<Tab>"] = cmp.mapping(function(fallback)
      -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
    if cmp.visible() then
        local entry = cmp.get_selected_entry()
    if not entry then
      cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
    else
      cmp.confirm()
    end
      else
        fallback()
      end
    end, {"i","s","c",}),
})

cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.setup()
