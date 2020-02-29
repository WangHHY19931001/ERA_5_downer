#!/bin/bash -l
PWD=$(cd "$(dirname "$0")";pwd)
CODEDIR=$PWD/code
DATADIR=$PWD/data

# Set your python environment


DATE1=$1
DATE2=$2
Nort=90
West=-180
Sout=-90
East=180
YY1=`echo $DATE1 | cut -c1-4`
MM1=`echo $DATE1 | cut -c5-6`
DD1=`echo $DATE1 | cut -c7-8`
#00:00:00/03:00:00/06:00:00/09:00:00/12:00:00/15:00:00/18:00:00/21:00:00
TIME1="00:00:00"
TIME2="03:00:00"
TIME3="06:00:00"
TIME4="09:00:00"
TIME5="12:00:00"
TIME6="15:00:00"
TIME7="18:00:00"
TIME8="21:00:00"
start_date=${DATE1}
end_date=${DATE2}
while [ "$start_date" -le "$end_date" ];
do
for TIME in ${TIME1} ${TIME2} ${TIME3} ${TIME4} ${TIME5} ${TIME6} ${TIME7} ${TIME8}
do
cd $CODEDIR
sed -e "s/DATE1/${start_date}/g;s/Nort/${Nort}/g;s/West/${West}/g;s/Sout/${Sout}/g;s/East/${East}/g;s/TIME/${TIME}/g;" GetERA5-sfc.py > GetERA5-${start_date}-${TIME}-sfc.py

python3 GetERA5-${start_date}-${TIME}-sfc.py

sed -e "s/DATE1/${start_date}/g;s/Nort/${Nort}/g;s/West/${West}/g;s/Sout/${Sout}/g;s/East/${East}/g;s/TIME/${TIME}/g;" GetERA5-ml.py > GetERA5-${start_date}-${TIME}-ml.py

python3 GetERA5-${start_date}-${TIME}-ml.py

mkdir -p ${DATADIR}/$YY1

mv ERA5-${start_date}-${TIME}-sfc.grb ERA5-${start_date}-${TIME}-ml.grb ${DATADIR}/$YY1/

done
start_date=$(date -d "$start_date+1days" +%Y%m%d)
done
# If you want to delete original files, you can uncomment the following line.
# rm *grb

exit 0
