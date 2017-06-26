echo "enter source & target files"
read source target
if mv $source $target
then
echo "moved"
else
echo "not moved"
fi

