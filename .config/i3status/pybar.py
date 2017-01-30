#!/usr/bin/python -u

import os
import sys
import time
import psutil
import platform as plat
from termcolor import colored as colo

interval = 1

class Bar():

    # Define defaults
    sep = " | "
    def __init__(self, sep=" | ", labels=False):
        self.sep = sep
        self.labels = labels

    """ template
    def build_subsystem_str(self):
        # Set label(s)
        # Get numbers/strings
        # Perform calculations
        # Conditionally colour
        # Build string
        # return built string
    """

    def build_sys_info_str(self):
        sys_info_label = "OS: "
        if not self.labels:
            sys_info_label = ""

        sys_info = {}
        sys_info["kernel_name"]     = plat.uname()[0]
        sys_info["os"]              = plat.uname()[2]
        sys_info["arch"]            = plat.uname()[4]

        return sys_info["kernel_name"]      \
                + ' ' +  sys_info["os"]     \
                + ' ' +  sys_info["arch"]

    def build_cpu_str(self):

        cpu_label = "CPU: "
        if not self.labels:
            cpu_label = ""

        return cpu_label + str(psutil.cpu_percent())

    def build_mem_str(self):

        # Set label
        mem_label = "MEM: "
        if not self.labels:
            mem_label = ""

        # Get numbers
        mem_obj = psutil.virtual_memory()

        mem_info = {}
        mem_info["total"]       = mem_obj[0]
        mem_info["available"]   = mem_obj[1]
        mem_info["percent"]     = mem_obj[2]
        mem_info["used"]        = mem_obj[3]
        mem_info["free"]        = mem_obj[4]

        # Perform calculation
        mem_percent_used = "{0:.2f}".format(mem_info["used"] / mem_info["available"] * 100)

        # Conditionally colour
        if float(mem_percent_used) < 20:
            built_str = Colo.yellow(f"{mem_label}{mem_percent_used}%")
        else:
            built_str = f"{mem_label}{mem_percent_used}%"

        return built_str

    def print_bar(self):
        return self.sep + self.build_sys_info_str() \
             + self.sep + self.build_cpu_str()      \
             + self.sep + self.build_mem_str()      \
             + self.sep

class Colo():
    """ rgb colour helper """

    YELLOW  = "%{F#FFEDBF08}"
    END     = "%{F-}"

    def yellow(s):
        return Colo.YELLOW + s + Colo.END

def main():
    bar = Bar(labels=True)

    while True:
        print(bar.print_bar())
        time.sleep(interval)
main()
