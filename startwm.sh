#!/bin/sh
if [ -r /etc/profile ]; then
    . /etc/profile
fi
# Close previous RDP sessions
unset DBUS_SESSION_BUS_ADDRESS
# Start Xfce
startxfce4
