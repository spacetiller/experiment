#coding=utf-8
#
# Copyright (c) 2013 by Pureveg.  All Rights Reserved.
#
import httplib
import urllib
import json
import hashlib
import hmac
import time
import datetime
from decimal import Decimal
import urllib2


pair_BTC = 'btc_usd'
pair_LTC = 'ltc_usd'

btc_link = 'https://btc-e.com/api/2/btc_usd/depth'
ltc_link = 'https://btc-e.com/api/2/ltc_usd/depth'

isBTC  = True
isLTC  = False

isBUY  = True
isSELL = False

class btce_Trade(object):
	"""BTC-E交易"""
	def __init__(self, isBTC, api_key, api_secret):
		self.key = api_key
		self.sec = api_secret
		self.isBTC = isBTC

	def make_params_header(self, method, params = {}):
		# Come up with your own method for choosing an incrementing nonce
		now = datetime.datetime.now()
		nonce = int(time.mktime(now.timetuple()))
		
		# method name and nonce go into the POST parameters
		params['nonce'] = nonce
		params['method']= method
		params = urllib.urlencode(params)

		# Hash the params string to produce the Sign header value
		H = hmac.new(self.sec , digestmod=hashlib.sha512)
		H.update(params)
		sign = H.hexdigest()
		 
		headers = {
						"Content-type": "application/x-www-form-urlencoded",
						"Key": self.key,
						"Sign":sign
				   }
		return [params, headers]

	def get_response(self, args):
		conn = httplib.HTTPSConnection("btc-e.com")
		conn.request("POST", "/tapi", args[0], args[1])
		res = json.load(conn.getresponse())
		if res['success'] != 1:
			return False
		return res['return']

	def get_info(self):
		return self.get_response(self.make_params_header("getInfo"))
		
	def get_balance_usd(self):
		return self.get_info()['funds']['usd']

	def get_balance(self, symbol):
		return self.get_info()['funds'][str(symbol)]

	def trade(self, isBUY, rate, amount):
		pair = "btc_usd" if self.isBTC else "ltc_usd"
		typ  = "buy" if isBUY else "sell"
		rate = round(rate,3)
		amount = round(amount,1)
		return self.get_response(self.make_params_header("Trade",{'pair' : pair, 'type' : typ, 'rate' : rate, 'amount' : amount}))	

	def cancel_order(self, oid):
		return self.get_response(self.make_params_header("CancelOrder", { 'order_id' : oid}))

	def cancel_all(self):
                for oid in self.order_list().keys():
                        res = self.cancel_order(oid)
			if res is not False:
			 	print res['order_id'] 

	def trans_history(self):
		return self.get_response(self.make_params_header("TransHistory"))

	def trade_history(self):
		return self.get_response(self.make_params_header("TradeHistory"))

	def order_list(self):
		return self.get_response(self.make_params_header("OrderList"))

	def get_depth(self, min_vol):
		api_link = btc_link if self.isBTC else ltc_link
		try:
			request = urllib2.Request(btc_link if self.isBTC else ltc_link)
			depth_response = json.loads(urllib2.urlopen(request).read())
			return self.parse_depth(depth_response, min_vol)
		except Exception, e:
			raise Exception("BTCE Depth No Response")
			return False

	def parse_depth(self, depth, min_vol):
		if type(depth) is not dict:
			raise Exception("BTCE depth not a dict")
		sell_list, buy_list = depth['asks'], depth['bids']

		if type(sell_list) is not list or type(buy_list) is not list:
			raise Exception("BTCE ask/bid not a list")

		sell_vol, buy_vol = 0, 0
		temp_sell_list, temp_buy_list = [], []

		for i in xrange(0,100):
			is_done = True
			if sell_vol < min_vol:
				sell_vol += sell_list[i][1]
				temp_sell_list.append(sell_list[i])
				is_done = False

			if buy_vol < min_vol:
				buy_vol += buy_list[i][1]
				temp_buy_list.append(buy_list[i])
				is_done = False

			if is_done:
				return temp_sell_list, temp_buy_list

		return False


## For test
#def main():
#	a = btce_Trade(isBTC)
#	print_response(a.get_info())
#	print_response(a.order_list())
#	print type(a.order_list()[0])
#	print a.get_balance_ltc()
#	print_response(a.trade_history())
#	print_response(a.trans_history())
#	for i in xrange(1,1000):
#		print_response(a.trade(False, False, 2.585 + 0.01 * i, 1))
#		time.sleep(5)
#        a.cancel_all()
#	s, b = a.get_depth(10)
#	print json.dumps(b,indent=4)

#def print_response(args):
#	print json.dumps(args,indent=4)
#
#if __name__ == '__main__':
#	main()
