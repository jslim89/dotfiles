-- ~/.config/rex/init.lua  (translated from ~/.tmux.conf)

local P        = "`"                       -- prefix
local TERMINAL = "com.superlogical.terminal"
local SHELL    = TERMINAL .. ".shell"

local function prefix(key) return P .. ">" .. key end

---------------------------------------------------------------------
-- Prefix: ` ; press it twice to type a literal backtick
---------------------------------------------------------------------
rex.bind(prefix("`"), "pane.send_key", { key = "`" })

---------------------------------------------------------------------
-- Window (tab) navigation, no prefix
---------------------------------------------------------------------
rex.bind("alt+j", "client.tab.previous")
rex.bind("alt+k", "client.tab.next")

---------------------------------------------------------------------
-- Splits / new window
---------------------------------------------------------------------
rex.bind(prefix("shift+\\"), "pane.split", { direction = "right" }) -- |
rex.bind(prefix("\\"),       "pane.split", { direction = "right" }) -- \
rex.bind(prefix("-"),        "pane.split", { direction = "down" })
rex.bind(prefix("c"),        "client.tab.new")

-- base-index 1: prefix+1..9 jump to windows
-- (if this lands one tab off, use i - 1)
for i = 1, 9 do
  rex.bind(prefix(tostring(i)), "client.tab.goto", { index = i })
end

-- tmux defaults you didn't override but probably still use
rex.bind(prefix("n"), "client.tab.next")
rex.bind(prefix("p"), "client.tab.previous")
rex.bind(prefix("z"), "pane.zoom")
rex.bind(prefix("x"), "pane.close")

---------------------------------------------------------------------
-- Vim-aware pane navigation (Ctrl+h/j/k/l and Ctrl+\)
-- Returning false passes the key through to the terminal (i.e. to vim).
---------------------------------------------------------------------
local VIMS = { "vim", "nvim", "vi", "view", "gvim", "vimdiff", "nvimdiff" }

local function in_vim(ctx)
  local p = rex.block.call(TERMINAL, "process", { block_id = ctx.block_id })
  if p == nil then return false end
  local text = rex.json.encode(p) or ""
  for _, name in ipairs(VIMS) do
    if text:find('"' .. name .. '"', 1, true)
       or text:find('/' .. name .. '"', 1, true) then
      return true
    end
  end
  return false
end

local function vim_aware(key, direction)
  rex.bind(key, function(ctx, ev)
    if in_vim(ctx) then return false end
    rex.session.focus_direction{ direction = direction }
    return true
  end)
end

vim_aware("ctrl+h", "left")
vim_aware("ctrl+j", "down")
vim_aware("ctrl+k", "up")
vim_aware("ctrl+l", "right")

rex.bind("ctrl+\\", function(ctx, ev)
  if in_vim(ctx) then return false end
  rex.session.focus_previous_pane{}
  return true
end)

---------------------------------------------------------------------
-- Resize panes
---------------------------------------------------------------------
for _, r in ipairs({
  { "shift+left",  "left",  2  },
  { "shift+right", "right", 2  },
  { "shift+down",  "down",  1  },
  { "shift+up",    "up",    1  },
  { "alt+left",    "left",  10 },
  { "alt+right",   "right", 10 },
  { "alt+down",    "down",  5  },
  { "alt+up",      "up",    5  },
}) do
  rex.bind(r[1], "pane.resize", { direction = r[2], amount = r[3] })
end

---------------------------------------------------------------------
-- Move window left/right (ctrl+shift+left/right)
-- TODO: check `rex api describe session.move_window` for its arguments
---------------------------------------------------------------------
-- rex.bind("ctrl+shift+left",  function(ctx) ... end)
-- rex.bind("ctrl+shift+right", function(ctx) ... end)

---------------------------------------------------------------------
-- Custom actions: man page, htop, markdown preview, reload
---------------------------------------------------------------------
-- Assumed: "horizontal" = new pane to the right, "vertical" = below.
local function run_in_split(ctx, direction, command)
  local _, err = rex.session.new_split{
    block_id  = ctx.block_id,
    direction = direction,
    side      = "after",
    layout    = rex.layout.block{
      flavor  = SHELL,
      options = { command = command },
    },
  }
  if err ~= nil then error(err, 0) end
end

rex.action{
  name  = "man",
  title = "Open Man Page",
  args  = { page = "string" },
  run   = function(ctx, args)
    run_in_split(ctx, "horizontal", { "man", args.page })
  end,
}
-- Rex can't prompt for input like tmux's command-prompt, so there's no key.
-- Run it with:  rex do man page=tmux

rex.action{
  name  = "htop",
  title = "Open htop in Split",
  run   = function(ctx) run_in_split(ctx, "vertical", { "htop" }) end,
}
rex.bind(prefix("shift+`"), "htop")                      -- ~

rex.action{
  name  = "preview_md",
  title = "Preview Markdown",
  run   = function(ctx)
    run_in_split(ctx, "horizontal",
      { "bash", os.getenv("HOME") .. "/.scripts/tmux-preview-md.sh" })
  end,
}
rex.bind(prefix("="), "preview_md")

