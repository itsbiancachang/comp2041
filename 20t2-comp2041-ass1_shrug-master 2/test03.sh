
#test shrug-init error + shrug-init 

#check if shrug-init is printing the error message 
#if the user didn't create the shrug-init directory

#.shrug dir hasn't been created, error message shown 
touch a
shrug-add a


#.shrug dir has been created 
#Initialized empty shrug repository in .shrug

shrug-init 
shrug-add a


