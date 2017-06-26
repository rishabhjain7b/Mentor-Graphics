echo "Enter any number:"
read num
case $num in
1) echo `wc -l file2`;;
2) echo `date`;;
3) echo `whoami`;;
4) echo `pwd`;;
5) echo `cal`;;
*) echo `who`;;
esac
