#!/bin/bash
# Bash: Mongo start
mongod --port 27017 --dbpath /data/mongodb/rs0-0 --replSet rs0 --smallfiles --oplogSize 128 &
mongod --port 27018 --dbpath /data/mongodb/rs0-1 --replSet rs0 --smallfiles --oplogSize 128 &
mongod --port 27019 --dbpath /data/mongodb/rs0-2 --replSet rs0 --smallfiles --oplogSize 128 &

