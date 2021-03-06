#!../../bin/linux-arm/gconpi

## You may have to change gconpi to something else
## everywhere it appears in this file

< envPaths


epicsEnvSet("STREAM_PROTOCOL_PATH", ".:${TOP}/db")
epicsEnvSet("TTY","$(TTY=/dev/ttyAMA0)")


cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/gconpi.dbd"
gconpi_registerRecordDeviceDriver pdbbase

## Load record instances
#dbLoadRecords("db/xxx.db","user=jhleeHost")

#dbLoadRecords("db/iocAdminSoft.db", "IOC=RPI:IOC")

drvAsynSerialPortConfigure("CGONPI", "$(TTY)", 0,0,0)
# CR, "\r" , 0x0d.
# LF, "\n" , 0x0a

asynOctetSetInputEos("CGONPI", 0, "\r\n")
#asynOctetSetOutputEos  "L0", 0, "\r"

asynSetOption("CGONPI", -1, "baud", "9600")
asynSetOption("CGONPI", -1, "bits", "8")
asynSetOption("CGONPI", -1, "parity", "none")
asynSetOption("CGONPI", -1, "stop", "1")
asynSetOption("CGONPI", -1, "clocal", "Y")
asynSetOption("CGONPI", -1, "crtscts", "N")

dbLoadRecords("db/gconpi-stream.db", "SYSDEV=RPI:RAD1:,PORT=CGONPI")




cd "${TOP}/iocBoot/${IOC}"

iocInit

dbl > "$(TOP)/${IOC}_PVs.list"
