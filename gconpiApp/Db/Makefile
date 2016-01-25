TOP=../..
include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE

#----------------------------------------------------
#  Optimization of db files using dbst (DEFAULT: NO)
#DB_OPT = YES

#----------------------------------------------------
# Create and install (or just install) into <top>/db
# databases, templates, substitutions like this
#DB += xxx.db

DB += gconpi-stream.db
DB_INSTALLS += $(TOP)/gconpiApp/Db/gconpi.proto
DB_INSTALLS += $(devIocStats)/db/access.db
DB_INSTALLS += $(devIocStats)/db/iocGeneralTime.db
DB_INSTALLS += $(devIocStats)/db/iocScanMonSum.db
DB_INSTALLS += $(devIocStats)/db/iocCluster.db
DB_INSTALLS += $(devIocStats)/db/iocAdminScanMon.db
DB_INSTALLS += $(devIocStats)/db/ioc.db
DB_INSTALLS += $(devIocStats)/db/iocAdminSoft.db
DB_INSTALLS += $(devIocStats)/db/iocEnvVar.db
DB_INSTALLS += $(devIocStats)/db/iocScanMon.db


#----------------------------------------------------
# If <anyname>.db template is not named <anyname>*.template add
# <anyname>_template = <templatename>

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

