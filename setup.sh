home_directory=~
current_user=$(whoami)

#ゲーム本体のインストール
#mkdir ~/script
#mkdir ~/GameBackupData
#mkdir ~/.steam/
#mkdir ~/.steam/sdk64/
#sudo add-apt-repository multiverse; sudo dpkg --add-architecture i386; sudo apt update; sudo apt install steamcmd -y
#steamcmd +login anonymous +app_update 2394010 validate +quit

#cp -r ~/Steam/steamapps/common/PalServer/linux64/steamclient.so ~/.steam/sdk64/

#スクリプトファイルのコピー
#cp ~/Palworld-setup/files/start.sh ~/script
#cp ~/Palworld-setup/files/backup.sh ~/script
#cp ~/Palworld-setup/files/update.sh ~/script
#sudo chmod 700 ~/script/*

#サービス化
#service_file="$home_directory/Palworld-setup/files/palworld-server.service"
echo "Fileの書き換え"
sed -i "s/<user-name>/$current_user/g" "$home_directory/Palworld-setup/files/palworld-server.service"
sed -i "s/<user-name>/$current_user/g" "$home_directory/Palworld-setup/files/PalServer"

echo "Fileのコピー"
sudo cp ~/Palworld-setup/files/palworld-server.service /etc/systemd/system/
sudo cp ~/Palworld-setup/files/palworld-server.PalServer /etc/cron.d/

sudo systemctl daemon-reload
sudo systemctl enable palworld-server.service
sudo systemctl start palworld-server.service

sudo touch /etc/cron.d/PalServer