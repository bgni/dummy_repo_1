#/bin/env bash

# echo -e "$((1 + $(test ! -f cid && echo 0 || tail -n1 cid | cut -f 1) ))\t$(date -Iseconds)" >> cid

echo -e " $((1 + $(git cat-file -e HEAD:cid 2>/dev/null; echo 0 || git cat-file -p HEAD:cid | tail -n1 | cut -f 1)))"

tail -n1 cid