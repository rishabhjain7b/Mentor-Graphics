echo "Enter 5 numbers:"
read a b c d e
sum=`expr $a + $b + $c + $d + $e `
avge=`expr $sum / 5 `
echo $sum
echo $avge
