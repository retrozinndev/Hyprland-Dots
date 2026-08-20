require("util");
require("lsp/plugins");
require("lsp/cmp");

local capabilities = vim.lsp.protocol.make_client_capabilities();

---@type table<string, vim.lsp.Config>
local servers = {
    bashls = {
        cmd = { "bash-language-server", "start" },
        filetypes = { "sh", "bash", "zsh" }
    },
    astro = {
        cmd = { "astro-ls", "--stdio" },
        root_markers = { "package.json", "tsconfig.json", "astro.config.mjs" },
        filetypes = { "astro" },
        init_options = {
        typescript = {
            tsdk = "node_modules/typescript/lib"
        }
    },
    },
    pyright = {
        cmd = { "pyright-langserver", "--stdio" },
        filetypes = { "python" }
    },
    somesass_ls = {
        cmd = { "some-sass-language-server", "--stdio" },
        filetypes = { "scss", "sass" }
    },
    mesonlsp = {
        cmd = { "mesonlsp", "--lsp" },
        filetypes = { "meson" }
    },
    clangd = {
        cmd = { "clangd" },
        filetypes = { "cpp", "c" }
    },
    nushell = {
        cmd = { "nu", "--lsp" },
        filetypes = { "nu" }
    },
    blueprint_ls = {
        cmd = { "blueprint-compiler", "lsp" },
        filetypes = { "blueprint" }
    },
    vala_ls = {
        cmd = { "vala-language-server" },
        filetypes = { "vala" }
    },
    vtsls = {
        cmd = { "vtsls", "--stdio" },
        filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" }
    },
    nil_ls = {
        cmd = { "nil", "--stdio" },
        filetypes = { "nix" }
    },
    rust_analyzer = {
        cmd = { "rust-analyzer" },
        filetypes = { "rust" },
        diagnostics = {
            enable = true
        }
    },
    lua_ls = {
        cmd = { "lua-language-server" },
        filetypes = { "lua" },
	settings = {
	    Lua = {
		telemetry = {
		    enable = false;
		},
                workspace = {
                    library = Concat_arrays(
                        Concat_arrays(
                            vim.api.nvim_get_runtime_file("", true),
                            vim.api.nvim_get_runtime_file("lua/lspconfig", false)
                        ),
			{
                            "/usr/share/hypr/stubs"
                        }
                    )
                }
	    }
	}
    },
    qmlls = {
        cmd = { "qmlls6" },
        filetypes = { "qml" },
        single_file_support = true
    },
    html = {
        cmd = { "vscode-html-language-server", "--stdio" },
        filetypes = { "html" }
    },
    jsonls = {
        cmd = { "vscode-json-language-server", "--stdio" },
        filetypes = { "json", "jsonc" }
    },
    cssls = {
        cmd = { "vscode-css-language-server", "--stdio" },
	filetypes = { "css" }
    },
    jdtls = {
        filetypes = { "java" },
	java = {
	    signatureHelp = {
		enabled = true;
	    }
	}
    }
};

local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities);
for server, userconfig in pairs(servers) do
    if type(userconfig) == "table" and Dict_table_len(userconfig) > 0 then
        vim.lsp.config(server, userconfig);
    end

    vim.lsp.config(server, {
        capabilities = cmp_capabilities
    });
    vim.lsp.enable(server);
end
