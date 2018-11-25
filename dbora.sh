#!/bin/bash
#
# Change the value of ORACLE_HOME to specify the correct Oracle home
# directory for your installation.

# chkconfig: 345 99 01
# description: some startup script

ORACLE_HOME=/u01/app/oracle/product/18.0.0/dbhome_1
#
# Change the value of ORACLE to the login name of the
# oracle owner at your site.
#
ORACLE=oracle

PATH=${PATH}:$ORACLE_HOME/bin
export ORACLE_HOME PATH
#
case $1 in
'start')
su $ORACLE -c "$ORACLE_HOME/bin/dbstart $ORACLE_HOME &"
;;
'stop')
su $ORACLE -c "$ORACLE_HOME/bin/dbshut $ORACLE_HOME &"
;;
*)
echo "usage: $0 {start|stop}"
exit
;;
esac
#
Exit
