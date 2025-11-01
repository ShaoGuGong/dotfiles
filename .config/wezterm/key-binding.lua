local wezterm = require("wezterm")
local fonts = require("fonts")

-- This is where you actually apply your config choices.
local opacity = 0.8
local function set_opacity(window, value)
	opacity = math.max(0.1, math.min(1.0, value))
	window:set_config_overrides({
		window_background_opacity = opacity,
	})
end
local idx = 1
local color_schemes = {
	"Bamboo",
	"Bamboo Light",
}

-- Add key bindings
local keys = {
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
		key = "r",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.PromptInputLine({
			description = "Rename Tab",
			action = wezterm.action_callback(function(window, _, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
	{
		key = "t",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.PromptInputLine({
			description = "New Tab Name",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:perform_action(wezterm.action({ SpawnTab = "CurrentPaneDomain" }), pane)
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
		action = wezterm.action_callback(function(window)
			set_opacity(window, opacity + 0.1)
		end),
	},
	{
		key = "-",
		mods = "CTRL|ALT",
		action = wezterm.action_callback(function(window)
			set_opacity(window, opacity - 0.1)
		end),
	},
	{
		key = "0",
		mods = "CTRL|ALT",
		action = wezterm.action_callback(function(window)
			set_opacity(window, 1.0)
		end),
	},
	{
		key = "5",
		mods = "CTRL|ALT",
		action = wezterm.action_callback(function(window)
			set_opacity(window, 0.5)
		end),
	},
	-- ╭─────────────────────────────────────────────────────────╮
	-- │                      Set Close Key                      │
	-- ╰─────────────────────────────────────────────────────────╯
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
	-- │                        Set Fonts                        │
	-- ╰─────────────────────────────────────────────────────────╯
	{
		key = "F",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action_callback(function(win)
			local overrides = win:get_config_overrides() or {}
			table.insert(fonts, table.remove(fonts, 1))
			overrides.font = wezterm.font_with_fallback(fonts)
			win:set_config_overrides(overrides)
			local font_name = "Current font:\n" .. fonts[1].family
			win:toast_notification("Font Changed", font_name, nil, 5000)
		end),
	},
	-- ╭─────────────────────────────────────────────────────────╮
	-- │                    Set Color Scheme                     │
	-- ╰─────────────────────────────────────────────────────────╯
	{
		key = "C",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action_callback(function(win)
			local overrides = win:get_config_overrides() or {}
			overrides.color_scheme = color_schemes[idx]
			win:set_config_overrides(overrides)
			idx = idx + 1
			if idx > #color_schemes then
				idx = idx % #color_schemes
			end
		end),
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

	{
		key = "s",
		mods = "CTRL|ALT",
		action = wezterm.action.AttachDomain("unix"),
	},
	{
		key = "l",
		mods = "CTRL|ALT",
		action = wezterm.action.ShowLauncher,
	},
}

return keys
