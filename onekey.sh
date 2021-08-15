#!/bin/sh
echo "说明：<https://haoduck.com/848.html> "
if [[ -z $(command -v docker) ]];then
    bash <(curl -sL haoduck.com/sh/docker.sh)
fi
while [[ -z "$id" ]];do
    echo -e "输入ID：\c"
    read id
done
while [[ -z "$secret" ]];do
    echo -e "输入Secret：\c"
    read secret
done
while [[ -z "$refresh_token" ]];do
    echo -e "输入refresh_token：\c"
    read refresh_token
done
echo -e "输入Docker容器名(有多个账号的情况,用容器名区分,单账号直接回车)：\c"
read $name
[[ -z "$name" ]] && name=e5renew
docker run -dit --name $name --restart always \
-e id=$id \
-e secret=$secret \
-e refresh_token=$refresh_token \
haoduck/e5renew

docker logs $name