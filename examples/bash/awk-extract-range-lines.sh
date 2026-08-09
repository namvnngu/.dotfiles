awk '
/#include <\.\.\.> search starts here:/ { p=1; next }
/End of search list/ { p=0 }
p { gsub(/^[ \t]+/, ""); print }
' < file.txt
