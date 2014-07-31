#/bin/bash
date=`date +%F' '%H:%M:%S`

# search
echo $date "search ES connections:" `netstat -an | grep 7190 | grep ES | wc -l` >> /data/stat.txt


# crontab -e
# */15 * *　× ×  /opt/stat.sh
