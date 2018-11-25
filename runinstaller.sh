linux_host=$(cat /etc/hostname)
echo $linux_host

/u01/app/oracle/product/18.0.0/dbhome_1/runInstaller -ignorePrereq \
 -waitforcompletion -silent \
    -responseFile /u01/app/oracle/product/18.0.0/dbhome_1/install/response/db_install.rsp \
    oracle.install.option=INSTALL_DB_SWONLY \
    ORACLE_HOSTNAME=$linux_host \
    UNIX_GROUP_NAME=oinstall \
    INVENTORY_LOCATION=/u01/app/oraInventory \
    SELECTED_LANGUAGES=en \
    ORACLE_HOME=/u01/app/oracle/product/18.0.0/dbhome_1/ \
    ORACLE_BASE=/u01/app/oracle/ \
    oracle.install.db.InstallEdition=EE \
    oracle.install.db.OSDBA_GROUP=dba \
    oracle.install.db.OSBACKUPDBA_GROUP=dba \
    oracle.install.db.OSDGDBA_GROUP=dba \
    oracle.install.db.OSKMDBA_GROUP=dba \
    oracle.install.db.OSRACDBA_GROUP=dba \
    SECURITY_UPDATES_VIA_MYORACLESUPPORT=false \
    DECLINE_SECURITY_UPDATES=true
