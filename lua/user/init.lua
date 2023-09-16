vim.api.nvim_set_keymap('n', '<S-Tab>', ':bprev<CR>', { noremap = true })
return {
  colorscheme = "rose-pine",
  lsp = {
    config = {
      eslint = function (opts)
        opts.on_attach = function (client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end
        return opts
      end
    },
    formatting = {
      format_on_save = true, -- enable or disable automatic formatting on save
    },
  },

  plugins = {
    { 'rose-pine/neovim', name = 'rose-pine' },
    { 
      'iamcco/markdown-preview.nvim', 
      event = "BufRead",
      build = function ()
        vim.fn["mkdp#util#install"]()
      end
    }
  },
}
