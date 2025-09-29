local wezterm = require("wezterm")

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
	["pacman"] = wezterm.nerdfonts.dev_archlinux,
	["paru"] = wezterm.nerdfonts.dev_archlinux,
	["yazi"] = wezterm.nerdfonts.cod_folder_opened,
	["flatpak"] = " ",
}

local function get_process_icon(foreground_process_name)
	if foreground_process_name == nil then
		return ""
	end

	local process_name = foreground_process_name:match("([^/\\]+)%.exe$") or foreground_process_name:match("([^/\\]+)$")
	-- local icon = process_icons[process_name] or wezterm.nerdfonts.seti_checkbox_unchecked
	local icon = process_icons[process_name] or wezterm.nerdfonts.linux_archlinux
	return icon
end

return get_process_icon
