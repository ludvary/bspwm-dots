#!/usr/bin/env bash

if eww active-windows | grep -q sysmon; then
    eww close sysmon
else
    eww open sysmon
fi
