#!/bin/sh

# {"imei": "866804057911164", "model": "CLM920_JC3", "revision": "CLM920_JC3-V3.2", "imsi": "452019958825703", 
# "phone": "841210002586","gsm": "SIM READY, Operator=MOBIFONE, CSQ=13/31", "data": "WCDMA"}
# RANDOM=$(date +%s)

# Download index.json file 

#while true
#do
   echo "Download index.json file..."
   wget -q -O index.json http://admin:mgw@127.0.0.1:81/index.json
   INDEX_JSON_STR=$(cat index.json | python3 -c "import json,sys;obj=json.load(sys.stdin);print(obj['mgwId'], end=' '); \
         print(obj['vCode'], end=' '); print(obj['version'], end=' '); print(obj['sim'])")
   MGWID=$(echo "${INDEX_JSON_STR}" | awk '{print $1}')
   VCODE=$(echo "${INDEX_JSON_STR}" | awk '{print $2}')
   VERSION=$(echo "${INDEX_JSON_STR}" | awk '{print $3}')
   SIM=$(echo "${INDEX_JSON_STR}" | awk '{print $4}')
   #VCODE=$(cat index.json | python3 -c "import json,sys;obj=json.load(sys.stdin);print(obj['vCode'])")
   #VERSION=$(cat index.json | python3 -c "import json,sys;obj=json.load(sys.stdin);print(obj['version'])")
   #SIM=$(cat index.json | python3 -c "import json,sys;obj=json.load(sys.stdin);print(obj['sim'])")
   
   # Download gms .json file    
   echo "Download gms.json file..."
   wget -q -O gsm.json http://admin:mgw@127.0.0.1:81/gsm.json
   GSM_JSON_STR=$(cat gsm.json | python3 -c "import json,sys;obj=json.load(sys.stdin);print(obj['imei'], end=' '); \
         print(obj['model'], end=' '); print(obj['revision'], end=' '); print(obj['imsi'])")
   IMEI=$(echo "${GSM_JSON_STR}" | awk '{print $1}')
   MODEL=$(echo "${GSM_JSON_STR}" | awk '{print $2}')
   REVISION=$(echo "${GSM_JSON_STR}" | awk '{print $3}')
   IMSI=$(echo "${GSM_JSON_STR}" | awk '{print $4}')
   #MODEL=$(cat gsm.json | python3 -c "import json,sys;obj=json.load(sys.stdin);print(obj['model'])")
   #REVISION=$(cat gsm.json | python3 -c "import json,sys;obj=json.load(sys.stdin);print(obj['revision'])")
   #IMSI=$(cat gsm.json | python3 -c "import json,sys;obj=json.load(sys.stdin);print(obj['imsi'])")   
   RANDOM=$(date +%s)
   DATE=$(date "+%D %T")
   #echo $RANDOM
   FILE="${RANDOM}_${MGWID}.csv"
   echo "Create data file: ${FILE}"
   touch $FILE
   if [ $SIM == 1 ]
   
   then 
		echo "${DATE},MIRA,'${MGWID},'${VCODE},'${IMSI},eSIM,'${IMEI},'2.6,'${VERSION},'1.2,'1.01" > $FILE
	else
		echo "${DATE},MIRA,'${MGWID},'${VCODE},'${IMSI},nanoSIM,'${IMEI},'2.6,'$VERSION,'1.2,'1.01" > $FILE
   fi
	
   echo "Push file ${FILE} to server"
   curl -T $FILE ftp://mira:123456@smatec.com.vn/$FILE   
   echo "Delete ${FILE}"   
   rm $FILE
   #sleep 10
   
#done