#
# Copyright (c) 2013 by Pureveg.  All Rights Reserved.
#
import bot_fx_btce

isBTC = True
isLTC = False

def main():
	bot = bot_fx_btce.bot(isBTC)
	bot.run()

if __name__ == '__main__':
	main()