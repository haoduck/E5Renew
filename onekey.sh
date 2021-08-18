#!/bin/sh
id(){
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
    name
    docker run -dit --name $name --restart always \
    -e id=$id \
    -e secret=$secret \
    -e refresh_token=$refresh_token \
    haoduck/e5renew
}
txt(){
    while [[ -z "$txt_dir" ]];do
        echo -e "输入包含id.txt,secret.txt,refresh_token.txt的目录：\c"
        read txt_dir
    done
    name
    docker run -dit --name $name --restart always \
    -v $txt_dir:/work/config/ \
    haoduck/e5renew
}
name(){
    echo -e "输入Docker容器名(有多个账号的情况,用容器名区分,单账号直接回车)：\c"
    read $name
    [[ -z "$name" ]] && name=e5renew
}

echo "说明：<https://haoduck.com/848.html> "
if [[ -z $(command -v docker) ]];then
    bash <(curl -sL haoduck.com/sh/docker.sh)
fi

echo -e "
    1.分别输入ID,Secret,refresh_token(默认)
    2.输入包含id.txt,secret.txt,refresh_token.txt的目录(建议用绝对目录)
    
    请输入：\c"
read num

case $num in
    1)
        id
        ;;
    2)
        txt
        ;;
    *)
        id
        ;;
esac

docker logs $name