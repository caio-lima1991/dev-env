local wezterm = require("wezterm")
local config = wezterm.config_builder()

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  config.default_prog = { "wsl.exe", "-d", "archlinux", "--cd", "~" }
end

config.font = wezterm.font("CodeNewRoman Nerd Font Mono")
config.font_size = 11
config.enable_tab_bar = false

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
  window:gui_window():toggle_fullscreen()
end)

wezterm.on("update-right-status", function(window, pane)
  window:set_right_status(window:active_workspace())
end)

config.keys = {
  {
    key = 'Enter',
    mods = 'ALT',
    action = wezterm.action.ToggleFullScreen,
  },
}

return config
