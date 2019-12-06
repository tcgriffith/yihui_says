
blogcontent=~/GIT/yihui_says/data/allposts.txt
blogcontentcln=~/GIT/yihui_says/data/allposts.min.txt

mkdir -p /tmp/_tmpdir


git clone https://github.com/rbind/yihui /tmp/_tmpdir

cat /tmp/_tmpdir/content/cn/2*.md > $blogcontent

cat $blogcontent |grep -v "^[title|date|slug|\\\-\\\-\\\-]" |grep "^>" |awk '{if (length($0) >10) print}' > $blogcontentcln


rm -rf /tmp/_tmpdir

