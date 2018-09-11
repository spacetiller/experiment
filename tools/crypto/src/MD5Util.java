package com.ctfo.datastatic.util;

import java.security.MessageDigest;

//import org.apache.commons.logging.Log;
//import org.apache.commons.logging.LogFactory;

public class MD5Util {
	//private static Log log = LogFactory.getLog(MD5Util.class);
	
	private static final String md5Level1Key = "8f42d419021d";
	private static final String md5Level2Key = "7f815732c60c";
	
	public static String twiceMd5Encrypt(String str){
		String level1 = md5(str+md5Level1Key);
		//log.debug("encrypt string for "+str+" level1 is"+level1);
		String level2 = md5(level1+md5Level2Key);
		//log.debug("encrypt string for "+str+" level2 is"+level2);
		return level2;
	}
	
	private static String md5(String s){
		char hexDigits[]={'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};       
        try {
            byte[] btInput = s.getBytes();
            // 获得MD5摘要算法的 MessageDigest 对象
            MessageDigest mdInst = MessageDigest.getInstance("MD5");
            // 使用指定的字节更新摘要
            mdInst.update(btInput);
            // 获得密文
            byte[] md = mdInst.digest();
            // 把密文转换成十六进制的字符串形式
            int j = md.length;
            char str[] = new char[j * 2];
            int k = 0;
            for (int i = 0; i < j; i++) {
                byte byte0 = md[i];
                str[k++] = hexDigits[byte0 >>> 4 & 0xf];
                str[k++] = hexDigits[byte0 & 0xf];
            }
            return new String(str);
        } catch (Exception e) {
        	//log.error("do md5 encrypt has error",e);
        	return null;
        }
	}
}
