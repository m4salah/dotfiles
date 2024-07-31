local wezterm = require("wezterm")
local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

local mux = wezterm.mux
local act = wezterm.action

config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font("JetBrainsMono Nerd Font")

config.default_domain = "WSL:Ubuntu"

config.window_decorations = "NONE"
config.hide_tab_bar_if_only_one_tab = true

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.window_close_confirmation = "NeverPrompt"
wezterm.on("gui-startup", function()
	local _, _, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

config.keys = {
	{ key = "v", mods = "ALT", action = act.PasteFrom("Clipboard") },
}
return config
