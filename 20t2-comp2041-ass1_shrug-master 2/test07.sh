
shrug-init 
echo "hello world" >a
echo "hello bianca" >b
shrug-add a b 
shrug-commit -m "first commit"

echo 1 >>a
echo 2 >>b
echo 3 >c 
echo 4 >d
shrug-add c d
rm a
shrug-rm a
shrug-rm b
shrug-rm c

shrug-rm --cached c 
shrug-rm --cached d
shrug-rm --force c
shrug-rm --force d
