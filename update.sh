basePath="/home/iahc/图片/PicBed/"
baseUrl="https://cdn.jsdelivr.net/gh/iahccc/PicBed/"

status=`git status`

#if [[ ! $status =~ "删除" ]]
#then
substr=${status##*以包含要提交的内容）}
substr=${substr%提交*}
substr=${substr%修改尚未加入提交*}

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

echo -e $result

