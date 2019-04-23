#!/bin/bash

DIR=`dirname $0`
DIR=`cd $DIR; pwd`

PROJECT=maven-goodbye

PROJECT_HOME=$DIR/../$PROJECT

echo "creating project $PROJECT at $PROJECT_HOME ..."
cd $DIR/..
rm -rf "${PROJECT_HOME}"
unzip -o $DIR/goodbye/$PROJECT-project.zip

