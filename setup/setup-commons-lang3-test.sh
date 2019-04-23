#!/bin/bash

#set -x

DIR=`dirname $0`
DIR=`cd $DIR; pwd`

TMP=`cd $DIR/../tmp; pwd`
COMMONS_LANG=commons-lang3-3.9-src
CL_URL=https://www-us.apache.org/dist/commons/lang/source/${COMMONS_LANG}.tar.gz
CL_TAR=${COMMONS_LANG}.tar.gz
CL_DIR=$TMP/${COMMONS_LANG}

echo "downloading $CL_URL "

mkdir -p $TMP

[ ! -f "$TMP/${CL_TAR}" ] && cd ${TMP} && curl -s $CL_URL -o ${CL_TAR} 
[ -f "$TMP/${CL_TAR}" ] && cd ${TMP} && tar zfvx ${CL_TAR}

echo "----------------------------------------------"
echo ""
echo "+++ to add gradle run the following commands: "
echo "    cd $CL_DIR "
echo "    gradle init "
echo ""
echo "----------------------------------------------"
