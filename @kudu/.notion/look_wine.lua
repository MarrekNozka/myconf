-- Authors: Rene van Bevern <rvb@pro-linux.de>
-- License: Unknown
-- Last Changed: Unknown
--
-- theme that goes well with the gtk2 default colors
-- it makes use of terminus als artwiz fonts
--
--	By Rene van Bevern <rvb@pro-linux.de>
HL_colour = "#4a6984"
HL_colour = "#AA0011"


if not gr.select_engine("de") then return end

de.reset()

de.defstyle("*", {
    shadow_colour = "#9c9a94",
    highlight_colour = "#ffffff",
    background_colour = "#dedbd6",
    foreground_colour = "#000000",
    padding_pixels = 0,
    highlight_pixels = 1,
    shadow_pixels = 1,
    border_style = "elevated",
--    font = "-*-helvetica-medium-r-normal-*-*-120-*-*-*-*-iso8859-15",
    font = "-*-terminus-medium-r-*--16-*-*-*-*-*-iso10646-1",
    text_align = "center",
})

de.defstyle("frame", {
    based_on = "*",
    shadow_colour = "#9c9a94",
    highlight_colour = "#ffffff",
    padding_colour = "#555555",
    background_colour = "#dedbd6",
    transparent_background = true,
    foreground_colour = "#ffffff",
    padding_pixels = 2,
    highlight_pixels = 1,
    shadow_pixels = 1,
    de.substyle("active", {
        shadow_colour = "#9c9a94",
        highlight_colour = "#ffffff",
        background_colour = "#dedbd6",
        foreground_colour = "#ffffff",
        shadow_colour = HL_colour,
        highlight_colour = HL_colour,
        background_colour = HL_colour,
        foreground_colour = HL_colour,
    }),
})

de.defstyle("frame-ionframe", {
    based_on = "frame",
    border_style = "inlaid",
    padding_pixels = 1,
    spacing = 2,
})

de.defstyle("frame-floatframe", {
    based_on = "frame",
    border_style = "ridge",
    padding_pixels = 1
})


de.defstyle("actnotify", {
    shadow_colour = "#c04040",
    highlight_colour = "#c04040",
    background_colour = "#901010",
    foreground_colour = "#eeeeee",
})

de.defstyle("tab", {
    based_on = "*",
    border_style = "groove",
--    border_style = "inlaid",
--    font = "anorexia",
    font = "-*-terminus-medium-r-*--16-*-*-*-*-*-iso10646-1",
    de.substyle("active-selected", {
        shadow_colour = "#1a3954",
--        highlight_colour = "#7aa9d4",
        highlight_colour = "#888800",
        background_colour = HL_colour,
        foreground_colour = "#ffffff",
    }),
    de.substyle("active-unselected", {
        shadow_colour = "#9c9a94",
        highlight_colour = "#ffffff",
        background_colour = "#dedbd6",
        foreground_colour = "#000000",
    }),
    de.substyle("inactive-selected", {
        shadow_colour = "#9c9a94",
        highlight_colour = "#ffffff",
        background_colour = "#efebe7",
        foreground_colour = "#97979e",
    }),
    de.substyle("inactive-unselected", {
        shadow_colour = "#9c9a94",
        highlight_colour = "#ffffff",
        background_colour = "#dedbd6",
        foreground_colour = "#97979e",
    }),
   de.substyle("*-*-*-tabnumber", {
        background_colour = "black",
        foreground_colour = "green",
    }),

    text_align = "center",
})

de.defstyle("tab-frame", {
    based_on = "tab",
    de.substyle("*-*-*-*-activity", {
        shadow_colour = "#777777",
        highlight_colour = "#eeeeee",
        background_colour = "#991199",
        foreground_colour = "#eeeeee",
    }),
})

de.defstyle("tab-frame-ionframe", {
    based_on = "tab-frame",
    spacing = 3,
})

de.defstyle("tab-menuentry", {
    based_on = "tab",
    highlight_pixels = 1,
    shadow_pixels = 1,
    text_align = "left",
--    font = "fixed",
    font = "-*-terminus-medium-r-*--16-*-*-*-*-*-iso10646-1",
    de.substyle("inactive-selected", {
        shadow_colour = "#1a3954",
--        highlight_colour = "#7aa9d4",
        highlight_colour = "#880000",
        background_colour = HL_colour,
        foreground_colour = "#ffffff",
    }),
    de.substyle("inactive-unselected", {
        shadow_colour = "#9c9a94",
        highlight_colour = "#ffffff",
        background_colour = "#dedbd6",
        foreground_colour = "#000000",
    }),

})

de.defstyle("tab-menuentry-big", {
    based_on = "tab-menuentry",
--    font = "-*-terminus-medium-r-*-*-17-120-*-*-*-*-iso8859-15",
    font = "-*-terminus-medium-r-*--16-*-*-*-*-*-iso10646-1",
})

de.defstyle("input", {
    based_on = "tab",
--    font = "-*-terminus-medium-r-*-*-17-120-*-*-*-*-iso8859-15",
    font = "-*-terminus-medium-r-*--16-*-*-*-*-*-iso10646-1",
    de.substyle("*-cursor", {
        background_colour = "#000000",
        foreground_colour = "#aaaaaa",
    }),
    de.substyle("*-selection", {
        background_colour = "#aaaaaa",
        foreground_colour = "black",
    }),
})

de.defstyle("stdisp", {
--    shadow_pixels = 0,
--    highlight_pixels = 0,
--    text_align = "left",
    font = "-*-terminus-medium-r-*--22-*-*-*-*-*-iso10646-1",
    background_colour = "#444444",
--    foreground_colour = "gray",
    foreground_colour = "yellow",
    
    de.substyle("normal", {
        foreground_colour = "gray",
    }),
    de.substyle("important", {
        foreground_colour = "#00c216",
    }),

    de.substyle("critical", {
        foreground_colour = "#ff1700",
    }),
})

gr.refresh()
