#!/bin/bash

DIR=`dirname $0`
DIR=`cd $DIR; pwd`

PROJECT=gradle-hello-kotlin-plugin

PROJECT_HOME=$DIR/../$PROJECT

echo "creating project $PROJECT at $PROJECT_HOME ..."
mkdir -p $PROJECT_HOME
cd $PROJECT_HOME

echo gradle init --dsl kotlin --package hello.dsl --project-name $PROJECT --test-framework kotlintest --type kotlin-application 
gradle init --dsl kotlin --package hello.dsl --project-name $PROJECT --test-framework kotlintest --type kotlin-application 
cd  .. && unzip -o $DIR/dsl/$PROJECT.zip
