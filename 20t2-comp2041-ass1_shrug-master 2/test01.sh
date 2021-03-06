#test shrug-init + shrug-add + shrug-add error message 


#add with non-existent file 
#add with multiple files at one time
 
shrug-init 

echo "hello" >a
echo "comp2041" >b
echo "why am I doing this" >c

#trying to add multiple file at one time to the index

shrug-add a b c

#show the error message if trying to add an non-existing file in current working directory

shrug-add k




