local weztem = require("wezterm")

local fonts = weztem.font_with_fallback({

	{
		family = "Victor Mono",
		harfbuzz_features = { "ss01", "ss03", "ss06", "ss07", "ss08" },
	},
	"FiraCode Nerd Font Mono",
	"Maple Mono NF CN",
})
return fonts
