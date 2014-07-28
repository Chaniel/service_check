current_datetime=`date +%s`
log_name=`date +%Y%m%d`
filedate=`stat /data/search/log/$log_name | grep Modify | awk '{print $2}'`
filetime=`stat /data/search/log/$log_name | grep Modify | awk '{split($3,var,".");print var[1]}'`
file_datetime=`date -d "$filedate $filetime" +%s`
timedelta=`expr $current_datetime - $file_datetime`

if [ "$timedelta" -gt "180" ];then
        killall geo_server
        cd /data/search/
        ./start
        echo `date +%F' '%H:%M:%S` "start server process success log" >> /data/autostart.log

fi



#echo $filedate
#echo $filetime


#echo $current_datetime
#echo $file_datetime
#echo $timedelta
