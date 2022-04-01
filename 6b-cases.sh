# Practice with Case structure conditionals

poet=$1

case $poet in
	"Homer") echo "Homer, huh? Back to the beginning, good.";;
	"Apollonius") echo "Alright, Hellenistic fun!";;
	"Vergil") echo "Roman epic, great stuff. Lacrima rerum, baby.";;
	"Ovid") echo "You want a change, I get it. Ovid's your man.";;
	"Lucan") echo "Now we're talking! Lucan's my main man.";;
	*) echo "Okay, you picked someone else (or something...). That's cool.";;
esac
