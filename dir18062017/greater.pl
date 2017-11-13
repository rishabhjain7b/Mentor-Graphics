#!/usr/bin/perl
print("enter two number\n");
chop($a=<STDIN>);
$b=<STDIN>;
chop($b);
$m=$a>$b?$a:$b;
print($m,"max:");
