#!/bin/sh

for i in `find . | grep \.ts`
do
   maybeBad=0
   IFS=''
   cat $i | while read line
   do
      if [ "$line" = '        <translation type="unfinished">' ] ; then
         maybeBad=1
         lastLine="$line"
         continue
      fi
      if [ $maybeBad -eq 1 -a "$line" = "            </translation>" ] ; then
         maybeBad=0
         echo "        <translation type=\"unfinished\"></translation>" >> /tmp/.lines
         continue
      fi

      if [ $maybeBad -eq 1 ] ; then
         maybeBad=0
         echo -e "$lastLine" >> /tmp/.lines
         echo -e "$line" >> /tmp/.lines
         continue
      else
         echo -e "$line" >> /tmp/.lines
      fi
   done < $i
   mv /tmp/.lines $i
done
