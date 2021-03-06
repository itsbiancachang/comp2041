
#test shrug-rm + shrug-rm force

shrug-init

echo 1 >a
echo 2 >b
shrug-add a b
shrug-commit -m "first commit"

echo 2 >>a
echo 3 >c
shurg-add a c
shrug-commit -m "second commit"

echo 4 >d
shrug-add d

shrug-rm a
shrug-rm b

shrug-rm --force c
shrug-rm --force d
