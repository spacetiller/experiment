echo "foo foo quux labs foo bar quux" | ./map-wc.py

echo "foo foo quux labs foo bar quux" | ./map-wc.py | sort -k1,1 | ./red-wc.py
