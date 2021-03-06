gconpi (Geiger Counter on Pi)
===

### Working Environment or Requirements

* EPICS 3.14.12.5
* ASYN-4-26
* STREAM-2-6a
* devIocStats 3.1.13 or https://github.com/jeonghanlee/iocStats (one can have one more PV - temperture monitoring of thermal zone 0) 
* Raspberry Pi 2
* mightyohm.com Geiger Counter v1.0



### Data Structure 

* In order to see the data quickly, 

```bash 
cat < /dev/ttyAMA0
```


* The serial connection from pi through minicom (need some tuning for options), 

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

### Simulator
* For a simple simulator in order to see how this IOC works, one can use Kameleon as a simulated geiger counter and st.cmd.kameleon.
  https://bitbucket.org/europeanspallationsource/kameleon

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

### Photo
![Connection Example](pi_and_gc.png)

### References
* http://mightyohm.com/blog/2012/02/tutorial-geiger-counter-data-logging/#more-4695
* http://epics.web.psi.ch/software/streamdevice/doc/tipsandtricks.html#multiline
* https://wiki-ext.aps.anl.gov/epics/index.php/Main_Page


### Pi setup 
* If one may enable the serial console, the group id will be tty instead of dialout. Even if root, the connection is disconnected after few seconds. So please turn off this option via rasp-config

### e3
One needs to setup ESS EPICS Environment https://github.com/icshwi/e3

```
sudo /epics/base-7.0.3/require/3.1.1/bin/iocsh.bash e3/st.cmd
```

### StripTool

```
cd opi
sh plot.sh
```

### License
* https://www.gnu.org/licenses/gpl-2.0.txt 
