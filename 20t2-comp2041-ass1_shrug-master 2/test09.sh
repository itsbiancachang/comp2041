

shrug-init 

touch a b c d e

echo 1 >>a
echo 3 >>c
echo 4 >>d

shrug-add a b c d
echo 9 >a
echo 9 >b
echo 9 >e

shrug-rm --cached a c
shrug-rm --force d
shrug-rm e
