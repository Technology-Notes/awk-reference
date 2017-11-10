# We need to extract the list of file names from the `7z l` output.
#
# Run as `awk -f 7z_list.awk 7z_list.txt`

# It works by setting the variable p to true (1) when the first line with "-----" appears, 
# and the {printf $NF} block only executes if p is true.
# So we skip the header and when we get to the footer, "-----" appears again and `p` is reset
# back to false (0).
/----/ {p = ++p % 2; print "p: ", p; next}
$NF == "Name" {pos = index($0,"Name")}
p {print p, substr($0,pos)}
