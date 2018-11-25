sh /home/git_scripts/sw18cyum.sh

#may select wget method
#chmod +x /home/git_scripts/wget18c_12102018.sh

#transfer file method
mv /home/LINUX.X64_180000_db_home.zip /home/oracle/
chown oracle:oinstall /home/oracle/LINUX.X64_180000_db_home.zip
unzip /home/oracle/LINUX.X64_180000_db_home.zip -d /u01/app/oracle/product/18.0.0/dbhome_1/
chown -R oracle:oinstall /u01/app/oracle/product/18.0.0/dbhome_1/
chmod 775 /u01/app/oracle/product/18.0.0/dbhome_1/runInstaller
