#!/bin/bash

g++ -O2 -march=native -pipe -flto -s -o my_fan_speed_daemon fan_speed_improved.cpp
chmod +x ./my_fan_speed_daemon
sudo cp ./my_fan_speed_daemon /usr/local/bin
sudo systemctl stop blow_hot_wind.service
sudo systemctl daemon-reload
sudo systemctl start blow_hot_wind.service

