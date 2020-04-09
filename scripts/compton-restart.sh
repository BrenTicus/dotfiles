#!/bin/bash

pkill -f "compton -b"
compton -b --config ~/.config/compton.conf
