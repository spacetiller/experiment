h  
{  
s/.*is \(.*\) and .*/\1/  
y/abcde/ABCDE/
G  
s/\(.*\)\n\(.*is \).*\(and \).*\(is \)\(.*\)/\2\5 \3\5 \4\1/  
}
