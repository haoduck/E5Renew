#!/bin/sh
write(){
    file=$1
    value=$2
    if [[ ! -f $file ]];then
        echo $value > $file
    fi
}
write /work/config/id.txt $id
write /work/config/secret.txt $secret
write /work/config/refresh_token.txt $refresh_token
write /work/crontab.log ""

python /work/index.py

tail -f /work/crontab.log