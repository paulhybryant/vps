#!/usr/bin/env bash

docker run -d -p 8443:443 -v ~/docker/nextcloud/data:/var/www/html/data --restart=always nextcloud
