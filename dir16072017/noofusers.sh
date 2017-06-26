if [ `who|wc -l` -le 10 ]
then
echo $`who|wc -l`
else 
echo "more than 10 users"
fi
