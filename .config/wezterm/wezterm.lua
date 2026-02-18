-- Pull in the wezterm API
local wezterm = require("wezterm")
local keys = require("settings/key-binding")
local fonts = require("settings/fonts")
-- local format_tab_bar = require("settings/format-tab-bar")
-- local update_right_status = require("settings/status-bar")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.
-- config.window_decorations = "RESIZE"
config.window_background_opacity = 0.85
config.default_prog = { "/usr/bin/nu" }
config.keys = keys
local keys_table = wezterm.gui.default_key_tables()
table.insert(keys_table.copy_mode, {
	key = "y",
	mods = "NONE",
	action = wezterm.action.Multiple({
		wezterm.action.CopyTo("Clipboard"),
		wezterm.action.ClearSelection,
		wezterm.action.CopyMode("ClearSelectionMode"),
	}),
})
config.key_tables = keys_table

-- For example, changing the initial geometry for new windows:
-- config.initial_cols = 200
-- config.initial_rows = 50

-- or, changing the font size and color scheme.
config.font = wezterm.font_with_fallback(fonts)
config.font_size = 14.0

-- Set Appearance
-- local scheme = wezterm.color.get_builtin_schemes()["Kanagawa (Gogh)"]
-- scheme.tab_bar = {
-- 	background = "#1f1f28",
-- }
-- config.color_schemes = { ["Kanagawa"] = scheme }
-- config.color_scheme = "Kanagawa"
config.color_scheme = "Kanagawa (Gogh)"
-- config.window_background_image = "/home/shaogu/Pictures/my_wallpapers/wallpapers/linux/Wallpaper-gnu.jpeg"
-- config.window_background_image_hsb = {
-- 	brightness = 0.1,
-- 	saturation = 1.0,
-- 	hue = 1.0,
-- }

-- ────────────────────────────( Set Cursor )─────────────────────────
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 1000
config.animation_fps = 120
config.cursor_blink_ease_in = "Linear"
config.cursor_blink_ease_out = "Linear"

-- ────────────────────────────( Set Tab Bar )────────────────────────────
config.enable_tab_bar = false
-- config.tab_max_width = 25
-- config.hide_tab_bar_if_only_one_tab = false
-- config.show_tab_index_in_tab_bar = false
-- config.use_fancy_tab_bar = false
-- config.show_new_tab_button_in_tab_bar = false
-- config.tab_bar_at_bottom = true
-- config.window_decorations = "NONE"
-- wezterm.on("format-tab-title", format_tab_bar)

-- wezterm.on("update-status", update_right_status)

wezterm.on("format-window-title", function(_, _, _, _, _)
	return "Wezterm Terminal Emulator"
end)

-- wezterm.on("window-resized", function(window, _)
-- 	local overrides = window:get_config_overrides() or {}
-- 	local dims = window:get_dimensions()

-- 	local font_size = overrides.font_size or window:effective_config().font_size
-- 	local dpi = dims.dpi

-- 	-- 字體大小 (pt) → 像素 (px)
-- 	local font_px = font_size * (dpi / 72.0)

-- 	-- 單一字元寬度（估計值：monospace ~ 0.55～0.62）
-- 	local char_px = font_px * 0.60

-- 	-- 希望 tab 佔視窗一半寬，並放 5 個 tab
-- 	local desired_px_per_tab = (dims.pixel_width * 0.8) / 5

-- 	-- 必須換算成字元數
-- 	local new_width = math.floor(desired_px_per_tab / char_px)

-- 	-- 安全限制，避免太窄/太寬
-- 	new_width = math.max(10, math.min(new_width, 25))

-- 	if overrides.tab_max_width ~= new_width then
-- 		overrides.tab_max_width = new_width
-- 		window:set_config_overrides(overrides)
-- 	end
-- end)

-- config.unix_domains = {
-- 	{ name = "unix" },
-- }

-- Finally, return the configuration to wezterm:
return config
