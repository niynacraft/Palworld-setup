#!/bin/bash
timestamp=$(date +"%Y%m%d_%H%M%S")

if systemctl is-active --quiet palworld-server.service; then
    echo "palworld-server.service is running"
    tar -czvf ~/GameBackupData/PalServer_Backup_$timestamp.tar.gz -C ~/Steam/steamapps/common/PalServer/Pal/Saved .
else
    echo "palworld-server.service is not running"
fi