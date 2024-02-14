# パルワールドUbuntuセットアップ
自己責任でど～～～ぞ

## セットアップ手順

ホームディレクトリの位置で実行してください。

- git のインストール`sudo apt install git -y`
- セットアップFileのダウンロード`git clone https://github.com/niynacraft/Palworld-setup.git`
- セットアップの実行`sh Palworld-setup/setup.sh`

## backup間隔の調整
`/etc/cron.d/PalServer`のcronファイルを編集
#### 例1) 30分ごと(default)
```
*/30 * * * * <user-name> ~/script/backup.sh
```
#### 例2) １時間ごと
```
0 * * * * <user-name> ~/script/backup.sh
``` 

## バックアップファイルの世代数
`~/script/backup.sh`の15行目を編集

残したい世代数+1

#### 例1) 200世代残したいとき(default)
```
ls -t PalServer_Backup_*.tar.gz | tail -n +201 | xargs rm --
```

#### 例 2) 100世代残したいとき
```
ls -t PalServer_Backup_*.tar.gz | tail -n +101 | xargs rm --
```