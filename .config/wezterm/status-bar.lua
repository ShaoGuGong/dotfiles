local wezterm = require("wezterm")

-- The powerline < symbol
-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider
local DIR = wezterm.nerdfonts.oct_file_directory_open_fill .. " "

-- Color palette for the backgrounds of each cell
local colors = {
	"#c7d7e0",
	"#b5cbd2",
	"#9fb5c9",
}

-- Foreground color for the text across the fade
local text_fg = "#16161D"

local process_icons = { -- for get_process function
	["docker"] = wezterm.nerdfonts.linux_docker,
	["docker-compose"] = wezterm.nerdfonts.linux_docker,
	["psql"] = wezterm.nerdfonts.dev_postgresql,
	["kuberlr"] = wezterm.nerdfonts.linux_docker,
	["kubectl"] = wezterm.nerdfonts.linux_docker,
	["stern"] = wezterm.nerdfonts.linux_docker,
	["nvim"] = wezterm.nerdfonts.custom_neovim,
	["make"] = wezterm.nerdfonts.seti_makefile,
	["vim"] = wezterm.nerdfonts.dev_vim,
	["go"] = wezterm.nerdfonts.seti_go,
	["fish"] = wezterm.nerdfonts.dev_terminal,
	["ssh"] = wezterm.nerdfonts.dev_terminal,
	["zsh"] = wezterm.nerdfonts.dev_terminal,
	["bash"] = wezterm.nerdfonts.cod_terminal_bash,
	["btm"] = wezterm.nerdfonts.mdi_chart_donut_variant,
	["htop"] = wezterm.nerdfonts.mdi_chart_donut_variant,
	["cargo"] = wezterm.nerdfonts.dev_rust,
	["sudo"] = wezterm.nerdfonts.fa_hashtag,
	["lazydocker"] = wezterm.nerdfonts.linux_docker,
	["git"] = wezterm.nerdfonts.dev_git,
	["lua"] = wezterm.nerdfonts.seti_lua,
	["wget"] = wezterm.nerdfonts.mdi_arrow_down_box,
	["curl"] = wezterm.nerdfonts.mdi_flattr,
	["gh"] = wezterm.nerdfonts.dev_github_badge,
	["ruby"] = wezterm.nerdfonts.cod_ruby,
	["pwsh"] = wezterm.nerdfonts.seti_powershell,
	["node"] = wezterm.nerdfonts.dev_nodejs_small,
	["dotnet"] = wezterm.nerdfonts.md_language_csharp,
}

local function get_process(pane)
	local fg = pane:get_foreground_process_name() or ""
	local process_name = fg:match("([^/\\]+)%.exe$") or fg:match("([^/\\]+)$")
	local icon = process_icons[process_name] or wezterm.nerdfonts.seti_checkbox_unchecked
	return icon
end

local function push(text, elements, num_cells)
	local cell_no = num_cells + 1
	table.insert(elements, { Foreground = { Color = colors[(cell_no % #colors) + 1] } })
	table.insert(elements, { Text = SOLID_LEFT_ARROW })
	table.insert(elements, { Foreground = { Color = text_fg } })
	table.insert(elements, { Background = { Color = colors[(cell_no % #colors) + 1] } })
	table.insert(elements, { Text = " " .. text .. " " })
end

local function update_right_status(window, pane)
	-- Each element holds the text for a cell in a "powerline" style << fade
	local cells = {}

	table.insert(cells, get_process(pane))

	local cwd_url = pane:get_current_working_dir()
	if cwd_url then
		local cwd = ""
		if type(cwd_url) == "userdata" then
			cwd = cwd_url.file_path
		else
			-- an older version of wezterm, 20230712-072601-f4abf8fd or earlier,
			-- which doesn't have the Url object
			cwd_uri = cwd_uri:sub(8)
			local slash = cwd_uri:find("/")
			if slash then
				cwd = cwd_uri:sub(slash):gsub("%%(%x%x)", function(hex)
					return string.char(tonumber(hex, 16))
				end)
			end
		end
		table.insert(cells, DIR .. cwd)
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

return update_right_status
