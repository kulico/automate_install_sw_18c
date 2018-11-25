linux_host=$(cat /etc/hostname)
sh /home/oracle/scripts/count_db_name.sh
count=$(cat /home/oracle/scripts/count_db_name.txt)
db_name=jelly$count
echo $db_name

/u01/app/oracle/product/18.0.0/dbhome_1/bin/dbca -silent -createDatabase -templateName /u01/app/oracle/product/18.0.0/dbhome_1/assistants/dbca/templates/General_Purpose.dbc -gdbName $db_name -sid $db_name -characterSet AL32UTF8 -SysPassword welcome1 -SystemPassword welcome1 -createAsContainerDatabase false -emConfiguration NONE -memoryPercentage 40 -ignorePreReqs

echo "
$db_name:/u01/app/oracle/product/18.0.0/dbhome_1:Y" >> /etc/oratab

cat > /home/oracle/scripts/setEnv$db_name.sh <<EOF
# Oracle Settings
export TMP=/tmp
export TMPDIR=\$TMP

linux_host=$(cat /etc/hostname)
echo $linux_host

count=$(cat /home/oracle/scripts/count_db_name.txt)
db_name=jelly$count
echo $db_name

export ORACLE_HOSTNAME=$linux_host
export ORACLE_UNQNAME=$db_name
export ORACLE_BASE=/u01/app/oracle
export ORACLE_HOME=\$ORACLE_BASE/product/18.0.0/dbhome_1
export ORA_INVENTORY=/u01/app/oraInventory
export ORACLE_SID=$db_name
export PDB_NAME=pdb1
export DATA_DIR=/u02/data

export PATH=/usr/sbin:/usr/local/bin:\$PATH
export PATH=\$ORACLE_HOME/bin:\$PATH

export LD_LIBRARY_PATH=\$ORACLE_HOME/lib:/lib:/usr/lib
export CLASSPATH=\$ORACLE_HOME/jlib:\$ORACLE_HOME/rdbms/jlib
EOF

echo ". /home/oracle/scripts/setEnv$db_name.sh" >> /home/oracle/.bash_profile


cat > /home/oracle/scripts/start_lsnrctl.sh <<EOF
#!/bin/bash

count=$(cat /home/oracle/scripts/count_db_name.txt)
db_name=jelly$count
echo $db_name

export ORACLE_SID=$db_name
export ORACLE_HOME=/u01/app/oracle/product/18.0.0/dbhome_1/
/u01/app/oracle/product/18.0.0/dbhome_1/bin/lsnrctl start
EOF

chmod u+x /home/oracle/scripts/*