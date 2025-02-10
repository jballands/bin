if [ $# -eq 0 ]; then
	lsof -iTCP -sTCP:LISTEN -n -P
elif [ $# -eq 1 ]; then
	lsof -iTCP -sTCP:LISTEN -n -P | grep -i --color $1
else
	echo "Usage: listening [pattern]"
fi
