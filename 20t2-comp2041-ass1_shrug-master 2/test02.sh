
#test shrug-init + shrug-add + shrug-commit -m + shrug-show

#check if add, commit, log are storing the correct content 
#also check if show will print the correct content 

shrug-init
echo "line 1" >a
echo "hi 1" >b

shrug-add a b
shrug-commit -m "first time commit"

echo "line 2" >>a
echo "hi 2" >>b

shrug-add a b
shrug-commit -m "second time commit"

echo "hi 3" >>b
shrug-add b 

echo "hi 4" >>b

#check if shrug-log is storing the correct message from the previous commit command 
shrug-log 

shrug-show 0:a
shrug-show 1:a
shrug-show :a
shrug-show 0:b
shrug-show 1:b
shrug-show :b
cat a
cat b



