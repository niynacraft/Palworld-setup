home_directory=~
current_user=$(whoami)

#mkdir ~/script
#mkdir ~/.steam/
#mkdir ~/.steam/sdk64/
#sudo add-apt-repository multiverse; sudo dpkg --add-architecture i386; sudo apt update; sudo apt install steamcmd -y
#steamcmd +login anonymous +app_update 2394010 validate +quit

service_file="$home_directory/Palworld-setup/script/palworld-server.service"
sed -i "s/<user-name>/$current_user/g" $service_file
cat ~/Palworld-setup/script/palworld-server.service

sudo cp ~/Palworld-setup/script/palworld-server.service /etc/systemd/system/