require stream, 2.8.8
require iocStats,3.1.16


epicsEnvSet("TOP", "$(E3_CMD_TOP)/..")
epicsEnvSet("STREAM_PROTOCOL_PATH", ".:${TOP}/gconpiApp/Db/")
epicsEnvSet("TTY","$(TTY=/dev/ttyAMA0)")
epicsEnvSet("IOCNAME", "RPI:RAD1")
epicsEnvSet("PORT", "CGONPI")

drvAsynSerialPortConfigure("$(PORT)", "$(TTY)", 0,0,0)
# CR, "\r" , 0x0d.
# LF, "\n" , 0x0a
asynOctetSetInputEos("$(PORT)", 0, "\r\n")
#asynOctetSetOutputEos  "L0", 0, "\r"

# e3-asyn/iocsh
iocshLoad("$(asyn_DIR)/setSerialParams.iocsh", "PORT=$(PORT)")

dbLoadRecords("${TOP}/gconpiApp/Db/gconpi-stream.db", "SYSDEV=$(IOCNAME):,PORT=$(PORT)")

iocshLoad("$(iocStats_DIR)/iocStats.iocsh", "IOCNAME=$(IOCNAME)")



iocInit

dbl > "$(TOP)/${IOCNAME}_PVs.list"


