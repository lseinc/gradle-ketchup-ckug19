#!/bin/bash

#set -x

DIR=`dirname $0`
DIR=`cd $DIR; pwd`

TMP=`cd $DIR/../tmp; pwd`

mkdir -p $TMP

export GRADLE_VERSION=5.4
export GRADLE_BINARY=gradle-${GRADLE_VERSION}-all.zip
export MAVEN_VERSION=3.6.0
export MAVEN_BINARY=apache-maven-${MAVEN_VERSION}-bin.zip

[ ! -f "$TMP/$GRADLE_BINARY" ] && echo "downloading gradle $GRADLE_VERSION" && curl -L -o $TMP/$GRADLE_BINARY https://services.gradle.org/distributions/${GRADLE_BINARY}
[ ! -f "$TMP/$MAVEN_BINARY" ] && echo "downloading maven $MAVEN_VERSION" && curl -L -o $TMP/$MAVEN_BINARY http://ftp.wayne.edu/apache/maven/maven-3/${MAVEN_VERSION}/binaries/${MAVEN_BINARY}


[ ! -d  "$TMP/gradle-${GRADLE_VERSION}" ] && unzip  $TMP/$GRADLE_BINARY -d $TMP 
[ ! -d  "$TMP/apache-maven-${MAVEN_VERSION}" ] && unzip  $TMP/$MAVEN_BINARY -d $TMP 

echo "--------------------------------------------------------------------------------------------------------------------"
echo ""
echo "+++ gradle installed at $TMP/gradle-${GRADLE_VERSION} "
echo "+++ maven installed at $TMP/maven-${MAVEN_VERSION} "
echo ""
echo "+++ export path like following: "
echo "   export PATH=$TMP/gradle-${GRADLE_VERSION}/bin:\$PATH"
echo "   export PATH=$TMP/apache-maven-${MAVEN_VERSION}/bin:\$PATH"
echo ""
echo "--------------------------------------------------------------------------------------------------------------------"
