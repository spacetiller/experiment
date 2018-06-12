import hashlib
MD5_SALT = "8f52d4e2c60a"
def generateP4ID(astring):
	ss = astring
	sl = len(ss)
	s5 = ''
	if sl < 12:
		ss = MD5_SALT[:6] + ss + MD5_SALT[-6:]	
	else:
		ss = MD5_SALT[:6] + ss + ss[-6:]	
	s5 = hashlib.md5(ss).hexdigest()
	return s5[8:24]