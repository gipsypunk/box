#!/bin/sh
connection=$(pgrep -a wg0$ | head -n 30 | awk '{print $NF }' | cut -d '.' -f 1)

if [ -n "$connection" ]; then
    echo "%{F#dfdfdf}%{u#dfdfdf} "  " $(curl -1 -sf ifconfig.co)"
else 
    echo "%{F#FF2B2B}%{u#FF2B2B} "  " $(curl -1 -sf ifconfig.co)"
fi


