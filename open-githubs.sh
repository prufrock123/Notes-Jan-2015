#!/bin/sh
usernames=("user1" "user2")

for i in "${usernames[@]}"
do
    :
    sleep .25
    open "https://github.com/$i"
done