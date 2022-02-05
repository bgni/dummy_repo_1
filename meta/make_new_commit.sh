#/bin/env bash

#./append_cid_new.sh
#env
#cat $PWD/meta/cid
last_id=$((git cat-file -e HEAD:meta/cid 2>/dev/null && git cat-file -p HEAD:meta/cid | cut -f 1) || echo 0 )
echo -e "$((1 + $last_id))\t$(date -Iseconds)" > $PWD/meta/cid

git add -A
git status
#git diff --staged meta/cid
echo "Press enter to commit these changes or ctrl+c to abort"

# read -e -i "Commit $(tail -n1 meta/cid)"
# 
git commit -F meta/cid