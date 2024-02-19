import subprocess 
import os

bright_min = .1;
bright_max = 1;

brightness = subprocess.run(["xrandr --verbose --current | grep ^\"DP-1\" -A5 | tail -n1"], shell=True, capture_output=True, text=True)
brightness = brightness.stdout.split(" ")[-1].strip()

brightness = float(brightness) -.1;

if(brightness < bright_min):
    brightness = bright_max;

dis_bright = str(round(brightness,2))

brightness_set = subprocess.run([f"xrandr --output DP-1 --brightness {brightness}"], shell=True, capture_output=True, text=True)
print(f"Bright: {dis_bright}")

