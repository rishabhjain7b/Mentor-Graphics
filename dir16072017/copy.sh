echo "enter source & target files"
read source target
if cp $source $target
then
echo "copied"
else
echo "not copied"
fi

