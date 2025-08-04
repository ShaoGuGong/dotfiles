-- Pull in the wezterm API
local wezterm = require("wezterm")
local keys = require("key-binding")
local fonts = require("fonts")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.
config.show_tab_index_in_tab_bar = false
config.window_background_opacity = 1.0
config.default_prog = { "/usr/bin/fish" }
config.keys = keys

-- For example, changing the initial geometry for new windows:
config.initial_cols = 140
config.initial_rows = 30

-- or, changing the font size and color scheme.
config.font = wezterm.font_with_fallback(fonts)
config.font_size = 12.0

-- Set Appearance
config.color_scheme = "Kanagawa (Gogh)"
config.hide_tab_bar_if_only_one_tab = true

-- Finally, return the configuration to wezterm:
return config
