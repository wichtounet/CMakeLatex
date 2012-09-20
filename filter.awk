#! /bin/awk -f

BEGIN {print "Latex start";}

length($0) < 6 { sum += 1; next }
/^\(\.\// { sum += 1; next }
/^\(\// { sum += 1; next }
/^Writing index file/ { sum += 1; next }
/^No complaints by nag/ { sum += 1; next }
/^LaTeX Warning\: Marginpar on page/ { sum += 1; next }
/^AED\: lastpage setting LastPage/ { sum += 1; next }
/^\[\]\[\]\[\]\[\]/ { sum += 1; next }
/<to be read again>/ { sum += 1; next }

/^Overfull \\hbox/ { sum += 1; next }
/^Underfull \\hbox/ { sum += 1; next }

/./ 

END{print "Latex finish, ignored ", sum, " statements"}
