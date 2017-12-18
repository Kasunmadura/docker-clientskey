#!/bin/bash

## Author Kasun Madura Rathanyaka
## email : kasunmaduraeng@gmail.com

## please check the db-connection json and check the db connection string to 10.0.1.101:27017
## check the file location where appapi repo located in you server/PC
docker pull kasunmadura/clientskeyapi:v1
docker pull mongo
docker network create --subnet 10.0.1.0/24 --gateway 10.0.1.1 clientskey
docker run  -id -p 27017:27017 --name clientskeymongo --network clientskey --ip 10.0.1.101 --name mongodb --add-host='appapi.ck.com:10.0.1.102' --add-host='app.ck.com:10.0.1.103' --add-host='db.ck.com:10.0.1.101' mongo:latest
docker run  -id -p 3333:5000 -v /root/test/server:/app --network clientskey --ip 10.0.1.102 --name appapi --add-host='appapi.ck.com:10.0.1.102' --add-host='app.ck.com:10.0.1.103' --add-host='db.ck.com:10.0.1.101'  kasunmadura/clientskeyapi:v1
docker run  -id -p 8080:8080 -v /root/test/clientskey_prod_v0.1/:/app --network clientskey --ip 10.0.1.103 --name app --add-host='appapi.ck.com:10.0.1.102' --add-host='app.ck.com:10.0.1.103' --add-host='db.ck.com:10.0.1.101'  kasunmadura/clientskeyapp:v2
