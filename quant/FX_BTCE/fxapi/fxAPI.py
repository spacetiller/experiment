#coding=utf-8
#
# Copyright (c) 2013 by Pureveg.  All Rights Reserved.
#
import urllib2
import json
from decimal import Decimal

btc_link   = 'https://data.fxbtc.com/api?op=query_depth&symbol=btc_cny'
ltc_link   = 'https://data.fxbtc.com/api?op=query_depth&symbol=ltc_cny'
symbol_LTC = 'ltc_cny'
symbol_BTC = 'btc_cny'
API_URL    = 'https://trade.fxbtc.com/api'



"""FXAPI"""
class FX_TradeAPI(object):
	def __init__(self, isBTC, userName, passWord):
		super(FX_TradeAPI, self).__init__()
		self.username = userName
		self.password = passWord
		self.token	  = None
		self.isBTC    = isBTC
		self.default_symbol = symbol_BTC if isBTC else symbol_LTC
	
	def _postJSON(self, param):
		req  = urllib2.Request(API_URL,data = json.dumps(param))
		res  = json.loads(urllib2.urlopen(req).read())
		success = res.get(u'result')
		if success is not True:
			return False
		return res

	# 获取凭证
	def get_token(self):
		dataJSON = {'op' : "get_token", 'username' : self.username, 'password' : self.password}
		res = self._postJSON(dataJSON)
		if res is False:
			raise Exception("Can not get token")
		self.token = res.get(u'token')

	# 如果凭证为空，获取凭证
	def get_token_if_none(self):
		if self.token is None:
			self.get_token()

	# 检测凭证
	def token_check(self):
		if self.token is None:
			raise Exception("Has no token")
		dataJSON = {'token' : self.token, 'op' : 'check_token'}
		res = self._postJSON(dataJSON)
		return res.get(u'result')

	# 获取个人信息，需要进一步解析
	def get_info(self):
		self.get_token_if_none()
		dataJSON = {'token' : self.token, 'op' : 'get_info'}
		res = self._postJSON(dataJSON)
		return res

	# 从个人信息中解析出 余额信息
	def get_balance(self, symbol):
		res = self.get_info().get(u'info')
		if res is not False:
			funds = res.get(u'funds') 
			free  = funds.get(u'free')
			return Decimal(free[symbol])

	# 获取挂单信息，需要进一步解析
	def get_order(self):
		self.get_token_if_none()
		dataJSON = {'token' : self.token, 'op' : 'get_orders', 'symbol' : self.default_symbol}
		res = self._postJSON(dataJSON)
		return res

	# 取消挂单，返回单号id
	def cancel_order(self, id):
		self.get_token_if_none()
		dataJSON = {'token' :self.token, 'op' : 'cancel_order', 'symbol' : self.default_symbol, 'id' : id}
		res = self._postJSON(dataJSON)
		if res.get(u'result'):
			return res.get(u'id')
		return False

	# 取消所有挂单
	def cancel_order_all(self):
		all_orders = self.get_order().get(u'orders')
		for orders in all_orders:
			self.cancel_order(orders.get(u'id'))

	# 交易： 买入
	def trade_buy(self, rate, volume):
		self.get_token_if_none()
		dataJSON = {'token':self.token,
					'op':'trade',
					'symbol':self.default_symbol,
					'type':'buy',
					'rate':rate,
					'vol':volume
					}

		res = self._postJSON(dataJSON)
		if res is False:
			return False
		return	self.parse_trade_result(res)

	# 交易： 卖出
	def trade_sell(self, rate, volume):
		self.get_token_if_none()
		dataJSON = {'token':self.token,
					'op':'trade',
					'symbol':self.default_symbol,
					'type':'sell',
					'rate':rate,
					'vol':volume
					}
					
		res = self._postJSON(dataJSON)
		if res is False:
			return False
		return self.parse_trade_result(res)		

	# 显示 成交情况， 返回 成交价，成交量，未成交价，未成交量，未成交单号
	def parse_trade_result(self, result):
		traded_order = result.get(u'trade_info').get(u'traded_orders')
		
		if len(traded_order) == 0:
			return
		traded_rate  = Decimal(traded_order[0].get(u'rate'))
		traded_vol   = Decimal(traded_order[0].get(u'vol'))
		if traded_vol > 0:
			print u'已成交--> 价格:%.4f  量:%.4f' % (traded_rate, traded_vol)
		
		limit_order  = result.get(u'trade_info').get(u'limit_orders')
		if len(limit_order) > 0:
			limit_rate   = Decimal(limit_order[0].get(u'rate'))
			limit_vol    = Decimal(limit_order[0].get(u'vol'))
			limit_id     = limit_order[0].get(u'id')
			print u'未成交--> 价格:%.4f  量:%.4f  单号id:%s' % (limit_rate , limit_vol, limit_id)

	# 返回 买卖单 list ，[[rate,vol],[rate,vol],....]
	def get_depth(self, min_vol):
		try:
			request = urllib2.Request(btc_link if self.isBTC else ltc_link)
			depth_response = json.loads(urllib2.urlopen(request).read())
			return self.parse_depth(depth_response, min_vol)
		except Exception, e:
			raise Exception("FXBTC Depth No Response")
			return False

	def parse_depth(self, depth, min_vol):
		if type(depth) is not dict:
			raise Exception("Not a dict")
		sell_order, buy_order = depth.get(u'depth').get(u'asks'), depth.get(u'depth').get(u'bids')

		if type(sell_order) is not list or type(buy_order) is not list:
			raise Exception("Not a list")

		sell_vol  = 0
		buy_vol   = 0
		sell_list = []
		buy_list  = []

		for i in xrange(0,100):
			is_done = True
			if sell_vol < min_vol:
				sell_vol  += sell_order[i].get(u'vol')
				temp_list = [sell_order[i].get(u'rate'),sell_order[i].get(u'vol')]
				sell_list.append(temp_list)
				is_done = False

			if buy_vol < min_vol:
				buy_vol  += buy_order[i].get(u'vol')
				temp_list = [buy_order[i].get(u'rate'),buy_order[i].get(u'vol')]
				buy_list.append(temp_list)
				is_done = False

			if is_done:
				return sell_list, buy_list
		return False
