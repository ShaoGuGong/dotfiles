local wezterm = require("wezterm")

-- The filled in variant of the < symbol
-- local LEFT = wezterm.nerdfonts.ple_left_half_circle_thick

-- The filled in variant of the > symbol
-- local RIGHT = wezterm.nerdfonts.ple_right_half_circle_thick
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

local colors = {
	"#a6a69c",
	"#9e9b93",
	"#7a8382",
}

local function tab_title(tab_info)
	local title = tab_info.tab_title
	-- if the tab title is explicitly set, take that
	if title and #title > 0 then
		return title
	end
	-- Otherwise, use the title from the active pane
	-- in that tab
	return tab_info.active_pane.title
end

local function get_color(id)
	return colors[(id % #colors) + 1]
end

-- Args: tab, tabs, panes, config, hover, max_width
local function format_tab_bar(tab, tabs, _, _, hover, max_width)
	local id = tab.tab_index
	local background = get_color(id)
	local next_background = get_color(id + 1)
	local foreground = "#16161D"

	if tab.is_active then
		background = "#C8C093"
	elseif hover then
		background = "#DCD7BA"
	end

	if id == tabs[#tabs].tab_index then
		next_background = "#1F1F28"
	elseif (id + 2) <= #tabs and tabs[id + 2].is_active then
		next_background = "#C8C093"
	end

	local title = tab_title(tab)

	-- ensure that the titles fit in the available space,
	-- and that we have room for the edges.
	title = wezterm.truncate_right(title, max_width - 3)

	return {
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = " " .. title .. " " },
		{ Foreground = { Color = background } },
		{ Background = { Color = next_background } },
		{ Text = SOLID_RIGHT_ARROW },
	}
end

return format_tab_bar
