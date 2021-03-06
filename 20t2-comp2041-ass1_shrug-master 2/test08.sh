

#test the mix of shrug-commit -a -m and shrug-rm

shrug-init

echo 1 >a
echo 2 >b
echo 3 >c 

shrug-add a b
shrug-commit -m "first commit"

echo 2 >>a
echo 4 >d
shrug-commit -a -m "second commit"
rm a

echo 5 >e
echo 6 >f
shrug-add e
shrug 6 >>e

rm a
shrug-rm b
shrug-rm --cached e
shrug-rm --cached f
shrug-rm --force a

