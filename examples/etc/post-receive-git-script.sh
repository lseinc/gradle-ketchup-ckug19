#!/bin/bash

JENKINS_PORT=8080
JENKINS_BASE_URL="http://jenkins:$JENKINS_PORT/job"
JENKINS_SUFFIX="build?token="

# checkAndNotify method
checkAndNotify() {
   JOB_NAME=$1
   TOKEN=$2
   BRANCH=$3
   REF=$4
   echo "$REF"|grep "$BRANCH" && echo "notifying jeknins $JOB_NAME job of change" && curl -v "${JENKINS_BASE_URL}/${JOB_NAME}/${JENKINS_SUFFIX}${TOKEN}"
}

PARMS=""
while read line ;
do
        #echo "line=$line"
        PARMS="$PARMS $line"
done
#echo "PARMS=$PARMS"

REF=`echo "$PARMS"|awk '{ print $3 }'`

echo "post-recieve: REF=$REF"


#echo "$REF"|grep maven && echo "notifying jeknins maven-goodbye-mvn job" && curl -v http://jenkins:8080/job/maven-goodbye-mvn/build?token=maven-goodbye-mvn-secret-token
#echo "$REF"|grep gradle && echo "notifying jeknins maven-goodbye-gradle job" && curl -v http://jenkins:8080/job/maven-goodbye-gradle/build?token=maven-goodbye-gradle-secret-token

checkAndNotify maven-goodbye-mvn maven-goodbye-mvn-secret-token maven $REF
checkAndNotify maven-goodbye-gradle maven-goodbye-gradle-secret-token gradle $REF
