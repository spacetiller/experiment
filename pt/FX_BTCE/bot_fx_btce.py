#coding=utf-8
#
# Copyright (c) 2013 by Pureveg.  All Rights Reserved.
#
import btceapi
import fxapi
from json import dumps
import time
import sys
import config as conf
from decimal import Decimal

isBUY  = True
isSELL = False

class bot(object):
	"""Auto Run Bot"""
	def __init__(self, isBTC):
		self.min_vol = conf.MIN_VOL_BTC if isBTC else conf.MIN_VOL_LTC
		self.isBTC = isBTC
		self.btce = btceapi.btce_Trade(isBTC, conf.BTC_api_key, conf.BTC_api_secret)		
		self.fx   = fxapi.FX_TradeAPI(isBTC, conf.FXBTC_USERNAME, conf.FXBTC_PASSWORD)

	def run(self):
		while True:
			
			self.btce_bal_coin = self.btce.get_balance('btc' if self.isBTC else 'ltc')
			self.btce_bal_fiat = self.btce.get_balance('usd')
			self.fx_bal_coin   = self.fx.get_balance('btc' if self.isBTC else 'ltc')
			self.fx_bal_fiat   = self.fx.get_balance('cny')
			print u'BTCE--- USD: %.4f  币: %.4f' % (self.btce_bal_fiat, self.btce_bal_coin)
			print u'FX----- CNY: %.4f  币: %.4f' % (self.fx_bal_fiat, self.fx_bal_coin)
#			print u'BTC-E--- LTC余额： %.4f' % btce_bal_ltc
#			_, _, fx_bal_ltc   = self.fx.get_balance()
#			print u'FX   --- LTC余额:  %.4f' % fx_bal_ltc
#
			btce_sell, btce_buy = self.btce.get_depth(self.min_vol)
			print u'BTCE卖单情况' , dumps(btce_sell, indent=4), u'买单情况', dumps(btce_buy,indent=4)
			fx_sell, fx_buy     = self.fx.get_depth(self.min_vol)
			print u'FX卖单情况' , dumps(fx_sell, indent=4), u'买单情况', dumps(fx_buy,indent=4)

			self.compare_fxBid_btceAsk(fx_buy, btce_sell)
			self.compare_btceBid_fxAsk(btce_buy, fx_sell)

			cur_t = time.time()
			while time.time() < cur_t + conf.INTERVAL:
				sys.stdout.write('.')
				sys.stdout.flush()
				time.sleep(0.2)
			print 
			print
			print

	def compare_fxBid_btceAsk(self, bidList, askList):
		rate_bid, vol_bid = [], []
		sum_bid = 0
		sell_rate = 0
		for i in xrange(0,len(bidList)):
			rate_bid.append(bidList[i][0])
			sell_rate = bidList[i][0]
			if i != len(bidList) - 1:
				vol_bid.append(bidList[i][1])
			else:
				temp_vol = sum(vol_bid)
				vol_bid.append(self.min_vol - temp_vol)
			sum_bid += rate_bid[i] * vol_bid[i]
		print u'FX-----买量 %.4f, 卖币、扣除手续费可得 %.4f CNY' % (self.min_vol, sum_bid * 0.998)

		sum_ask = 0
		rate_ask, vol_ask = [], []
		buy_rate = 0
		for i in xrange(0,len(askList)):
			rate_ask.append(askList[i][0])
			buy_rate = askList[i][0]
			if i != len(askList) - 1:
				vol_ask.append(askList[i][1])
			else:
				temp_vol = sum(vol_ask)
				vol_ask.append(self.min_vol / 0.998 - temp_vol)
			sum_ask += rate_ask[i] * vol_ask[i]
		print u'BTCE---卖量 %.4f, 买币、扣除手续费需要 %.4f USD' % (self.min_vol / 0.998, sum_ask)

		ratio = float(sum_bid * 0.998 / sum_ask)
		print u'FX卖掉币，BTCE买回币，汇率为%.8f' % ratio
		
		if ratio > conf.USD_TO_CNY:
			if Decimal(self.fx_bal_coin) > Decimal(self.min_vol) and Decimal(self.btce_bal_fiat) > Decimal(sum_ask):
				self.fx.trade_sell(sell_rate, self.min_vol)
				self.btce.trade(isBUY, buy_rate, self.min_vol / 0.998)
		 		print u'汇率大于%.4f，正在进行搬砖...' % conf.USD_TO_CNY
			else:
				print u'余额不足....'			
		else:
		 	print u'汇率不够大，继续等待....'
		 
		
	def compare_btceBid_fxAsk(self, bidList, askList):
		rate_bid, vol_bid = [], []
		sum_bid = 0
		sell_rate = 0
		for i in xrange(0,len(bidList)):
			rate_bid.append(bidList[i][0])
			sell_rate = bidList[i][0]
			if i != len(bidList) - 1:
				vol_bid.append(bidList[i][1])
			else:
				temp_vol = sum(vol_bid)
				vol_bid.append(self.min_vol - temp_vol)
			sum_bid += rate_bid[i] * vol_bid[i]
		print u'BTCE---买量 %.4f, 卖币、扣除手续费可得 %.4f USD' % (self.min_vol, sum_bid * 0.998)

		sum_ask = 0
		rate_ask, vol_ask = [], []
		buy_rate = 0
		for i in xrange(0,len(askList)):
			rate_ask.append(askList[i][0])
			buy_rate = askList[i][0]
			if i != len(askList) - 1:
				vol_ask.append(askList[i][1])
			else:
				temp_vol = sum(vol_ask)
				vol_ask.append(self.min_vol - temp_vol)
			sum_ask += rate_ask[i] * vol_ask[i]
		print u'FX-----卖量 %.4f, 买币、扣除手续费需要 %.4f CNY' % (self.min_vol, sum_ask / 0.998)

		ratio = float(sum_ask / 0.998 / sum_bid)
		print u'BTCE卖掉币，FX买回币，汇率为%.8f' % ratio
		
		if ratio < conf.CNY_TO_USD:
			if Decimal(self.fx_bal_fiat) > Decimal(sum_ask / 0.998) and Decimal(self.btce_bal_coin) > Decimal(self.min_vol):
				self.btce.trade(isSELL, sell_rate, self.min_vol)
				self.fx.trade_buy(buy_rate, self.min_vol)
			 	print u'汇率小于%.4f，正在进行搬砖...' % conf.CNY_TO_USD
			else:
				print u'余额不足....'
		else:
		 	print u'汇率不够小，继续等待....'