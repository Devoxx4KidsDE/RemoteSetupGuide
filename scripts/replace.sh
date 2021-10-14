#!/bin/bash
cat env
for i in $(cat env)
do
	key=$(cut -d "=" -f1 <<< $i)
	value=$(cut -d "=" -f2 <<< $i)
	echo key: $key, value: $value
	# replace matches in all files contained in the site directory
	#find site/ -type f -exec sed -i 's/tpl:$key/$value/g' {} +
	find site/ -type f -exec sed -i "s/tpl:$key/$value/g" {} +
done
