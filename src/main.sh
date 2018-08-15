#!/usr/bin/env bash

#!/usr/bin/env bash

jqtest="[[["a","b","c"],["a1","b1","c1"]],2,[["e","f","g"],["e1","f1","g1"]]]"

echo $jqtest | awk '{
  sub(/\]\],/,"]]|")
  sub(/,\[\[/,"|[[")
  split($0,contents,"|")
  str=contents[1]
  sub(/\[\[\[/,"[",str)
  sub(/\]\]/,"]",str)
  sub(/,\[/,"|[",str)
  split(str,elements,"|")
  for(i in elements){
    sub(/\[/,"", elements[i])
    sub(/\]/,"",elements[i])
    split(elements[i], datas, ",")
    print(datas[1])
  }
}'

