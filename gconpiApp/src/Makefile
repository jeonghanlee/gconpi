TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = gconpi
# gconpi.dbd will be created and installed
DBD += gconpi.dbd

# gconpi.dbd will be made up from these files:
gconpi_DBD += base.dbd

# Include dbd files from all support applications:
#gconpi_DBD += xxx.dbd
gconpi_DBD += devIocStats.dbd
gconpi_DBD += stream.dbd
gconpi_DBD += asyn.dbd
gconpi_DBD += drvAsynSerialPort.dbd

# Add all the support libraries needed by this IOC
#gconpi_LIBS += xxx
gconpi_LIBS += stream asyn
gconpi_LIBS += devIocStats


# gconpi_registerRecordDeviceDriver.cpp derives from gconpi.dbd
gconpi_SRCS += gconpi_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
gconpi_SRCS_DEFAULT += gconpiMain.cpp
gconpi_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#gconpi_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
gconpi_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

