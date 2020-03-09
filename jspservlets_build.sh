#!/bin/bash

if [ -f /tomcat/webapps/ROOT.war ]; then
  rm /tomcat/webapps/ROOT.war
fi
if [ -d /tomcat/webapps/ROOT ]; then
  rm -r /tomcat/webapps/ROOT
fi

mkdir -p /tomcat/webapps/ROOT

# Build the application and deploy

cd /home/user/workspace/ROOT
mvn clean package -DskipTests
cp /home/user/workspace/target/*.war /tomcat/webapps/ROOT.war
cp -r /home/user/workspace/target/ROOT-1.0/* /tomcat/webapps/ROOT/
