# -*- coding: utf-8 -*-
# from ctypes import CDLL
from subprocess import check_output, run


class Py3status:
    format = "{time}{switch}"
    cache_timeout = 1
    minsec = 10
    maxsec = 360

    # class Meta:
    #     update_config = {
    #         "update_placeholder_format": [
    #             {
    #                 "placeholder_formats": {"time": ":^3"},
    #                 "format_strings": ["format"],
    #             }
    #         ]
    #     }

    def __init__(self):
        self.load_data = {}
        self.light = True
        self.enable = True
        self.value = "0"
        self.load_data["switch"] = ""
        # self.libIdle = CDLL("/home/marek/.i3/idle/libidle.so")

    def post_config_hook(self):
        self.time = self.py3.storage_get("idlestatus-time")
        if self.time is None:
            self.time = 5

    def idlestatus(self):
        if self.enable:
            # self.libIdle.connect()
            # idlems = self.libIdle.getIdle()
            # self.libIdle.close()
            idlems = int(
                check_output(["/home/marek/.i3/idle/printIdle"]).decode(
                    "ascii"
                )
            )

            delta = self.time - idlems // 1000
            if self.light and delta < 0:
                state = check_output(["acpi"]).decode("ascii")
                if "Discharging" in state:
                    self.light = False
                    self.backlight = check_output(
                        ["xbacklight", "-get"]
                    ).decode("ascii")
                    run(["xbacklight", "-set", self.value])
            elif not self.light and delta > 0:
                self.light = True
                run(["xbacklight", "-set", self.backlight])

            if delta >= 0:
                self.load_data["time"] = delta
            elif "state" in locals() and "Discharging" not in state:
                self.load_data["time"] = "💡"
            else:
                self.load_data["time"] = "#"
            cached_until = self.py3.time_in(self.cache_timeout)
        else:
            self.load_data["time"] = "INF"
            cached_until = self.py3.CACHE_FOREVER

        return {
            "full_text": self.py3.safe_format(self.format, self.load_data),
            "cached_until": cached_until,
        }

    def on_click(self, event):
        button = event["button"]
        if button in (4, 5):
            if button == 5:
                self.time -= 10
            elif button == 4:
                self.time += 10

            if self.time < self.minsec:
                self.time = self.minsec
            if self.time > self.maxsec:
                self.time = self.maxsec

            self.py3.storage_set("idlestatus-time", self.time)
            self.load_data["time"] = self.time

        elif button == 3:
            self.enable = not self.enable
        elif button == 2:
            if self.value == "0":
                self.value = "10"
                self.load_data["switch"] = "🌤"
            else:
                self.value = "0"
                self.load_data["switch"] = ""


if __name__ == "__main__":
    """
    Run module in test mode.
    """
    from py3status.module_test import module_test

    module_test(Py3status)
