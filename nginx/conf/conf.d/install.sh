#/usr/bin/env bash

for cnf in $(ls *.conf); do
  ln -sf $PWD/$cnf /etc/nginx/conf/conf.d/
done
