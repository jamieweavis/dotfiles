-- typescript-language-server — https://github.com/typescript-language-server/typescript-language-server
-- Binary from Homebrew, but a project-local node_modules/.bin copy wins so each
-- repo gets the tsserver version it pins. Loaded by vim.lsp.enable in lua/plugins/lsp.lua.
--
-- Trimmed from nvim-lspconfig's lsp/ts_ls.lua. Two deliberate differences:
--   * Root detection uses package.json / tsconfig.json. Upstream keys off package
--     manager lockfiles and adds Deno-exclusion branches we do not need.
--   * Dropped the 'editor.action.showReferences' command, which only fires from
--     code lens reference counts.

return {
  init_options = { hostInfo = 'neovim' },

  cmd = function(dispatchers, config)
    local cmd = 'typescript-language-server'
    local root_dir = (config or {}).root_dir
    if root_dir then
      local local_cmd = vim.fs.joinpath(root_dir, 'node_modules/.bin', cmd)
      if vim.fn.executable(local_cmd) == 1 then
        cmd = local_cmd
      end
    end
    return vim.lsp.rpc.start({ cmd, '--stdio' }, dispatchers)
  end,

  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },

  -- No marker found means no root, and no root means the server does not attach.
  -- That is what single_file_support = false used to do under nvim-lspconfig.
  root_markers = { 'package.json', 'tsconfig.json' },

  handlers = {
    -- Refactors that move code (extract function, extract type) ask the editor to
    -- drive the rename. Without this they fail silently.
    ['_typescript.rename'] = function(_, result, ctx)
      local client = assert(vim.lsp.get_client_by_id(ctx.client_id))
      vim.lsp.util.show_document({
        uri = result.textDocument.uri,
        range = { start = result.position, ['end'] = result.position },
      }, client.offset_encoding)
      vim.lsp.buf.rename()
      return vim.NIL
    end,
  },

  on_attach = function(client, bufnr)
    -- Whole-file 'source.*' actions (organise imports, remove unused) appear in
    -- code_action() only when requested by kind.
    vim.api.nvim_buf_create_user_command(bufnr, 'LspTypescriptSourceAction', function()
      local source_actions = vim.tbl_filter(function(action)
        return vim.startswith(action, 'source.')
      end, client.server_capabilities.codeActionProvider.codeActionKinds)
      vim.lsp.buf.code_action { context = { only = source_actions, diagnostics = {} } }
    end, { desc = 'Whole-file TypeScript source actions' })

    -- Jumps to the implementation rather than the .d.ts type declaration.
    vim.api.nvim_buf_create_user_command(bufnr, 'LspTypescriptGoToSourceDefinition', function()
      local params = vim.lsp.util.make_position_params(vim.api.nvim_get_current_win(), client.offset_encoding)
      client:exec_cmd({
        command = '_typescript.goToSourceDefinition',
        title = 'Go to source definition',
        arguments = { params.textDocument.uri, params.position },
      }, { bufnr = bufnr }, function(err, result)
        if err then
          return vim.notify('Go to source definition failed: ' .. err.message, vim.log.levels.ERROR)
        end
        if not result or vim.tbl_isempty(result) then
          return vim.notify('No source definition found', vim.log.levels.INFO)
        end
        vim.lsp.util.show_document(result[1], client.offset_encoding, { focus = true })
      end)
    end, { desc = 'Go to source definition' })
  end,
}
