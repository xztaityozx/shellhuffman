#!/bin/bash

cat > out.txt

cat out.txt|
sed 's/0 "/0\n"/g'|
head -n1|tr ' ' '\n'|
while read LINE;do
  LINE=$(echo -n $LINE|wc -c)
  cat out.txt|sed 's/0 "/0\n"/g'|tail -n1|grep -o '... '|head -n$LINE|tail -n1|sed 's/"\(.\)"/\1/g'
done|tr -d '\n'|
sed 's/\(.\) \(.\)/\1\2/g'|
sed 's/\(.\) \(.\)/\1\2/g'

echo

