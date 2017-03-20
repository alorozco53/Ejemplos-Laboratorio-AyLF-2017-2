#!/bin/bash
# Author: AlOrozco53

printf "Executing "

case $1 in
	"ti" )
		# Matches times in hh:mm 24-hr format
		echo 'grep -E "([01][0-9]|2[0-3]):[0-5][0-9]"'
		grep -E "([01][0-9]|2[0-3]):[0-5][0-9]" $2 ;;
	"tup" )
		# Matches a k-dimensional tuple and returns a k+1-dimensional tuple with a 0 at the end
		echo 'sed -E "s/\(([^\(\)]*)\)/\(\1,0\)/g"'
		sed -E "s/\(([^\(\)]*)\)/\(\1,0\)/g" $2 ;;
	"voc" )
		# Matches strings with vocals
		echo 'grep -E "^(.*[aeiou].*)*$"'
		grep -E "^(.*[aeiou].*)*$" $2 ;;
	"er" )
		# wer --> the more w
		echo 'sed -E "s/\b(\w*)er\b/the more \1/g"'
		sed -E "s/\b(\w*)er\b/the more \1/g" $2 ;;
	"f1" )
		# Converts Spanish words to "f" language words; first version
		echo 'sed -E "s/([aeiou])/\1f\1/g"'
		sed -E "s/([aeiou])/\1f\1/g" $2 ;;
	"f2" )
		# Converts Spanish words to "f" language words; deals with diphthongs
		echo 'sed -E "s/([aeiou])?([aeiou])/\1f\1\2/g"'
		sed -E "s/([aeiou])?([aeiou])/\1\2f\2/g" $2 ;;
	"2l" )
		# Matches adjacent lines l1 and l2 such that l1 has a word beginning with pre- or psi-
		# and l2 has a word with a diphtongue or triphtonge
		echo 'pcregrep -M "(.*)\b(pre|psi)(.*)[\r\n](.*)[aeiou]{2,3}(.*)"'
		pcregrep -M "(.*)\b(pre|psi)(.*)[\r\n](.*)[aeiou]{2,3}(.*)" $2 ;;
	* )
		echo "ERREUR" ;;
esac
