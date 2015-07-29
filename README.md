gconpi

### Working Environment or Requirements

* EPICS 3.14.12.5
* ASYN-4-26
* STREAM-2-6a
* Raspberry Pi 2
* mightyohm.com Geiger Counter v1.0



### Data Structure 

The serial connection from pi through minicom, 

```bash
minicom -b 9600 -o -D /dev/ttyAMA0
```
it returns the following data without asking or reading anything...
```
mightyohm.com Geiger Counter 1.00
http://mightyohm.com/geiger
CPS, 2, CPM, 2, uSv/hr, 0.01, SLOW
CPS, 0, CPM, 2, uSv/hr, 0.01, SLOW
CPS, 0, CPM, 2, uSv/hr, 0.01, SLOW
CPS, 0, CPM, 2, uSv/hr, 0.01, SLOW
CPS, 1, CPM, 3, uSv/hr, 0.01, SLOW
```
The first two lines comes from the Geiger Counter when the power switch is on always. So it must be the invalid data when one try to read in EPICS IOC.

### Pin Connection

#### Serial Connection
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
#### Power Connection

The MightyOhm Geiger Counter works with two 1.5 AAA batteries, but it would be nice to use the external power from the Raspberry Pi instead of these batteries. I've found the same approach in the following website : 
http://mihalysprojects.weebly.com/blog/switching-serial-lines-and-lower-currents-driving-the-mightyohm-geiger-counter-from-the-raspberry-pi


```
Geiger Counter                      Raspberry Pi
+3V battery pack                    Pin Array
Connection 

Battery +3V       ---------------   3.3 V PIN 1
```


### References
* http://mightyohm.com/blog/2012/02/tutorial-geiger-counter-data-logging/#more-4695
* http://epics.web.psi.ch/software/streamdevice/doc/tipsandtricks.html#multiline
* https://wiki-ext.aps.anl.gov/epics/index.php/Main_Page


### License
* http://www.aps.anl.gov/epics/license/open.php
