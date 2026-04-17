STARTTIME=$(date +%s)
echo "STARTTIME is $STARTTIME"

sleep 10

ENDTIME=$(date +%s)
echo "Endtime is $ENDTIME"

TOTALTIME=$(($ENDTIME - $STARTTIME))
echo "Total time is $TOTALTIME"
