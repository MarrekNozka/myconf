# -*- coding: utf-8 -*-
"""
Example module that says 'Hello World!'

This demonstrates how to produce a simple custom module.
"""


class Py3status:
    graph_chars = " ▁▃▄▅▆▇█"
    format = (
        "{graph}{bar} [\\?color=cpu_idle {cpu_idle}%] /"
        "[\\?color=cpu_user_sys {cpu_user_sys}%]"
    )
    color = "#FFFFFF"
    thresholds = [
        (0, "#9dd7fb"),
        (20, "good"),
        (40, "degraded"),
        (60, "#ffa500"),
        (80, "bad"),
    ]
    cache_timeout = 1

    class Meta:
        update_config = {
            "update_placeholder_format": [
                {
                    "placeholder_formats": {
                        "cpu_idle": ":2.0f",
                        "cpu_user_sys": ":2.0f",
                    },
                    "format_strings": ["format"],
                }
            ]
        }

    def __init__(self):
        self.stat = None
        self.graph = 6 * " "

    def post_config_hook(self):
        self.load_data = {}
        self.thresholds_init = self.py3.get_color_names_list(self.format)

    def cpugraph(self):
        with open("/proc/stat", "r") as fstat:
            stat_list = fstat.readline().split()
        stat_list = tuple(map(int, stat_list[1:]))
        stat_old = self.stat
        if stat_old is None:
            stat_old = stat_list
        self.stat = stat_list

        stat_delta = []
        for i, n in enumerate(stat_list):
            stat_delta.append(n - stat_old[i])

        usr, nice, sys, idle, iowait, irq, soft, steal, guest, gnice = (
            stat_delta
        )
        total = sum(stat_delta)
        if total == 0:
            total = 10000
        cpu_user_sys = (usr + sys) / total * 100
        cpu_idle = 100 - idle / total * 100

        bar = self.graph_chars[int(cpu_idle * 7.99 / 100)]
        self.graph = self.graph[1:] + bar

        # self.load_data["cpu_user_sys"] = "{:2.0f}".format(cpu_user_sys)
        # self.load_data["cpu_idle"] = "{:2.0f}".format(cpu_idle)
        self.load_data["cpu_user_sys"] = cpu_user_sys
        self.load_data["cpu_idle"] = cpu_idle
        self.load_data["bar"] = bar
        self.load_data["graph"] = self.graph

        # if cpu_idle > 3:
        #     color = "#ff0000"
        # else:
        #     color = self.color
        for x in self.thresholds_init:
            if x in self.load_data:
                self.py3.threshold_get_color(self.load_data[x], x)

        return {
            "full_text": self.py3.safe_format(self.format, self.load_data),
            "cached_until": self.py3.time_in(self.cache_timeout),
            # "color": color,
        }


if __name__ == "__main__":
    """
    Run module in test mode.
    """
    from py3status.module_test import module_test

    module_test(Py3status)
