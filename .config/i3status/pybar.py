import os
import sys
import time
import psutil
import platform as plat

interval = 1

class Bar():

    # Define defaults
    sep = " | "
    def __init__(self, sep=" | ", labels=False):
        self.sep = sep
        self.labels = labels

    def build_sys_info_str(self):
        sys_info = {}
        sys_info["kernel_name"]     = plat.uname()[0]
        sys_info["os"]              = plat.uname()[2]
        sys_info["arch"]            = plat.uname()[4]

        return    self.sep + sys_info["kernel_name"] \
                + self.sep + sys_info["os"]          \
                + self.sep + sys_info["arch"]

    def build_cpu_str(self):

        cpu_label = "CPU: "
        if not self.labels:
            cpu_label = ""

        return self.sep + cpu_label + str(psutil.cpu_percent())

    def build_mem_str(self):

        mem_label = "MEM: "
        if not self.labels:
            mem_label = ""

        mem_obj = psutil.virtual_memory()

        mem_info = {}
        mem_info["total"]       = mem_obj[0]
        mem_info["available"]   = mem_obj[1]
        mem_info["percent"]     = mem_obj[2]
        mem_info["used"]        = mem_obj[3]
        mem_info["free"]        = mem_obj[4]

        mem_percent_free = "{0:.2f}".format(mem_info["used"] / mem_info["available"] * 100)

        return f"{self.sep}{mem_label}{mem_percent_free}%"

    def print_bar(self):
        return self.build_sys_info_str() + self.build_cpu_str() + self.build_mem_str()

bar = Bar(labels=True)

while True:
    print(bar.print_bar())
    time.sleep(interval)
