-- Tento soubor byl vytvořen /usr/bin/notionem. Neupravujte jej.
return {
    [1] = {
        ["type"] = "WScreen",
        ["name"] = "WScreen<1>",
        ["managed"] = {
            [1] = {
                ["type"] = "WGroupWS",
                ["name"] = "WGroupWS<1>",
                ["geom"] = {
                    ["y"] = 0,
                    ["x"] = 0,
                    ["w"] = 1280,
                    ["h"] = 1024,
                },
                ["switchto"] = true,
                ["sizepolicy"] = "full",
                ["managed"] = {
                    [1] = {
                        ["type"] = "WTiling",
                        ["name"] = "WTiling<1>",
                        ["bottom"] = true,
                        ["level"] = 0,
                        ["sizepolicy"] = "full",
                        ["geom"] = {
                            ["y"] = 0,
                            ["x"] = 0,
                            ["w"] = 1280,
                            ["h"] = 1024,
                        },
                        ["split_tree"] = {
                            ["tls"] = 640,
                            ["tl"] = {
                                ["regparams"] = {
                                    ["mode"] = 1,
                                    ["type"] = "WFrame",
                                    ["name"] = "Notion WFrame<2>",
                                    ["managed"] = {
                                    },
                                },
                                ["type"] = "WSplitRegion",
                            },
                            ["dir"] = "horizontal",
                            ["brs"] = 640,
                            ["br"] = {
                                ["regparams"] = {
                                    ["mode"] = 1,
                                    ["type"] = "WFrame",
                                    ["name"] = "Notion WFrame<3>",
                                    ["managed"] = {
                                    },
                                },
                                ["type"] = "WSplitRegion",
                            },
                            ["type"] = "WSplitSplit",
                        },
                    },
                },
                ["level"] = 0,
            },
            [2] = {
                ["type"] = "WGroupWS",
                ["sizepolicy"] = "full",
                ["managed"] = {
                    [1] = {
                        ["geom"] = {
                            ["y"] = 272,
                            ["x"] = 320,
                            ["w"] = 640,
                            ["h"] = 480,
                        },
                        ["type"] = "WFrame",
                        ["name"] = "*scratchpad*<1>",
                        ["bottom"] = true,
                        ["level"] = 1025,
                        ["mode"] = 0,
                        ["managed"] = {
                        },
                        ["sizepolicy"] = "free_glue",
                    },
                },
                ["unnumbered"] = true,
                ["name"] = "*scratchws*<1>",
                ["pseudomodal"] = true,
                ["level"] = 1,
                ["geom"] = {
                    ["y"] = 0,
                    ["x"] = 0,
                    ["w"] = 1280,
                    ["h"] = 1024,
                },
                ["hidden"] = true,
            },
        },
    },
    [0] = {
        ["type"] = "WScreen",
        ["name"] = "WScreen",
        ["managed"] = {
            [1] = {
                ["type"] = "WGroupWS",
                ["name"] = "WGroupWS",
                ["geom"] = {
                    ["y"] = 0,
                    ["x"] = 0,
                    ["w"] = 1024,
                    ["h"] = 768,
                },
                ["switchto"] = true,
                ["sizepolicy"] = "full",
                ["managed"] = {
                    [1] = {
                        ["type"] = "WTiling",
                        ["name"] = "WTiling",
                        ["bottom"] = true,
                        ["level"] = 0,
                        ["sizepolicy"] = "full",
                        ["geom"] = {
                            ["y"] = 0,
                            ["x"] = 0,
                            ["w"] = 1024,
                            ["h"] = 768,
                        },
                        ["split_tree"] = {
                            ["tls"] = 512,
                            ["tl"] = {
                                ["tls"] = 18,
                                ["tl"] = {
                                    ["type"] = "WSplitST",
                                },
                                ["dir"] = "vertical",
                                ["brs"] = 750,
                                ["br"] = {
                                    ["regparams"] = {
                                        ["mode"] = 1,
                                        ["type"] = "WFrame",
                                        ["name"] = "Notion WFrame",
                                        ["managed"] = {
                                        },
                                    },
                                    ["type"] = "WSplitRegion",
                                },
                                ["type"] = "WSplitSplit",
                            },
                            ["dir"] = "horizontal",
                            ["brs"] = 512,
                            ["br"] = {
                                ["regparams"] = {
                                    ["mode"] = 1,
                                    ["type"] = "WFrame",
                                    ["name"] = "Notion WFrame<1>",
                                    ["managed"] = {
                                    },
                                },
                                ["type"] = "WSplitRegion",
                            },
                            ["type"] = "WSplitSplit",
                        },
                    },
                },
                ["level"] = 0,
            },
            [2] = {
                ["type"] = "WGroupWS",
                ["sizepolicy"] = "full",
                ["managed"] = {
                    [1] = {
                        ["geom"] = {
                            ["y"] = 144,
                            ["x"] = 192,
                            ["w"] = 640,
                            ["h"] = 480,
                        },
                        ["type"] = "WFrame",
                        ["name"] = "*scratchpad*",
                        ["bottom"] = true,
                        ["level"] = 1025,
                        ["mode"] = 0,
                        ["managed"] = {
                        },
                        ["sizepolicy"] = "free_glue",
                    },
                },
                ["unnumbered"] = true,
                ["name"] = "*scratchws*",
                ["pseudomodal"] = true,
                ["level"] = 1,
                ["geom"] = {
                    ["y"] = 0,
                    ["x"] = 0,
                    ["w"] = 1024,
                    ["h"] = 768,
                },
                ["hidden"] = true,
            },
        },
    },
}

