#!/usr/bin/awk -f

# The first line contains the beginning balance. 
# Each of the other lines represent information from a single check: the check number, a description of where it was spent, and the amount of the check. 
# The core task of the script is that it must get the beginning balance and 
# then deduct the amount of each check from that balance. 
# We can provide detail lines for each check to compare against the check register. 
# Finally, we can print the ending balance.
#
# Run with: awk -f checkbook2.awk checkbook.txt
BEGIN { FS="\t" }

NR == 1 {
    balance=$1; 
    print "Initial balance: ", balance;
    next  # get the next record and start over (don't proceed with next rule)
}
5 { balance += $3 }
END { print "Final balance: ", balance }
