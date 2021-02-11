#!/bin/bash

HDMI_STATUS=$(</sys/class/drm/card0/card0-HDMI-A-1/status)

if [[ $HDMI_STATUS == "connected" ]]
then	
	pactl set-sink-mute alsa_output.pci-0000_00_1b.0.hdmi-stereo toggle
else	
	pactl set-sink-mute alsa_output.pci-0000_00_1b.0.analog-stereo toggle
fi
