#!/usr/bin/python -u

import os
import sys
import time
import psutil
import math
import platform as plat
from datetime import datetime
from datetime import time as dtime
from termcolor import colored as colo

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
        # Set label(s)
        sys_info_label = "OS: "
        if not self.labels:
            sys_info_label = ""

        # Get numbers/strings
        sys_info = {}
        sys_info["kernel_name"]     = plat.uname()[0]
        sys_info["os"]              = plat.uname()[2]
        sys_info["arch"]            = plat.uname()[4]

        # Build and return string
        return sys_info["kernel_name"]      \
                + ' ' +  sys_info["os"]     \
                + ' ' +  sys_info["arch"]

    def build_cpu_str(self):
        # Set label(s)
        cpu_label = "CPU: "
        if not self.labels:
            cpu_label = ""

        # Get number value
        temp_cpu_num = math.floor(psutil.cpu_percent())

        # Conditionally colour, build string
        if temp_cpu_num > 80:
            built_str = Colo.red(f"{temp_cpu_num}".zfill(2) + '%')
        elif temp_cpu_num > 50:
            built_str = Colo.yellow(f"{temp_cpu_num}".zfill(2) + '%')
        else:
            built_str = Colo.green(f"{temp_cpu_num}".zfill(2) + '%')

        # Return built string
        return f"{cpu_label}{built_str}"

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
        mem_percent_used = math.floor(mem_info["percent"])

        # TODO all colos
        # Conditionally colour and build string
        if float(mem_percent_used) > 80:
            built_str = Colo.red(f"{mem_percent_used}%")
        if float(mem_percent_used) > 50:
            built_str = Colo.yellow(f"{mem_percent_used}%")
        else:
            built_str = Colo.green(f"{mem_percent_used}%")

        return f"{mem_label}{built_str}"

    def build_datetime_str(self):

        # Get date
        today = datetime.today()

        # Conditionally colour and label
        # TODO account for weekends
        now = today.time()
        if self.labels:
            if now > dtime(12) and now < dtime(13):
                datetime_label = "LNCH: "
            elif now > dtime(9) and now < dtime(17):
                datetime_label = "WORK: "
            elif now > dtime(17) and now < dtime(18):
                datetime_label = "DONE: "
            else:
                datetime_label = ""


        # Build string
        datetime_str = datetime_label + today.strftime("%Y-%m-%d %H:%M:%S")

        return datetime_str

    def build_disk_str(self):
        """ Returns used over available GB for user """
        # Set label
        disk_label = "DSK: "
        if not self.labels:
            disk_label = ""

        st = os.statvfs(os.path.expanduser('~'))

        # Get numbers
        used  = (st.f_blocks - st.f_bfree) * st.f_frsize / 1.073741824e9
        total = st.f_blocks * st.f_frsize / 1.073741824e9

        # Conditionally colour and build string
        # TODO get % and add colo
        used_str = "{:.1f}".format(used)
        total_str = "{:.1f}".format(total)
        percent_used = used / total * 100

        if percent_used > 50:
            built_str = Colo.yellow(f"{used_str}/{total_str}")
        elif percent_used > 80:
            built_str = Colo.red(f"{used_str}/{total_str}")
        else:
            built_str = Colo.green(f"{used_str}/{total_str}")

        return f"{disk_label}{built_str}"

    def wrap(self, s):
        """ Returns given string, wrapped in separators """
        wrapped = ""
        # If list, don't double up on separators
        if type(s) is list:
            for i, ss in enumerate(s):
                if i == 0: wrapped += self.sep
                wrapped += f"{ss}{self.sep}"
        # If str, just return it wrapped
        else:
            wrapped = f"{self.sep}{s}{self.sep}"

        return wrapped

    def right(self, s):
        """ Returns given string, encoded to align right """
        return "%{r}" + s

    def left(self, s):
        """ Returns given string, encoded to align left """
        return "%{l}" + s

    def get_all(self):
        """ Return full bar with separators """
        return self.sep + self.build_sys_info_str() \
             + self.sep + self.build_cpu_str()      \
             + self.sep + self.build_mem_str()      \
             + self.sep

class Colo():
    """ rgb colour helper """

    RED     = "%{F#FF0000}"
    YELLOW  = "%{F#FFFF00}"
    GREEN   = "%{F#00FF00}"
    END     = "%{F-}"

    def yellow(s):
        return Colo.YELLOW + s + Colo.END
    def red(s):
        return Colo.RED + s + Colo.END
    def green(s):
        return Colo.GREEN + s + Colo.END

def main():

    interval = 1
    bar = Bar(labels=True)

    while True:
        bar_left  = bar.wrap(bar.build_sys_info_str())
        bar_right = bar.wrap([ bar.build_cpu_str(), bar.build_mem_str(), bar.build_disk_str(), bar.build_datetime_str() ])
        bar_full  = bar.left(bar_left) + bar.right(bar_right)

        print(bar_full)
        time.sleep(interval)
main()
