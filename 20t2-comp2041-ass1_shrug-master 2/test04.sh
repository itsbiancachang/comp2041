#test shrug-add + shrug-commit -a -m + shrug-add error

shrug-init 
echo "hello 1" >a
shrug-add a

shrug-commit -m "first commit"

echo "hi 1" >b
echo "hola 1" >c
shrug-add b c
shrug-commit -m "second commit"

echo "hi 2" >>b
echo "aloha" >>d
shrug-add d
shrug-commit -a -m "third commit"

shrug-show 0:a
shrug-show 1:b
shrug-show 1:c
shrug-show 2:b
shrug-show 2:d

#check shrug-show error message
shrug-show 1:d
shrug-show :e
cat c 

 



