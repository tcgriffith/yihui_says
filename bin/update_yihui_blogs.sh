## Relative path used, run this script in bin/

blogcontent=../data/allposts.txt
blogcontentcln=../data/allposts.min.txt
tmpjs=../js/quotes2.js # our quote generator
# tmpjs2=../js/quotes.js 



## get yihui's posts

mkdir -p /tmp/_tmpdir
git clone https://github.com/rbind/yihui /tmp/_tmpdir
cat /tmp/_tmpdir/content/cn/2*.md > $blogcontent



# extract quotes

cat $blogcontent |grep -v "^[title|date|slug|\\\-\\\-\\\-]" |grep "^>"  |sed "s/\"//g" > $blogcontentcln


# generate the quote generator

echo " var mydata = [" > $tmpjs
cat $blogcontentcln |awk '{if (length($0) >10) printf "\"%s\",\n",$0}' >> $tmpjs
echo "]" >> $tmpjs
cat $tmpjs2 >> $tmpjs

echo "
 function Start () {
     var myrandom = Math.floor( Math.random() * (mydata.length));
     document.getElementById('quotedisplay').innerHTML = mydata[myrandom]
 }

 Start();" >> $tmpjs


rm -rf /tmp/_tmpdir

