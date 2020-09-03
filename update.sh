#!/bin/bash

basePath="/home/iahc/图片/PicBed/"
baseUrl="https://cdn.jsdelivr.net/gh/iahccc/PicBed/"

cd $basePath

status=`git status`

if [[ $status =~ "以包含要提交的内容）" ]]
then
    substr=${status##*以包含要提交的内容）}
    substr=${substr%提交为空*}
    substr=${substr%修改尚未加入*}
    
    array=(`echo $substr`)
    result=''
    for i in ${!array[@]}
    do
        result="${result}${baseUrl}${array[$i]}\n"
    done 
    
    echo -e $result | xsel -i -b #将内容复制到粘贴板
    
    git pull origin
    git add $basePath
    git commit -m 'update'
    git push origin
    
    echo "======================================"
    echo -e $result

else
    git pull origin
    git add $basePath
    git commit -m 'update'
    git push origin
fi
