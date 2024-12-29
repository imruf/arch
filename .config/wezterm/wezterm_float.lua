-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()
local act = wezterm.action

-- default shell
-- config.default_prog = { '/usr/bin/zsh' }

-- color scheme:
config.color_scheme = 'Gruvbox dark, medium (base16)'


-- font

-- config.font =
--   	wezterm.font('Comic Mono', { weight = 'Bold', italic = false })
--   	wezterm.font('MesloLGM Nerd Font Mono', { weight = 'Bold', italic = false })
--   wezterm.font('UbuntuMono Nerd Font', { weight = 'Bold', italic = false })


config.font = wezterm.font_with_fallback {
	{
		family = 'Comic Mono',
    weight = 'Bold',

	},
	{
		family = 'MesloLGS Nerd Font Mono',
    weight = 'Bold',

	},
	{
		family = 'UbuntuMono Nerd Font',
    weight = 'Bold'
	},
  	'Fira Code',
  	'DengXian',
}

config.font_size = 16

-- Appearance
config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.window_background_opacity=0.9


config.initial_rows = 18
config.initial_cols = 96

-- KEYBINDING

config.keys = {
  { key = 'j', mods = 'CTRL|SHIFT', action = act.ScrollByLine(10) },
  { key = 'k', mods = 'CTRL|SHIFT', action = act.ScrollByLine(-10) },
}

-- and finally, return the configuration to wezterm
return config
