#! /bin/awk -f

BEGIN {print "Latex start";}

# Ignore skipped lines
skip == 1 { skip = 0; sum += 1; next }

# Ignore lines with less than 6 chars
length($0) < 6 { sum += 1; next }

/^\(\.\// { sum += 1; next }
/^\(\// { sum += 1; next }
/^Writing index file/ { sum += 1; next }
/^No complaints by nag/ { sum += 1; next }
/^AED\: lastpage setting LastPage/ { sum += 1; next }
/^\[\]\[\]\[\]\[\]/ { sum += 1; next }
/<to be read again>/ { sum += 1; next }

# Ignore warnings
/^Package hyperref Warning:/ { sum += 1; skip = 1; next }
/^LaTeX Warning\: Citation/ { sum += 1; next }
/^LaTeX Warning\: Marginpar on page/ { sum += 1; next }

# Ignore overfull / underfull
/^Overfull \\hbox/ { sum += 1; skip = 1; next }
/^Underfull \\hbox/ { sum += 1; skip = 1; next }
/^Overfull \\vbox/ { sum += 1; next }
/^Underfull \\vbox/ { sum += 1; next }

/./ 

END{print "Latex finish, ignored ", sum, " statements"}
