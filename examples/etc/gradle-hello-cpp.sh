#!/bin/bash

DIR=`dirname $0`
DIR=`cd $DIR; pwd`

PROJECT=gradle-hello-cpp

PROJECT_HOME=$DIR/../$PROJECT

echo "creating project $PROJECT at $PROJECT_HOME ..."
mkdir -p $PROJECT_HOME
cd $PROJECT_HOME

echo gradle init --dsl kotlin --project-name $PROJECT --type basic
gradle init --dsl kotlin --project-name $PROJECT --type basic
cd  .. && unzip -o $DIR/cpp/$PROJECT.zip

