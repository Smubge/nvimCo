local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local nvim_status_ok, nvim_lsp = pcall(require, "lspconfig")
if not nvim_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

--   פּ ﯟ   some other good icons
local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm { select = true },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
       luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
          cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        nvim_lua = "[NVIM_LUA]",
        luasnip = "[Snippet]",
        buffer = "[Buffer]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  window = {
    documentation = cmp.config.window.bordered(),
  },
  experimental = {
    ghost_text = false,
    native_menu = false,
  },
}
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = {"rust_analyzer", "clangd", "jsonls","svelte", "jdtls", "pyright", "kotlin_language_server", "tsserver", "html", "astro"}


for _, server in pairs(servers) do
  require("lspconfig")[server].setup {capabilities = capabilities}
end



local root_files = { "*.project.json", "sourcemap.json"}
if not table.unpack then
  table.unpack = unpack
end




local isLuauUsed = true;
local luau_def_location = "/home/smubge/luau-lsp/globalTypes.d.lua"
local luau_docs_location = "/home/smubge/luau-lsp/api-docs.json"
--[[ local pid = vim.fn.getpid() ]]
--[[]]
local omnisharp_location = "/home/smubge/.local/share/nvim/mason/bin/omnisharp"
local omnisharp_mono_location = '/home/smubge/.local/share/nvim/mason/bin/omnisharp-mono'

require("lspconfig")["omnisharp"].setup {
  cmd = {
    omnisharp_location
  },
  use_modern_net = false,
}

require("lspconfig")["luau_lsp"].setup {
  root_dir = nvim_lsp.util.root_pattern(table.unpack(root_files)),
  cmd = {
    "luau-lsp", "lsp", "--definitions=" .. luau_def_location, "--docs=" .. luau_docs_location},
  capabilities = capabilities,
  filetypes = { "lua", "luau" },
  sourcemap = {rojoPath = "/home/smubge/.aftman/rojo"},
  --[[ on_init = function(client, _) ]]
  --[[   client.notify("workspace/didChangeConfiguration") ]]
  --[[ end, ]]
  on_attach = function(client, bufnr)
    client.server_capabilities.document_formatting = false
    isLuauUsed = false;
  end,
}

require("lspconfig")["lua_ls"].setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    if isLuauUsed == false then
      vim.cmd("LspStop".. client.id)
    end
  end,
}


local pid = vim.fn.getpid()

-- First Example unity 
local myCapabilities = vim.tbl_deep_extend(
    "force",
    require('cmp_nvim_lsp').default_capabilities(),
    {
        workspace = {
            didChangeWatchedFiles = {
                dynamicRegistration = true,
            },
        },
    }
)
-- omnisharp ryan.issac.g https://ryanisaacg.com/code/nvim-and-unity/
 --[[ require("lspconfig")["omnisharp"].setup { ]]
 --[[     cmd = { ]]
 --[[         "mono", ]]
 --[[         omnisharp_location, ]]
 --[[     capabilities = myCapabilities, ]]
 --[[         "--languageserver", ]]
 --[[         "--hostPID", ]]
 --[[         tostring(pid), ]]
 --[[     }, ]]
 --[[]]
 --[[     -- Enables support for reading code style, naming convention and analyzer ]]
 --[[     -- settings from .editorconfig. ]]
 --[[     enable_editorconfig_support = true, ]]
 --[[]]
 --[[     -- If true, MSBuild project system will only load projects for files that ]]
 --[[     -- were opened in the editor. This setting is useful for big C# codebases ]]
 --[[     -- and allows for faster initialization of code navigation features only ]]
 --[[     -- for projects that are relevant to code that is being edited. With this ]]
 --[[     -- setting enabled OmniSharp may load fewer projects and may thus display ]]
 --[[     -- incomplete reference lists for symbols. ]]
 --[[     enable_ms_build_load_projects_on_demand = false, ]]
 --[[]]
 --[[     -- Enables support for roslyn analyzers, code fixes and rulesets. ]]
 --[[     enable_roslyn_analyzers = false, ]]
 --[[]]
 --[[     -- Specifies whether 'using' directives should be grouped and sorted during ]]
 --[[     -- document formatting. ]]
 --[[     organize_imports_on_format = false, ]]
 --[[]]
 --[[     -- Enables support for showing unimported types and unimported extension ]]
 --[[     -- methods in completion lists. When committed, the appropriate using ]]
 --[[     -- directive will be added at the top of the current file. This option can ]]
 --[[     -- have a negative impact on initial completion responsiveness, ]]
 --[[     -- particularly for the first few completion sessions after opening a ]]
 --[[     -- solution. ]]
 --[[     enable_import_completion = false, ]]
 --[[]]
 --[[     -- Specifies whether to include preview versions of the .NET SDK when ]]
 --[[     -- determining which version to use for project loading. ]]
 --[[     sdk_include_prereleases = true, ]]
 --[[]]
 --[[     -- Only run analyzers against open files when 'enableRoslynAnalyzers' is ]]
 --[[     -- true ]]
 --[[     analyze_open_documents_only = false, ]]
 --[[ } ]]

 -- Second example dzfrias https://dzfrias.dev/blog/neovim-unity-setup

--[[ require('lspconfig').omnisharp.setup { ]]
--[[   cmd = { ]]
--[[     'mono', ]]
--[[     '--assembly-loader=strict', ]]
--[[     omnisharp_location, ]]
--[[   }, ]]
--[[   -- Assuming you have an on_attach function. Delete this line if you don't. ]]
--[[   use_mono = true, ]]
--[[ } ]]


--Third example for real https://spaceandtim.es/code/nvim_unity_setup/
-- Omnisharp/C#/Unity
--[[ local omnisharp_bin = "/opt/omnisharp-roslyn/run" ]]
--[[ require'lspconfig'.omnisharp.setup{ ]]
--[[     on_attach = on_attach, ]]
--[[     flags = { ]]
--[[       debounce_text_changes = 150, ]]
--[[     }, ]]
--[[     cmd = { omnisharp_location, "--languageserver" , "--hostPID", tostring(pid) }; ]]
--[[ } ]]
-- Fourht  example 

vim.api.nvim_create_autocmd("LspAttach", {
  desc = "Fix startup error by disabling semantic tokens for omnisharp",
  group = vim.api.nvim_create_augroup("OmnisharpHook", {}),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client.name == "omnisharp" then
      client.server_capabilities.semanticTokensProvider = nil
    end
  end,
})

