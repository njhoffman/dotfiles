#!/bin/bash

# pkill -x conky
pkill -x conky
sleep 1
conky -c $HOME/.conky/.conkyrc
