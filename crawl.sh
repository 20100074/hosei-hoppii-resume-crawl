#!/usr/bin/env bash

# this script works (at least up to RHEL8)
# 足りない部分や環境依存のところは適切に補完してください
# class_idやclass_nameの部分はHoppii(Sakai)のAPIを使えばいい感じに取得できそうですが，作成者はもう卒業なので，改修しません。

# 何度もくりかえすが，大学のサーバーに負荷をかけすぎないようにしてください。ネットワーク利用規約みたいなのがあったはずです。

# set -x

#export RCLONE=$(which rclone)
export PATH=$HOME/opt/bin:$PATH
#export LOGPATH=$HOME/log.log

# class_nameは日本語の授業名， class_idはHoppiiの各授業ページのURLから確認できる
# export class_id=( 26113 26397 26389 )
# export class_name=( 刑事訴訟法2 契約法3 物権法 )

echo "レジュメの収集をはじめるよ〜(${#class_id[*]}科目)"
#echo "レジュメ収集開始: $(date) [$(whoami)]" >> $LOGPATH
#echo "rcloneのパス: $(which rclone)" >> $LOGPATH
for i in $(seq 0 17); # index starts from zero
do
	#echo "${class_name[$i]}のレジュメをダウンロード開始" >> $LOGPATH
	echo "[${class_id[$i]} | ($i/${#class_id[*]})" && \
#	rclone copyto hoppii-class:/${class_id[$i]} hoppii-user:/レジュメ_resume/${class_name[$i]} && \
	rclone copyto hoppii-class:/${class_id[$i]} dropbox:/レジュメ_resume/${class_name[$i]}
	echo "${class_name[$i]}のレジュメ収集終了"
done

echo "レジュメ収集終了: $(date)" 
