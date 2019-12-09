## Relative path used, run this script in bin/

blogcontent=/tmp/_allposts.txt
blogcontentcln=/tmp/_allposts.min.txt
tmpjs=../js/quotes2.js # our quote generator
# tmpjs2=../js/quotes.js 



## get yihui's posts

mkdir -p /tmp/_tmpdir
git clone https://github.com/rbind/yihui /tmp/_tmpdir
# cat /tmp/_tmpdir/content/cn/2*.md > $blogcontent




has_quote=/tmp/_hasquote.txt
grep -l "^>" /tmp/_tmpdir/content/cn/2*.md > $has_quote
while read fn;do

# printf '{quote: "%s", source: "%s" }'

bnfn=$(basename $fn)

title=$(cat $fn|grep "^title:" |head -1 |sed 's/title: //'|sed "s/\"//g")

url=https://yihui.org/cn/$(echo $bnfn|sed -E "s/^(....)-(..)-(..)-(.*).md/\\1\/\\2\/\\4/")

cat $fn |grep "^> " |sed "s/^> //" |sed "s/\"//g" |awk -v url="$url" -v title="$title" '{if (length($0) >10) printf "{quote: \"%s\", title: \"%s\", url: \"%s\"},\n",$0,title,url}'  >> $blogcontentcln

done < $has_quote



# extract quotes

# cat $blogcontent |grep -v "^[title|date|slug|\\\-\\\-\\\-]" |grep "^>"  |sed "s/\"//g" > $blogcontentcln


# generate the quote generator

echo " var mydata = [" > $tmpjs
cat $blogcontentcln >> $tmpjs
echo "]" >> $tmpjs
# cat $tmpjs2 >> $tmpjs

echo "
 function Start () {
     var myrandom = Math.floor( Math.random() * (mydata.length));
     document.getElementById('quotedisplay').innerHTML = mydata[myrandom].quote
     document.getElementById('quotedtitle').innerHTML = '-'+mydata[myrandom].title
     document.getElementById('quotedtitle').setAttribute('href', mydata[myrandom].url);
 }

 Start();" >> $tmpjs


rm -rf /tmp/_tmpdir $blogcontentcln $blogcontent

