-- How to use:
-- Run :BuildFile or :BuildFolder, or use the configured keymaps to build the
-- current file or current working directory in a terminal split.

local dev = require("config.dev")

local M = {}
local runner_buf

local function output_name(stem)
  return vim.fn.shellescape("./" .. stem .. ".out")
end

local function open_runner(cmd, cwd)
  if runner_buf and vim.api.nvim_buf_is_valid(runner_buf) then
    local wins = vim.fn.win_findbuf(runner_buf)
    if #wins > 0 then
      vim.api.nvim_set_current_win(wins[1])
      vim.api.nvim_buf_delete(runner_buf, { force = true })
    else
      vim.cmd("botright 15split")
    end
  else
    vim.cmd("botright 15split")
  end

  vim.cmd("enew")
  runner_buf = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_set_name(runner_buf, "Build Runner")

  vim.bo.buflisted = false
  vim.bo.bufhidden = "wipe"
  vim.bo.swapfile = false
  local job_id = vim.fn.termopen(cmd, { cwd = cwd })
  if job_id <= 0 then
    vim.notify("Failed to start terminal runner", vim.log.levels.ERROR)
    return
  end
  vim.cmd("startinsert")
end

local function resolve_python()
  local python = dev.resolve_python()
  return python and vim.fn.shellescape(python) or nil
end

local function build_current_file()
  if vim.bo.modified then
    vim.cmd("write")
  end

  local ft = vim.bo.filetype
  local file = vim.fn.expand("%:p")
  if file == "" then
    vim.notify("No file to run in current buffer", vim.log.levels.WARN)
    return
  end

  local qfile = vim.fn.shellescape(file)
  local out = vim.fn.expand("%:t:r")
  local qout = output_name(out)
  local cmd = nil

  if ft == "python" then
    local python = resolve_python()
    if not python then
      vim.notify("No Python interpreter found in PATH", vim.log.levels.WARN)
      return
    end
    cmd = python .. " " .. qfile
  elseif ft == "c" then
    cmd = "gcc -g -O0 " .. qfile .. " -o " .. qout .. " && " .. qout
  elseif ft == "cpp" then
    cmd = table.concat({
      "t=$(date +%s%N)",
      "g++ -g -O0 -std=c++17 " .. qfile .. " -o " .. qout,
      "comp=$(( ( $(date +%s%N) - t )/1000000 ))",
      qout,
      [[printf '\n\nDone compiling file in %s ms\n' "$comp"]],
    }, " && ")
  elseif ft == "rust" then
    cmd = "rustc -g -C debuginfo=2 " .. qfile .. " -o " .. qout .. " && " .. qout
  else
    vim.notify("BuildFile unsupported for filetype: " .. ft, vim.log.levels.WARN)
    return
  end

  open_runner(cmd, vim.fn.expand("%:p:h"))
end

local function build_current_folder()
  local cwd = dev.resolve_root()
  local cmd = nil

  if vim.fn.filereadable(cwd .. "/Cargo.toml") == 1 then
    cmd = "cargo build"
  elseif vim.fn.filereadable(cwd .. "/Makefile") == 1
      or vim.fn.filereadable(cwd .. "/makefile") == 1
      or vim.fn.filereadable(cwd .. "/GNUmakefile") == 1 then
    cmd = "make"
  elseif vim.fn.filereadable(cwd .. "/CMakeLists.txt") == 1 then
    if vim.fn.isdirectory(cwd .. "/build") == 1 then
      cmd = "cmake --build build"
    else
      cmd = "cmake -S . -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON && cmake --build build"
    end
  elseif #vim.fn.globpath(cwd, "*.cpp", false, true) > 0 then
    local out_stem = vim.fs.basename(cwd)
    if out_stem == nil or out_stem == "" then
      out_stem = "app_main"
    end
    local qout = output_name(out_stem)
    cmd = table.concat({
      "set -- ./*.cpp",
      [[if [ "$1" = './*.cpp' ]; then echo 'No .cpp files found'; exit 1; fi]],
      "t=$(date +%s%N)",
      "g++ -g -O0 -std=c++17 \"$@\" -o " .. qout,
      "comp=$(( ( $(date +%s%N) - t )/1000000 ))",
      qout,
      [[printf '\n\nDone compiling %s file(s) in %s ms\n' "$#" "$comp"]],
    }, " && ")
  elseif vim.fn.filereadable(cwd .. "/package.json") == 1 then
    cmd = "npm run build"
  elseif vim.fn.filereadable(cwd .. "/pyproject.toml") == 1 then
    local python = resolve_python()
    if not python then
      vim.notify("No Python interpreter found in PATH", vim.log.levels.WARN)
      return
    end
    cmd = python .. " -m build"
  else
    vim.notify("No known build system in " .. cwd, vim.log.levels.WARN)
    return
  end

  open_runner(cmd, cwd)
end

local function build_smart()
  local ft = vim.bo.filetype
  if ft == "python" or ft == "c" or ft == "cpp" or ft == "rust" then
    build_current_file()
  else
    build_current_folder()
  end
end

function M.setup()
  pcall(vim.api.nvim_del_user_command, "Build")
  pcall(vim.api.nvim_del_user_command, "BuildFile")
  pcall(vim.api.nvim_del_user_command, "BuildFolder")

  vim.api.nvim_create_user_command("Build", build_smart, {})
  vim.api.nvim_create_user_command("BuildFile", build_current_file, {})
  vim.api.nvim_create_user_command("BuildFolder", build_current_folder, {})

  vim.keymap.set("n", "<C-A-b>", build_smart, {
    noremap = true,
    silent = true,
    desc = "Build smart target",
  })

  vim.keymap.set("n", "<C-A-n>", build_current_file, {
    noremap = true,
    silent = true,
    desc = "Build/run current file",
  })

  vim.keymap.set("n", "<C-A-S-n>", build_current_folder, {
    noremap = true,
    silent = true,
    desc = "Build current folder",
  })

  vim.keymap.set("n", "<C-A-N>", build_current_folder, {
    noremap = true,
    silent = true,
    desc = "Build current folder",
  })
end

return M
