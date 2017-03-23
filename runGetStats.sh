#!/bin/bash

#TODAY=$(date "+%Y-%m-%d")
#CAPSULE_FILENAME=/sync/server/html/reports/capsule_report.log
#LOCAL_NAME=./capsule_report.${TODAY}.log

#scp root@sync.sbgrid.org:${CAPSULE_FILENAME} ${LOCAL_NAME}

# Convert human date/time to timestamp and add to the line
# http://stackoverflow.com/questions/8267595/bash-script-to-convert-a-date-and-time-column-to-unix-timestamp-in-csv

#  substr(s, m, n)
#              the n-character substring of s that begins at position m counted from 1.
# dates:  20150316-18:20:39

awk '{year=substr($1,1,4);month=substr($1,5,2);day=substr($1,7,2);\
      hour=substr($1,10,2);minute=substr($1,13,2);seconds=substr($1,16,2);\
      timestr=year" "month" "day" "hour" "minute" "seconds;\
      mystamp=mktime(timestr);printf("%s\t%s\t%s\n",timestr,mystamp,strftime("%a",mystamp));\
      thisdow=strftime("%a",mystamp);print thisdow;dayofweek[thisdow]+=1; 
      myday[day]+=1;print year,month,day,hour,minutes,seconds;}\
      END\
      {printf("Day\tCount\n");for (i in myday)printf("%d\t%d\n",i,myday[i]);\
      printf("DOW\tCount\n");for (d in dayofweek)printf("%s\t%d\n",d,dayofweek[d])}' $1

#awk '{print mktime("2012 12 21 0 0 0");}'


#
#START_STAMP=$(head -1 ${LOCAL_NAME}|awk '{print $1}' )
#END_STAMP=$(tail -1 ${LOCAL_NAME}|awk '{print $1}' )
#echo ${END_STAMP} ${START_STAMP}
#
#END_EPOCH=$(date -j -f "%Y%M%d-%H:%M:%S" ${END_STAMP} +%s)
#START_EPOCH=$(date -j -f "%Y%M%d-%H:%M:%S" ${START_STAMP} +%s)
#
#echo ${END_EPOCH} ${START_EPOCH}
##let DIFF=${END_EPOCH}-${START_EPOCH}
##echo $DIFF

