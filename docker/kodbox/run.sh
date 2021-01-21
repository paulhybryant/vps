#!/usr/bin/env bash

docker run -d -p 8006:80 -v $PWD/data:/var/www/html --restart=always kodcloud/kodbox:v1.15
