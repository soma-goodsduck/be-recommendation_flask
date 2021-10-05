#!/usr/bin/env bash

REPOSITORY=/opt/be-recommendation_flask
cd $REPOSITORY

APP_NAME=be-recommendation_flask
# JAR_PATH=$REPOSITORY/
ENV_PATH=/opt/.env

CURRENT_PID=$(pgrep -fl $REPOSITORY/ | grep python | awk '{print $1}')

echo "현재 구동 중인 애플리케이션 pid: $CURRENT_PID"

if [ -z "$CURRENT_PID" ]
then
  echo "> 종료할것 없음."
else
  echo "> kill -15 $CURRENT_PID"
  kill -15 $CURRENT_PID
  sleep 5
fi

echo "ENV PATH 인식 > $ENV_PATH"

nohup python3 -u app.py  > $REPOSITORY/nohup.out 2>&1 &

sudo chmod 777 $REPOSITORY/nohup.out
