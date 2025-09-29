local wezterm = require("wezterm")
local get_process_icon = require("get_process_icon")

-- The powerline < symbol
-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider
local DIR = wezterm.nerdfonts.oct_file_directory_open_fill .. " "
local LINUX = wezterm.nerdfonts.fa_linux
local DOTS = wezterm.nerdfonts.md_dots_horizontal
-- Color palette for the backgrounds of each cell
local colors = {
	"#4e8ca2",
	"#6693bf",
	"#5a7785",
	"#d7e3d8",
}

-- Foreground color for the text across the fade
local text_fg = "#16161D"
-- local text_fg = "#DCD7BA"

local function push(text, elements, num_cells)
	local cell_no = num_cells + 1
	table.insert(elements, { Foreground = { Color = colors[(cell_no % #colors) + 1] } })
	table.insert(elements, { Text = SOLID_LEFT_ARROW })
	table.insert(elements, { Foreground = { Color = text_fg } })
	table.insert(elements, { Background = { Color = colors[(cell_no % #colors) + 1] } })
	table.insert(elements, { Text = " " .. text .. " " })
end

local path_len = 2
local function last_n_dirs(path, n)
	local parts = {}
	for part in path:gmatch("[^/]+") do
		table.insert(parts, part)
	end
	local res = {}
	for i = math.max(1, #parts - n + 1), #parts do
		table.insert(res, parts[i])
	end
	return #parts, table.concat(res, "/")
end

local function update_status(window, pane)
	-- Each element holds the text for a cell in a "powerline" style << fade
	local cells = {}

	table.insert(cells, get_process_icon(pane:get_foreground_process_name()))

	local cwd_uri = pane:get_current_working_dir()
	if cwd_uri then
		local len, cwd = last_n_dirs(cwd_uri.file_path, path_len)
		if len > path_len then
			cwd = DOTS .. "/" .. cwd
		end
		local hostname = cwd_uri.host or wezterm.hostname()

		-- Remove the domain name portion of the hostname
		local dot = hostname:find("[.]")
		if dot then
			hostname = hostname:sub(1, dot - 1)
		end
		if hostname == "" then
			hostname = wezterm.hostname()
		end

		table.insert(cells, DIR .. " " .. cwd)
		table.insert(cells, LINUX .. " " .. hostname)
	end

	local date = wezterm.strftime("%H:%M")
	table.insert(cells, wezterm.nerdfonts.fa_clock_o .. " " .. date)
	-- The elements to be formatted
	local elements = {}
	-- How many cells have been formatted
	local num_cells = 0

	while #cells > 0 do
		local cell = table.remove(cells, 1)
		push(cell, elements, num_cells)
		num_cells = num_cells + 1
	end

	window:set_right_status(wezterm.format(elements))
end

return update_status
