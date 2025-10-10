local wezterm = require("wezterm")
local get_process_icon = require("get_process_icon")

local RIGHT = wezterm.nerdfonts.ple_right_half_circle_thick
local LEFT_ARROW = wezterm.nerdfonts.cod_arrow_left
local RIGHT_ARROW = wezterm.nerdfonts.cod_arrow_right

local colors = {
	"#8ba4b0",
	"#c4746e",
	"#8992a7",
	"#8ea4a2",
	"#737c73",
	"#949fb5",
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

local num_displayed = 3

-- @params s original string
-- @params len fixed length
local function fixed_string_length(s, len)
	local pad = " "
	local slen = #s

	if slen == len then
		return s
	end

	if slen > len then
		return string.sub(s, 1, len)
	end

	if slen < len then
		local diff = len - slen
		local half = math.floor(diff / 2)
		return string.rep(pad, half) .. s .. string.rep(pad, diff - half)
	end
end

-- Args: tab, tabs, panes, config, hover, max_width
local function format_tab_bar(tab, tabs, _, _, _, max_width)
	local id = tab.tab_index
	local background = get_color(id)
	local next_background = get_color(id + 1)
	local foreground = "#16161D"
	local displayed = false
	local right_display_fold_icon = false
	local left_display_fold_icon = false
	local intensity = "Normal"
	local italic = false

	for i = (id + 1 - num_displayed), (id + 1 + num_displayed) do
		if i > #tabs or i < 1 then
		elseif tabs[i].is_active then
			displayed = true
			break
		end
	end

	if id - num_displayed > 0 then
		if tabs[id - num_displayed].is_active then
			right_display_fold_icon = true
		end
	end
	if id + num_displayed + 2 <= #tabs then
		if tabs[id + num_displayed + 2].is_active then
			left_display_fold_icon = true
		end
	end

	if tab.is_active then
		background = "#DCD7BA"
		intensity = "Bold"
		italic = true
	end

	if id == tabs[#tabs].tab_index then
		next_background = "#1F1F28"
	elseif (id + 2) <= #tabs and tabs[id + 2].is_active then
		next_background = "#DCD7BA"
	end

	if displayed then
		local title = tab_title(tab)

		local process_icon = wezterm.nerdfonts.md_monitor

		if not tab.is_active then
			process_icon = get_process_icon(tab.active_pane.foreground_process_name)
		end

		-- title = wezterm.truncate_right(title, max_width - 4)
		title = fixed_string_length(title, max_width - 4)
		title = " " .. process_icon .. " " .. title

		return {
			{ Attribute = { Intensity = intensity } },
			{ Attribute = { Italic = italic } },
			{ Background = { Color = background } },
			{ Foreground = { Color = foreground } },
			{ Text = title },
			{ Foreground = { Color = background } },
			{ Background = { Color = next_background } },
			{ Text = RIGHT },
		}
	elseif left_display_fold_icon then
		local text = " " .. LEFT_ARROW .. " +" .. id + 1 .. " "
		text = fixed_string_length(text, max_width)
		return {
			{ Background = { Color = background } },
			{ Foreground = { Color = foreground } },
			{ Text = text },
			{ Foreground = { Color = background } },
			{ Background = { Color = next_background } },
			{ Text = RIGHT },
		}
	elseif right_display_fold_icon then
		local text = " " .. RIGHT_ARROW .. " +" .. #tabs - id .. " "
		text = fixed_string_length(text, max_width)
		return {
			{ Background = { Color = background } },
			{ Foreground = { Color = foreground } },
			{ Text = text },
			{ Foreground = { Color = background } },
			{ Background = { Color = "#1F1F28" } },
			{ Text = RIGHT },
		}
	else
		return {}
	end
end

return format_tab_bar
