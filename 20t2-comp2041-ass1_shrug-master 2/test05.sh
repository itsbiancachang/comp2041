
#test shrug-rm --cached file1 file2

#remove two files at one time
#assume that both files' contents are consistent with cwd, index, repo (commit.*)


shrug-init 
echo "hello a" >a
echo "hello b" >b
shrug-add a b

shrug-commit -m "first commit"

echo "hello c" >c
echo "hello d" >d
shrug-add c d

shrug-commit -m "second commit"


cat c
shrug-show 0:c
shrug-show :c



shrug-rm --cached a b
shrug-rm --cached c d


