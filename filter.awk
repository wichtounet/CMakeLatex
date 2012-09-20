#! /bin/awk -f

BEGIN {print "Latex";}

/^\(\.\// { sum += 1; next }
/^\(\// { sum += 1; next }
/^Writing index file/ { sum += 1; next }
/^No complaints by nag/ { sum += 1; next }
/^LaTeX Warning\: Marginpar on page/ { sum += 1; next }

/./ 

END{print "Latex finish, ignored ", sum, " statements"}
