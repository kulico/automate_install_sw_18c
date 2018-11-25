sh /u01/app/oraInventory/orainstRoot.sh
sh /u01/app/oracle/product/18.0.0/dbhome_1/root.sh

mv /home/git_scripts/dbora.sh /etc/init.d/
chmod 750 /etc/init.d/dbora.sh
chown root:dba /etc/init.d/dbora.sh
chkconfig --add dbora.sh
chkconfig dbora.sh on

