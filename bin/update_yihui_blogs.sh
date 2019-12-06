
blogcontent=~/GIT/yihui_says/data/allposts.txt
blogcontentcln=~/GIT/yihui_says/data/allposts.min.txt

tmpjs=~/GIT/yihui_says/js/quotes2.js
tmpjs2=~/GIT/yihui_says/js/quotes.js

mkdir -p /tmp/_tmpdir


git clone https://github.com/rbind/yihui /tmp/_tmpdir

cat /tmp/_tmpdir/content/cn/2*.md > $blogcontent


echo " var mydata = [" > $tmpjs

cat $blogcontent |grep -v "^[title|date|slug|\\\-\\\-\\\-]" |grep "^>"  |sed "s/\"//g" > $blogcontentcln


cat $blogcontentcln |awk '{if (length($0) >10) printf "\"%s\",\n",$0}' >> $tmpjs

echo "]" >> $tmpjs

cat $tmpjs2 >> $tmpjs

rm -rf /tmp/_tmpdir

