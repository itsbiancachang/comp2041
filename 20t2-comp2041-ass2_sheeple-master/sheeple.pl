#!/usr/bin/perl -w 

#use diagnostics -verbose;

while ($line = <>)
{
    #subset 0
    $line =~ s?^#!.*?#!/usr/bin/perl -w?;
    
    #dealing with echo -n 
    $line =~ s?echo -n '(.*)'?print "$1";?;
    $line =~ s?echo -n "(.*)"?print "$1";?;
    $line =~ s?echo -n (.*)?print "$1";?;
    
    
    
    #handling double quotes inside single quotes
    if ($line =~ /echo '(.*)'/)
    {
        $temp = "echo \'" . $1 . "\'";
        $temp =~ s/"/\\"/g;
        
        $line = $temp;
    }
    
    #converting echo - single quote 
    $line =~ s?echo '(.*)'?print "$1\\n";?;
    
    #converting echo - double quotes
    $line =~ s?echo "(.*)"?print "$1\\n";?;
    
    #converting echo - without quote
    $line =~ s?echo (.*)?print "$1\\n";?;
    
    #dealing with linux command
    $line =~ s?^ls(.*)?system "ls$1";?;
    $line =~ s?"\$\@"?\@ARGV?;
    $line =~ s?\bpwd\b?system "pwd";?;
    #$line =~ s?\bls\b?system "ls";?;
    $line =~ s?\bid\b?system "id";?;
    $line =~ s?date?system "date";?;
    

    
    #handling if statement - including both test and [...]
    $line =~ s?if \[ "(.*)" == "(.*)" \]?if ('$1' eq '$2') {?;
    
    $line =~ s?if \[ "(.*)" != "(.*)" \]?if ('$1' ne '$2') {?;
    $line =~ s?if \[ "(.*)" -lt "(.*)" \]?if ('$1' < '$2') {?;
    $line =~ s?if \[ "(.*)" -le "(.*)" \]?if ('$1' <= '$2') {?;
    $line =~ s?if \[ "(.*)" -gt "(.*)" \]?if ('$1' > '$2') {?;
    $line =~ s?if \[ "(.*)" -ge "(.*)" \]?if ('$1' >= '$2') {?;
    
    
    $line =~ s?^if test (.*) = (.*)?if ('$1' eq '$2') {?;
    $line =~ s?^if test \$\# -gt (.*)?if (\@ARGV > $1) {?;
    $line =~ s?^if test (.*) -gt (.*)?if ('$1' > '$2') {?;
    $line =~ s?^if test (.*) -ge (.*)?if ('$1' >= '$2') {?;
    $line =~ s?^if test (.*) -le (.*)?if ('$1' <= '$2') {?;
    
    
    $line =~ s?then[^a-z]??; 
    $line =~ s?elif test (.*) = (.*)?} elsif ('$1' eq '$2') {?;
    $line =~ s?elif \[ "(.*)" != "(.*)" \]?elsif ('$1' ne '$2') {?;
    $line =~ s?elif \[ "(.*)" == "(.*)" \]?elsif ('$1' eq '$2') {?;
    $line =~ s?else?} else {?;
    $line =~ s?\bfi\b?}?;
    
    
    
    
    #don't do anything, in order not to modify the inverted shell script
    #$line =~ s?(.*) = (.*)?$1 = $2;?;
    
    #if ($line =~ /(.*)`expr(.*)`/)
    #{
    #    $temp = $1 . "`expr $2" . ";" . "`";
    #    print "\$temp: $temp\n";
    #    $line = $temp;
    #    $line =~ s?`??g;
    #    $line =~ s?expr??;    
    #    $line =~ s?\s??;
    #    print " 1: $line";
    #}
    
    
    
    
   
    $line =~ s?(.*)=(.*)?\$$1 = '$2';?;
   
    $line =~ s?(.*)=^\$(.*)?\$$1 = $2;?;
    
    #$line =~ s?(.*)=\$\(\((.*)\)\)?\$$1 ;?;
    
    #number=$((number + 1))  into $number = $number + 1;
    #if($line =~ /(.*)=\$\(\((.*)\)\)/)
    #{
    #    $new = '$' . $1 . ' = ' . '$' . $2 . ';';
    #    $line =~ s?(.*)=\$\(\((.*)\)\)?$new?;
    #}
   
    #subset 1 
    
    $line =~ s?cd (.*)?chdir '$1';?;
    
    #dealing with for loop 
    $line =~ s?for (.*) in (.*) (.*) (.*)?foreach \$$1 ('$2', '$3', '$4') {?;
    $line =~ s?do[^a-z]??;
    $line =~ s?done?}?;
    
    #dealing with exit 
    $line =~ s?exit (\d)?exit $1;?;
    
    #dealing with read 
    $line =~ s?read (.*)?\$line = <STDIN>;\n    chomp \$line;?;
    
    #subset2   
    $line =~ s/\$([1-9][0-9]*)/'$ARGV[' . ($1 - 1) . ']'/ge;
    
 
    #subset3
    
    
    #filetest
    $line =~ s?if \[ -d (.*) \]?if (-d '$1') {?;
    $line =~ s?if test -r (.*)?if (-r '$1') {?;
    
    $line =~ s?if test -d (.*)?if(-d '$1') {?;
    $line =~ s?if test -r (.*)?if(-r '$1') {?;
    
    
    #handling while loop
    $line =~ s?while test (.*) -le (.*)?while ($1 <= $2) {?;
    $line =~ s?while test (.*) -lt (.*)?while ($1 < $2) {?;
    $line =~ s?while test (.*) -ne (.*)?while ($1 != $2) {?;
    
    
    if ($line =~ /'\$ARGV(.*)'/)
    {
        
        $temp = $line;
        $line =~ s?\'??g;
    }
    
    $line =~ s?&&?and?;
 
    
      
    
    print $line; 
}

    

    
    

