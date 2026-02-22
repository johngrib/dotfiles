sleep 3
dfu-programmer atmega32u4 erase --force
dfu-programmer atmega32u4 flash ./unimap.hex
dfu-programmer atmega32u4 reset
