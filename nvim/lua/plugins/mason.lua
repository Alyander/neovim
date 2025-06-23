return {
    "mason-org/mason.nvim",
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {"clangd", "jdtls", "rust_analyzer", "lua_ls", "pyright"}
        })
    end,
    dependencies = {"hrsh7th/nvim-cmp", "mason-org/mason-lspconfig.nvim", "jay-babu/mason-nvim-dap.nvim" }
}
