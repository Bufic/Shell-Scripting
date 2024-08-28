#!/bin/bash

# Variable Declaration
URL='https://www.tooplate.com/zip-templates/2136_kool_form_pack.zip'
TEMPLATE='2136_kool_form_pack'
DIR="/tmp/webfiles"

yum --help 2> /dev/null

if [ $? -eq 0 ]
then
      # Set Variable For Amazon Linux
      PACKAGE="wget unzip httpd"
      SVC="httpd"

      # Installing Apache Webserver And Dependencies
      echo "####################################"
      echo "installing Packages"
      echo "####################################"
      sudo yum install $PACKAGE -y > /dev/null
      echo

      # Start and Enable The HTTPD Service

      echo "####################################"
      echo "Starting and Enabling HTTPD Service"
      echo "####################################"
      sudo systemctl enable $SVC
      sudo systemctl start $SVC
      echo "####################################"
      echo "HTTPD Enabled And Started"
      echo
      
      # Download Frontend Template To tmp Directory
      echo "####################################"
      echo "Downloading Frontend Template"
      mkdir -p $DIR
      cd $DIR

      wget $URL > /dev/null
      unzip $TEMPLATE.zip > /dev/null
      sudo cp -r $TEMPLATE/* /var/www/html/
      sudo systemctl restart $SVC

      cd ~
      rm -rf $DIR
else
      # Variable Declaration
      URL='https://www.tooplate.com/zip-templates/2136_kool_form_pack.zip'
      TEMPLATE='2136_kool_form_pack'
      DIR="/tmp/webfiles"

      apt --help 2> /dev/null
    
      # Set Variable For Ubuntu Linux
      PACKAGE="wget unzip apache2"
      SVC="apache2"

      # Installing Apache Webserver And Dependencies
      echo "####################################"
      echo "installing Packages"
      echo "####################################"
      sudo apt install $PACKAGE -y > /dev/null
      echo
      
      # Download Frontend Template To tmp Directory
      echo "####################################"
      echo "Downloading Frontend Template"
      mkdir -p $DIR
      cd $DIR

      wget $URL > /dev/null
      unzip $TEMPLATE.zip > /dev/null
      sudo cp -r $TEMPLATE/* /var/www/html/
      sudo systemctl restart $SVC

      cd ~
      rm -rf $DIR
fi      