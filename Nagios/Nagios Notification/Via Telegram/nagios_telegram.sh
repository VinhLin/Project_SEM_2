#!/bin/bash

TOKEN="5654292386:AAHQVUr4Lqn66yIsKzX6p-YRmPVzKDD4m0M"
ID="5018541524"
URL="https://api.telegram.org/bot$TOKEN/sendMessage"

if [ "$1" == "host" ]
then
# Test message
# curl -s -X POST $URL -d chat_id=$ID -d text="Hello $1" > /dev/null 2>&1
	curl -s -X POST $URL -d chat_id=$ID -d text="***** Nagios ***** Notification Type: $NOTIFICATIONTYPE$ Host: $HOSTNAME$ State: $HOSTSTATE$ Address: $HOSTADDRESS$ Info: $HOSTOUTPUT$ Date/Time: $LONGDATETIME$" > /dev/null 2>&1
	
	exit 0
else
# Test message	
# curl -X POST $URL -d chat_id=$ID -d text="Hello"
	curl -s -X POST $URL -d chat_id=$ID -d text="***** Nagios ***** Notification Type: $NOTIFICATIONTYPE$ Service: $SERVICEDESC$ Host: $HOSTALIAS$ Address: $HOSTADDRESS$ State: $SERVICESTATE$ Date/Time: $LONGDATETIME$ Additional Info: $SERVICEOUTPUT$" > /dev/null 2>&1
	exit 0
fi

