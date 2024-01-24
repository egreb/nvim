require('telescope').setup = {
  default = {
    layout_config = {
      prompt_position = "bottom"
    }
  }
}

function Lsp_files()
  local clients = vim.lsp.get_active_clients()
  if #clients == 0 then
    print("No active lsp client")
  end

  local current = clients[1]
  print(current)
  local ts_config = current.config.ts_config or 'tsconfig.json'
  local cwd = vim.fn.getcwd()
  local tsconfig_path = vim.fn.findfile(ts_config, cwd)
  print(cwd, tsconfig_path)

  if not tsconfig_path or tsconfig_path == '' then
    print("No tsconfig.json found")
    return
  end

  local cmd = string.format("tsc --noEmit -p %s", tsconfig_path)

  local job = vim.fn.jobstart(cmd, {
    on_stout = function (_, data, _)
      local output = table.concat(data, '\n')
      print(output)

      local error_files = {}

      for file_path in output:gmatch("([^:]+):[0-9]+:[0-9]+: error:") do
        table.insert(error_files, file_path)
      end

      if #error_files > 0 then
        require('telescope.builtin').find_files({
          prompt_title = "Errors",
          cwd = vim.fnd.getcwd(),
          results = error_files,
        })
      end
    end,
    -- on_stout = function(_, data, _)
    --   print("No errors found", data)
    -- end,
    -- on_exit = function(p1, code, p2)
    --   if code == 0 then
    --     print("Typescript done")
    --   else
    --     print("TSC failed", code, p1, p2)
    --   end
    -- end
  })

  if job <= 0 then
    print("Error starting job")
  end
end

-- Bind the function to a key mapping
vim.keymap.set('n', '<leader>rr', Lsp_files, { desc = 'Run code', noremap = true, silent = true })
