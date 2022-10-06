#!/bin/bash
pushd `dirname ${0}` >/dev/null || exit 1
source ./tgbot_vars.sh
Title="$1"

Message="$2"
for (( i=3; i <= "$#"; i++ )); do
    #echo "arg position: ${i}"
    #echo "arg value: ${!i}"
    Message=$Message"%0A${!i}"
done

curl -s \
 --data parse_mode=HTML \
 --data chat_id=${TG_CHAT_ID} \
 --data text="<b>${Title}</b>%0A${Message}" \
 --request POST https://api.telegram.org/bot${TG_TOKEN}/sendMessage

popd > /dev/null || exit 1
