#!/bin/bash

# Most popular pair of heroes

echo Most popular pair of heroes :

# There is no direction in the pairs (hero1, hero2) ie when you add a link in the csv file you enter it only once in one direction 
# or the other but not in both directions
# For example, if in a comic A, we have SpiderMan and CaptainAmerica and this pair is added with SpiderMan as hero1 and CaptainAmerica 
# as hero2. Then, we can have a comic B where they reappear together and this time the pair will be added with CaptainAmerica in hero1 
# and SpiderMan in hero2.
# But to do the count using command line, we need a direction.

# So, we get the links in the first direction (hero1->hero2)
cat heroNetworkModifiedv2.csv  >> full_hero_network_clean.csv

# Then, we get again all the links in the second direction (hero2->hero1)
cat heroNetworkModifiedv2.csv | awk -F ';' '{print $2,$1}' OFS=';'  >> full_hero_network_clean.csv

# In this way we can count the number of appearances of each link whatever the order in which it was recorded
sort full_hero_network_clean.csv | uniq -c | sort -n -r -k 1 | head -1

echo


# Number of comics per hero :

echo The number of comics per hero can be found in the file number_of_comics_per_hero.txt

# We get the column hero
# Then, we sort all the names because we need to group them before couting them with the command uniq
# Finally, we use the command uniq with its option c to get the number of time each hero appears ie the number of comics per hero
# We store these results in the file number_of_comics_per_hero.txt
cut -d';' -f1 edgesModifiedv2.csv | sort | uniq -c > number_of_comics_per_hero.txt

echo


# Average number of heroes in comics :

# - We first get the sum of number of heroes in each comic :
# We remove the first line which represents the attribute hero and comic with the command sed 1d
# We only get the first column that represents the heroes with the command cut
# We count the number of lines in the resulted column with the command wc and its option l
sum_n_heroes=$(sed 1d edgesModifiedv2.csv | cut -d';' -f1 | wc -l)

# - Then, we get the number of different comics :
# We use the same commands as previously
# But, this time, we ue the command sort with its command u to get the unique values of the comics column
n_comics=$(sed 1d edgesModifiedv2.csv | cut -d';' -f2 | sort -u | wc -l)

# We can now compute the average
echo "The average number of heroes in comics is :"
echo "scale=2; $sum_n_heroes/$n_comics" | bc
