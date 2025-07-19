-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.
local opacity = 1.0
local function set_opacity(window, value)
	opacity = math.max(0.1, math.min(1.0, value))
	window:set_config_overrides({
		window_background_opacity = opacity,
	})
end

config.show_tab_index_in_tab_bar = false

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 30

-- or, changing the font size and color scheme.
config.font = wezterm.font_with_fallback({ "FiraCode Nerd Font Mono", "Maple Mono NF CN" })
config.font_size = 14.0

-- Set Appearance
config.color_scheme = "Kanagawa (Gogh)"
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = opacity

-- Add key bindings
config.keys = {
	{
		key = "UpArrow",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ScrollByLine(-1),
	},
	{
		key = "DownArrow",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ScrollByLine(1),
	},
	-- ╭─────────────────────────────────────────────────────────╮
	-- │                      Set Tab Title                      │
	-- ╰─────────────────────────────────────────────────────────╯
	{
		key = "t",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.PromptInputLine({
			description = "Rename Tab",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
	-- ╭─────────────────────────────────────────────────────────╮
	-- │                   Set Window Oapcity                    │
	-- ╰─────────────────────────────────────────────────────────╯
	{
		key = "=",
		mods = "CTRL|ALT",
		action = wezterm.action_callback(function(window, pane)
			set_opacity(window, opacity + 0.1)
		end),
	},
	{
		key = "-",
		mods = "CTRL|ALT",
		action = wezterm.action_callback(function(window, pane)
			set_opacity(window, opacity - 0.1)
		end),
	},
	{
		key = "0",
		mods = "CTRL|ALT",
		action = wezterm.action_callback(function(window, pane)
			set_opacity(window, 1.0)
		end),
	},
	{
		key = "w",
		mods = "CTRL|SHIFT",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "w",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.CloseCurrentTab({ confirm = true }),
	},
	-- ╭─────────────────────────────────────────────────────────╮
	-- │                      Tab ShortCuts                      │
	-- ╰─────────────────────────────────────────────────────────╯
	{
		key = "LeftArrow",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		key = "RightArrow",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivateTabRelative(1),
	},
	{
		key = "<",
		mods = "CTRL|SHIFT",
		action = wezterm.action.MoveTabRelative(-1),
	},
	{
		key = ">",
		mods = "CTRL|SHIFT",
		action = wezterm.action.MoveTabRelative(1),
	},
	-- ╭─────────────────────────────────────────────────────────╮
	-- │                     Pane ShortCuts                      │
	-- ╰─────────────────────────────────────────────────────────╯
	{
		key = "LeftArrow",
		mods = "CTRL|ALT",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "RightArrow",
		mods = "CTRL|ALT",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "UpArrow",
		mods = "CTRL|ALT",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "DownArrow",
		mods = "CTRL|ALT",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
}

-- Finally, return the configuration to wezterm:
return config
