# gconpi


## Pin Connection

### Serial Connection
```
Geiger Counter                      Raspberry Pi
Serial Pin Array                    Pin Array 

Green  6  
Yellow 5  - TxD   ---------------   RxD PIN 10 
Orange 4  - RxD   ---------------   TxD PIN  8
Red    3
Brown  2  - GND
Black  1  - GND   ---------------   GND PIN  6
```
### Power Connection

The MightyOhm Geiger Counter works with two 1.5 AAA batteries, but it would be nice not to use the external power from the Raspberry Pi instead of these batteries. I've found the same approach in the following website : 
http://mihalysprojects.weebly.com/blog/switching-serial-lines-and-lower-currents-driving-the-mightyohm-geiger-counter-from-the-raspberry-pi


```
Geiger Counter                      Raspberry Pi
+3V battery pack                    Pin Array
Connection 

Battery +3V       ---------------   3.3 V PIN 1
```
