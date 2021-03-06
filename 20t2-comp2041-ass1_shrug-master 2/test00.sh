
#test shrug-init + shrug-add + shrug-commit -m + shrug-show 

#show how the current directory, the index, and the commit are stored 

shrug-init 

echo "1" >a
shrug-add a 
shrug-commit -m "first commit"

echo "2" >>a
shrug-add b
shrug-commit -m "second commit"

echo "Line 3" >>a
shrug-add a 


shrug-show 0:a
shrug-show 1:a
shrug-show :a
cat a
