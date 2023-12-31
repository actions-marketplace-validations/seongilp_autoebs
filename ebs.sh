#!/bin/bash
RADIO_ADDR="https://ebsonair.ebs.co.kr/fmradiofamilypc/familypc1m/chunklist.m3u8"
PROGRAM_NAME=$1
RECORD_MINS=$(($2 * 60))
REC_DATE=`date +%Y%m%d`
FILE_NAME=$PROGRAM_NAME"_"$REC_DATE.m4a
ffmpeg -re -i "$RADIO_ADDR" -vn -acodec copy -t $RECORD_MINS "$FILE_NAME" > /dev/null 2>&1
curl -X POST -H "Content-Type:multipart/form-data" -F audio=@$FILE_NAME -F chat_id=$CHAT_ID "https://api.telegram.org/bot$TOKEN/sendAudio"
