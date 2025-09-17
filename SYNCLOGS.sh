#!/bin/bash

#This syncs all the logs from all the machines and posts the information to the Kibana dashboard via the ELK stack.


#------------------------Appserver Logs-------------------------------------------------------
#while((1)) ; do

      #Syncing the reporthash file directory with the nginx server directory
      #rsync -az --delete /home/omrapp/Desktop/reporthash/ /usr/share/OmrUserFileDownload/
      
      #Syncing the the various logs from the server
      rsync -az omrapp@10.21.227.173:/var/log/omr /var/OPEN_MALWARE_RESEARCH_COMBINED_SYSTEMLOGS/APP_SERVER
      rsync -az omrapp@10.21.227.173:/var/log/appserverlogs /var/OPEN_MALWARE_RESEARCH_COMBINED_SYSTEMLOGS/APP_SERVER
      rsync -az omrapp@10.21.227.173:/var/log/nginx /var/OPEN_MALWARE_RESEARCH_COMBINED_SYSTEMLOGS/APP_SERVER
      rsync -az omrapp@10.21.227.173:/var/log/gunicorn /var/OPEN_MALWARE_RESEARCH_COMBINED_SYSTEMLOGS/APP_SERVER

      #adding machine based logs below for the System, Authentication and Kernel
      rsync -az omrapp@10.21.227.173:/var/log/syslog /var/OPEN_MALWARE_RESEARCH_COMBINED_MACHINELOGS/APP_SERVER
      rsync -az omrapp@10.21.227.173:/var/log/auth.log /var/OPEN_MALWARE_RESEARCH_COMBINED_MACHINELOGS/APP_SERVER
      rsync -az omrapp@10.21.227.173:/var/log/kern.log /var/OPEN_MALWARE_RESEARCH_COMBINED_MACHINELOGS/APP_SERVER

printf "Synced AppServer Logs \n"
#------------------------PostgreSQL Logs-------------------------------------------------------

      #Syncing the various logs from the server.
      rsync -az omrutil@10.21.238.137:/var/log/postgresql /var/OPEN_MALWARE_RESEARCH_COMBINED_SYSTEMLOGS/POSTGRESQL_DB

      #Adding machine based logs below for the System, Authentication and Kernel
      rsync -az omrutil@10.21.238.137:/var/log/syslog /var/OPEN_MALWARE_RESEARCH_COMBINED_MACHINELOGS/POSTGRESQL_DB
      rsync -az omrutil@10.21.238.137:/var/log/auth.log /var/OPEN_MALWARE_RESEARCH_COMBINED_MACHINELOGS/POSTGRESQL_DB
      rsync -az omrutil@10.21.238.137:/var/log/kern.log /var/OPEN_MALWARE_RESEARCH_COMBINED_MACHINELOGS/POSTGRESQL_DB

printf "Synced PostgreSQL Logs \n"

#------------------------NFS Logs-------------------------------------------------------
      #Syncing the various logs from the server.
      rsync -aze 'ssh -A -J omrapp@10.21.227.173' omrftp@192.168.5.1:/var/log/rabbitmq /var/OPEN_MALWARE_RESEARCH_COMBINED_SYSTEMLOGS/NFS_SERVER

      #Adding machine based logs below for the System, Authentication and Kernel
      rsync -aze 'ssh -A -J omrapp@10.21.227.173' omrftp@192.168.5.1:/var/log/syslog /var/OPEN_MALWARE_RESEARCH_COMBINED_MACHINELOGS/NFS_SERVER
      rsync -aze 'ssh -A -J omrapp@10.21.227.173' omrftp@192.168.5.1:/var/log/auth.log /var/OPEN_MALWARE_RESEARCH_COMBINED_MACHINELOGS/NFS_SERVER
      rsync -aze 'ssh -A -J omrapp@10.21.227.173' omrftp@192.168.5.1:/var/log/kern.log /var/OPEN_MALWARE_RESEARCH_COMBINED_MACHINELOGS/NFS_SERVER

printf "Synced NFS Logs \n"

#------------------------Gateway2 Logs-------------------------------------------------------
      #Syncing the various logs from the server.
      rsync -aze 'ssh -A -J omrapp@10.21.227.173,omrftp@192.168.5.1' omr@192.168.5.254:/var/log/omr /var/OPEN_MALWARE_RESEARCH_COMBINED_SYSTEMLOGS/GATEWAY2

      #Adding machine based logs below for the System, Authentication and Kernel
      rsync -aze 'ssh -A -J omrapp@10.21.227.173,omrftp@192.168.5.1' omr@192.168.5.254:/var/log/syslog /var/OPEN_MALWARE_RESEARCH_COMBINED_SYSTEMLOGS/GATEWAY2
      rsync -aze 'ssh -A -J omrapp@10.21.227.173,omrftp@192.168.5.1' omr@192.168.5.254:/var/log/auth.log /var/OPEN_MALWARE_RESEARCH_COMBINED_SYSTEMLOGS/GATEWAY2
      rsync -aze 'ssh -A -J omrapp@10.21.227.173,omrftp@192.168.5.1' omr@192.168.5.254:/var/log/kern.log /var/OPEN_MALWARE_RESEARCH_COMBINED_SYSTEMLOGS/GATEWAY2
      

printf "Synced Gateway2 Logs \n"

#------------------------ELK_VM Logs-------------------------------------------------------

      #Syncing the various logs from the server.
      rsync -az /var/log/logstash /var/OPEN_MALWARE_RESEARCH_COMBINED_SYSTEMLOGS/ELK_VM
      rsync -az /var/log/elasticsearch /var/OPEN_MALWARE_RESEARCH_COMBINED_SYSTEMLOGS/ELK_VM
      rsync -az /var/log/filebeat /var/OPEN_MALWARE_RESEARCH_COMBINED_SYSTEMLOGS/ELK_VM

      #Adding machine based logs below for the System, Authentication and Kernel
      rsync -az /var/log/syslog /var/OPEN_MALWARE_RESEARCH_COMBINED_SYSTEMLOGS/ELK_VM
      rsync -az /var/log/auth.log /var/OPEN_MALWARE_RESEARCH_COMBINED_SYSTEMLOGS/ELK_VM
      rsync -az /var/log/kern.log /var/OPEN_MALWARE_RESEARCH_COMBINED_SYSTEMLOGS/ELK_VM


printf "Synced ELK_VM Logs \n"


      sleep 1
#done
