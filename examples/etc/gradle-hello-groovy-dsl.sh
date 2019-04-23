#!/bin/bash

DIR=`dirname $0`
DIR=`cd $DIR; pwd`
DEMO_DIR=`cd $DIR/..; pwd`

PROJECT=gradle-hello-groovy-dsl

PROJECT_HOME=$DEMO_DIR/$PROJECT

echo "creating project $PROJECT at $PROJECT_HOME ..."
mkdir -p $PROJECT_HOME
cd $PROJECT_HOME

echo gradle init --dsl groovy --package hello.dsl --project-name $PROJECT --test-framework junit --type java-application
gradle init --dsl groovy --package hello.dsl --project-name $PROJECT --test-framework junit --type java-application
cd  .. && unzip -o $DIR/dsl/$PROJECT.zip

