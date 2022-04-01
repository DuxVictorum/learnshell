# Practice with Case structure conditionals

echo -en "You can have lunch with your favorite Greek or Roman epic poet. \nWhom do you pick?\t"
read poet

case $poet in
	"Homer") echo "Homer, huh? Back to the beginning, good.";;
	"Apollonius") echo "Alright, Hellenistic fun!";;
	"Vergil") echo "Roman epic, great stuff. Lacrima rerum, baby.";;
	"Ovid") echo "You want a change, I get it. Ovid's your man.";;
	"Lucan") echo "Now we're talking! Lucan's my main man.";;
	*) echo "Okay, you picked someone else (or something...). That's cool.";;
esac
