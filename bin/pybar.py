#!/usr/bin/python -u

import os  # For user id, home dir
import pwd  # For user name
import time  # For refresh interval
import psutil  # For memory, cpu usage
import platform  # For system info
from datetime import datetime  # For datetime
from datetime import time as dtime  # For time comparison

class Bar():

    def __init__(self, sep=" | ", use_labels=False):
        self.sep = sep
        self.use_labels = use_labels

    """ template
    def build_subsystem_str(self):
        # Set label(s)
        # Get numbers/strings
        # Perform calculations
        # Conditionally colour
        # Build string
        # return built string
    """

    def build_user_str(self):

        # Get user info
        user_id   = os.getuid()
        user_name = pwd.getpwuid(user_id).pw_name

        # Build conditionally coloured string
        if "work" in user_name:
            built_str = Colo.magenta(user_name)
        else:
            built_str = Colo.blue(user_name)

        return built_str

    def build_sys_info_str(self):
        # Set label(s)
        sys_info_label = "OS: "
        if not self.use_labels:
            sys_info_label = ""

        # Get system info
        os_str      = platform.system()
        version_str = platform.release()
        arch_str    = platform.machine()

        # Build string
        sys_info_str = os_str        \
                + ' ' +  version_str \
                + ' ' +  arch_str

        # Conditionally colour
        if "ARCH" in sys_info_str.upper():
            sys_info_str = Colo.blue(sys_info_str)

        return f"{sys_info_label}{sys_info_str}"


    def build_cpu_str(self):
        # Set label(s)
        cpu_label = "CPU: "
        if not self.use_labels:
            cpu_label = ""

        # Get number value
        temp_cpu_num = int(psutil.cpu_percent())

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
        if not self.use_labels:
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
        mem_percent_used = int(mem_info["percent"])

        # Conditionally colour and build string
        if float(mem_percent_used) > 80:
            built_str = Colo.red(f"{mem_percent_used}".zfill(2) + '%')
        if float(mem_percent_used) > 50:
            built_str = Colo.yellow(f"{mem_percent_used}".zfill(2) + '%')
        else:
            built_str = Colo.green(f"{mem_percent_used}".zfill(2) + '%')

        return f"{mem_label}{built_str}"

    def build_datetime_str(self):

        # Declare special days
        weekend_days = [ "SAT", "SUN" ]

        # Get date
        today = datetime.today()
        now   = today.time()
        day   = today.strftime("%a").upper()  # Day of week, short
        weekday_label = day + " : "

        # Conditionally colour and label
        if self.use_labels:
            if day in weekend_days:
                datetime_label = "WKND: "
            elif now > dtime(12) and now < dtime(13):
                datetime_label = "LNCH: "
            elif now > dtime(9) and now < dtime(17):
                datetime_label = "WORK: "
            elif now > dtime(17) and now < dtime(18):
                datetime_label = "DONE: "
            else:
                datetime_label = weekday_label

            # Flit back and forth between label and weekday label
            if int(now.strftime("%s")) % 10 > 5:
                datetime_label = weekday_label

        else:
            datetime_label = ""

        # Build string
        datetime_str = datetime_label + today.strftime("%Y-%m-%d %H:%M:%S")

        return datetime_str

    def build_disk_str(self):
        """ Returns used over available GB for user """
        # Set label
        disk_label = "DSK: "
        if not self.use_labels:
            disk_label = ""

        st = os.statvfs(os.path.expanduser('~'))

        # Get numbers
        used  = (st.f_blocks - st.f_bfree) * st.f_frsize / 1.073741824e9
        total = st.f_blocks * st.f_frsize / 1.073741824e9
        percent_used = used / total * 100

        # Conditionally colour and build string
        if percent_used > 50:
            built_str = Colo.yellow("{:.0f}".format(percent_used) + '%')
        elif percent_used > 80:
            built_str = Colo.red("{:.0f}".format(percent_used) + '%')
        else:
            built_str = Colo.green("{:.0f}".format(percent_used) + '%')

        return f"{disk_label}{built_str}"

    def spacer(self, space_char=' '):
        """ Returns a filler string composed of given space char """
        return space_char * 1024

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

    # Foreground
    RED         = "%{F#FF0000}"
    RED_DARK    = "%{F#800000}"
    YELLOW      = "%{F#FFFF00}"
    YELLOW_DARK = "%{F#808000}"
    GREEN       = "%{F#00FF00}"
    GREEN_DARK  = "%{F#008000}"
    BLUE        = "%{F#00FFFF}"
    BLUE_DARK   = "%{F#008080}"
    ORANGE      = "%{F#FF4500}"
    ORANGE_DARK = "%{F#FF8C00}"
    MAGENTA     = "%{F#FF00FF}"
    END         = "%{F-}"

    # Background
    BLUE_DARK_BG    = "%{B#000010}"
    MAGENTA_BG      = "%{B#FF00FF}"
    END_BG          = "%{B-}"

    def yellow(s):
        return Colo.YELLOW  + s + Colo.END
    def red(s):
        return Colo.RED     + s + Colo.END
    def green(s):
        return Colo.GREEN   + s + Colo.END
    def blue(s):
        return Colo.BLUE    + s + Colo.END
    def orange(s):
        return Colo.ORANGE  + s + Colo.END
    def magenta(s):
        return Colo.MAGENTA + s + Colo.END
    def bg_magenta(s):
        return Colo.MAGENTA_BG + s + Colo.END_BG

def main():

    interval = 1
    bar = Bar(use_labels=True)

    while True:
        bar_left  = bar.wrap([ bar.build_user_str(), bar.build_sys_info_str() ])
        bar_right = bar.wrap([ bar.build_cpu_str(), bar.build_mem_str(), bar.build_disk_str(), bar.build_datetime_str() ])
        bar_full  = bar.left(bar_left) + bar.right(bar_right)

        print(bar_full)
        time.sleep(interval)
main()
