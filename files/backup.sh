#!/bin/bash

# タイムスタンプを生成
timestamp=$(date +"%Y%m%d_%H%M%S")

# palworld-server.serviceが実行中かどうかをチェック
if systemctl is-active --quiet palworld-server.service; then
    echo "palworld-server.service is running"
    
    # バックアップファイルを作成
    tar -czvf ~/GameBackupData/PalServer_Backup_$timestamp.tar.gz -C ~/Steam/steamapps/common/PalServer/Pal/Saved .

    # GameBackupDataディレクトリに移動して古いバックアップを削除
    cd ~/GameBackupData || exit
    ls -t PalServer_Backup_*.tar.gz | tail -n +201 | xargs rm --
else
    echo "palworld-server.service is not running"
fi