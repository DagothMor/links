#!/bin/bash

text = "Changes"

if [ $1 != "" ]; then
	echo "param is " + $1
fi

git add --all
git commit -a -m 'New, fresh blood'
git push
