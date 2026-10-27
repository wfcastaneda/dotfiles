-- Rex configuration.
-- Reload with: rex config reload
-- Check with:  rex config check && rex keymap

-- ==========================
-- Pane focus
-- ==========================

-- Ctrl+H/J/K/L move between panes, as they did under tmux.
-- These keys do not reach the shell while bound here.
for key, direction in pairs({ h = "left", j = "down", k = "up", l = "right" }) do
  rex.bind("ctrl+" .. key, "pane.focus", { direction = direction })
end

-- ==========================
-- Superpower workbench
-- ==========================

local shell = "com.superlogical.terminal.shell"
local superpower = os.getenv("SUPERPOWER_DIR") or (os.getenv("HOME") .. "/superpower")

-- One shell pane in a repo. `input` is typed into the pane but not run.
local function repo(name, input)
  return rex.layout.block{
    flavor = shell,
    label = name,
    options = { cwd = superpower .. "/" .. name, initial_input = input },
  }
end

-- Layout:
--   top (60%):    devbox (50%) | website | react-app | superpower-admin | superpower-organizations
--   bottom (40%): ts-server | ts-ai-chat
rex.action{
  name = "workbench",
  title = "Open Superpower Workbench",
  category = "Superpower",
  description = "Open the daily layout: devbox, the four frontends, ts-server, and ts-ai-chat.",
  run = function(ctx, args)
    local frontends = rex.layout.horizontal(0.25, repo("website"),
      rex.layout.horizontal(1 / 3, repo("react-app"),
        rex.layout.horizontal(0.5, repo("superpower-admin"), repo("superpower-organizations"))))
    local top = rex.layout.horizontal(0.5, repo("devbox", "make core/up && lzd"), frontends)
    local bottom = rex.layout.horizontal(0.5, repo("ts-server"), repo("ts-ai-chat"))

    local window, err = rex.session.new_window{
      window_label = "dev",
      layout = rex.layout.vertical(0.6, top, bottom),
    }
    if err ~= nil then error(err, 0) end

    -- The app drops a select for a window it has not seen yet. A short
    -- pause lets the window arrive first. From the CLI, the select needs
    -- Remote Control on in the app (Settings => Rex Server).
    rex.exec{ "sleep", "0" }
    rex.client.queue("session.select", {
      session_id = ctx.session_id,
      window_id = window.window_id,
    })
    return { window_id = window.window_id }
  end,
}
