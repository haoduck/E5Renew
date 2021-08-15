#!/bin/sh
write(){
    file=$1
    value=$2
    if [[ ! -f $file ]];then
        echo $value > $file
    fi
}
write /work/id.txt $id
write /work/secret.txt $secret
write /work/refresh_token.txt $refresh_token
write /work/crontab.log ""

python /work/index.py

tail -f /work/crontab.log