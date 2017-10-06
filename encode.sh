#!/bin/bash

read cmd

echo "$cmd"|grep -o .|sort|uniq -c|sort -r|awk -F '[0-9]+ ' '{print "\""$2"\""}'|awk '{x=0;for(i=0;i<NR-1;i++){x+=1;x=lshift(x,1);};printf "%s %x\n",$0,x}' > tmp.txt

echo -n $(
echo "$cmd"|grep -o .|
while read LINE;do
  LINE="\"${LINE:- }\""
  cat tmp.txt|grep "$LINE"|sed 's/... //g;s/\(.\)/\U\1/g'|xargs -I@ echo "ibase=16;obase=2;@"|bc
done|xargs
) ""
cat tmp.txt|grep -o '^...'|tr '\n' ' '
echo
