-- Pull in the wezterm API
local wezterm = require("wezterm")
local keys = require("key-binding")
local fonts = require("fonts")
local format_tab_bar = require("format-tab-bar")
local update_right_status = require("status-bar")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.
-- config.window_decorations = "RESIZE"
config.window_background_opacity = 1.0
config.default_prog = { "/usr/bin/fish" }
config.keys = keys

-- For example, changing the initial geometry for new windows:
config.initial_cols = 110
config.initial_rows = 30

-- or, changing the font size and color scheme.
config.font = wezterm.font_with_fallback(fonts)
config.font_size = 14.0

-- Set Appearance
local scheme = wezterm.color.get_builtin_schemes()["Kanagawa (Gogh)"]
scheme.tab_bar = {
	background = "#1f1f28",
}
config.color_schemes = { ["Kanagawa"] = scheme }
config.color_scheme = "Kanagawa"
config.window_background_image = "/home/shaogu/Pictures/yurukyan.jpg"
config.window_background_image_hsb = {
	brightness = 0.1,
	saturation = 1.0,
	hue = 1.0,
}

-- ────────────────────────────( Set Cursor )─────────────────────────
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 1000
config.animation_fps = 120
config.cursor_blink_ease_in = "Linear"
config.cursor_blink_ease_out = "Linear"

-- ────────────────────────────( Set Tab Bar )────────────────────────────
config.tab_max_width = 20
config.hide_tab_bar_if_only_one_tab = false
config.show_tab_index_in_tab_bar = false
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.tab_bar_at_bottom = true
wezterm.on("format-tab-title", format_tab_bar)

wezterm.on("update-status", update_right_status)

wezterm.on("format-window-title", function(_, _, _, _, _)
	return ""
end)

config.unix_domains = {
	{ name = "unix" },
}

-- Finally, return the configuration to wezterm:
return config
