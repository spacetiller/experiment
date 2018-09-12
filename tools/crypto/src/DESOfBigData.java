package com.ctfo.datastatic.util;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
import javax.crypto.spec.IvParameterSpec;

//import org.apache.commons.logging.Log;
//import org.apache.commons.logging.LogFactory;


public class DESOfBigData {
	//private static Log log = LogFactory.getLog(DESOfBigData.class);
	
	// 解密数据
	private final static String PUBLICKEY = "GP9LI6QN";// 公共秘钥
//	private final static String PUBLICKEY = "CTFOTRV1";// 公共秘钥车辆中心
//	private final static String PUBLICKEY = ResourceBundle.getBundle("conf").
//			getString("PUBLICKEY");

	/**
	 * 输入解密的信息与解密的编码规则，返回解密后的字符串
	 * @param message 待解密消息
	 * @param key 编码
	 * @return 解密后字符串
	 * @throws Exception
	 */
	private static String decrypt(String message, String key) throws Exception {
//		log.info("decrypt message is: "+message);
		byte[] bytesrc = convertHexString(message);
		Cipher cipher = Cipher.getInstance("DES/CBC/PKCS5Padding");
		DESKeySpec desKeySpec = new DESKeySpec(key.getBytes("UTF-8"));
		SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
		SecretKey secretKey = keyFactory.generateSecret(desKeySpec);
		IvParameterSpec iv = new IvParameterSpec(key.getBytes("UTF-8"));

		cipher.init(Cipher.DECRYPT_MODE, secretKey, iv);

		byte[] retByte = cipher.doFinal(bytesrc);
		return new String(retByte);
	}

	/**
	 * 指定编码对字符串进行加密
	 * @param message 待加密消息
	 * @param key 编码
	 * @return 加密后数据
	 * @throws Exception
	 */
	private static byte[] encrypt(String message, String key) throws Exception {
		Cipher cipher = Cipher.getInstance("DES/CBC/PKCS5Padding");

		DESKeySpec desKeySpec = new DESKeySpec(key.getBytes("UTF-8"));

		SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
		SecretKey secretKey = keyFactory.generateSecret(desKeySpec);
		IvParameterSpec iv = new IvParameterSpec(key.getBytes("UTF-8"));
		cipher.init(Cipher.ENCRYPT_MODE, secretKey, iv);

		return cipher.doFinal(message.getBytes("UTF-8"));
	}
	/**
	 * 把待解密字符串转换为字节数组
	 * @param ss 待解密信息
	 * @return 字节数组
	 */
	private static byte[] convertHexString(String ss) {
		byte digest[] = new byte[ss.length() / 2];
		for (int i = 0; i < digest.length; i++) {
			String byteString = ss.substring(2 * i, 2 * i + 2);
			int byteValue = Integer.parseInt(byteString, 16);
			digest[i] = (byte) byteValue;
		}
		return digest;
	}

	/**
	 * 对外提供加密方法，默认为 UTF-8编码格式
	 * @param message 待加密信息
	 * @return 加密后的字符串
	 */
	public static String encrypt(String message) {
		if (message == null || message.trim().length() == 0) {
			System.err.println("message is  empty");
			return null;
		}
		try {
			String mw = toHexString(encrypt(message, PUBLICKEY)).toUpperCase();
			return mw;
		} catch (Exception e) {
		//	log.error("encrypt to des data error",e);
			return null;
		}
	}

	/**
	 * 对外提供的解密方法，默认为UTF-8 解密
	 * @param ciphertext 待解密字符串
	 * @return 解密后信息
	 * @throws Exception
	 */
	public static String decrypt(String ciphertext) throws Exception {
		try {
			String clearText = decrypt(ciphertext, PUBLICKEY);
			return clearText;
		} catch (Exception e) {
		//	log.error("ciphertext is error or null ciphertext is: "+ciphertext,e);
			return null;
		}
	}

	/**
	 * 数据加密方法
	 * @param b 待加密的字节数组
	 * @return 加密后的字符串
	 */
	private static String toHexString(byte b[]) {
		StringBuffer hexString = new StringBuffer();
		for (int i = 0; i < b.length; i++) {
			String plainText = Integer.toHexString(0xff & b[i]);
			if (plainText.length() < 2)
				plainText = "0" + plainText;
			hexString.append(plainText);
		}
		return hexString.toString();
	}

	public static void main(String[] args) throws Exception {
		String value = "C2C72C4BD1B18B4B16FE896986C1ABA5E32E4D4F75CE604C945273CFCD3486684974395142ABF3B61E3C81F83DE59E09CB618CCCEBCCCB105F162497914AA7F152CD07437C4BF82D86EF3EC550ABF5B094CE7CF4D1525D5C3021846F287D1A403289D99750D31CE7C6D8CC0043E50EE217A226F4548F3CFE1A78822CDBC577913730C79A6F199DEC44EC056477476C22EAE23309193221BC12853C6DCAACC5402E89E252B705123628A7825290772EA104732893BFD5DB46CAD681FC9ED1CBECF76F3D08256135582CF09CFEF82F4D6B381A698A57E432B57E9B77110595FEEF5EAD4A35E803FBF6ED2693BD398C17734FD5746FB22E08997179523EB8E848CF22A6A50CEAB200800B49DE8C508B96DF71790223F7D38B7D4DA12D0D684A8AE9144BC60CA6737D5D8A701988DB45118BB9BD45606F0E5A83B56DA6B6E2552F42367803B2CC1B0BFCC2219CEFE3699E6207988CD657935CB7626D689D444FAE9B6253CE2462DD815B0230F23BFB021F73858B1C40CFB367E4750604969FC726838DC0B2730EA07B47B21E4517D7A0B157B97CF937FAE8493D98F6D0D4E6265E8C3277E353C362990FD4817CC9CDEE8B8D4DF52A42476B878BAB4DCE606EBB9D462F01F52A8612FF36D273A95DAD87E2D08ED28C9D57A347E20E96E1B51E4364BB229C8E34318E421F85D9D5BA34A7F232E29D3CEDA14872867B1ED66B451C27D14F646F714AB85AFEC0439DEDBAB8F312299887EE6DC02D430FF4C8C2DB2A8094BD52757DABAB6035D2913705506A1FA68F66B4F5AD948990A64CE86C2EF34017702B80668D91CDBB55B09AC5317AB0BFAA61912B98934255A9C5FF92E3E8556D5AF98EA3DDE7BCE9BC5298FDAE0985CCAFFF912BA6A8162ECDE68EC8020538520E07384C72AF2F60FF995636B2A5F2906F50B69A63CCDD3B803EDA0EE1E9FCD8DD7407A2B1676B42A32DAB0C0B10A117305A72C658198A6DEE170649BCFC27D21C2AD4E736F837BB40A3026D40F7E452B2974D17D2E90C672562153D35EDDE0CA1FA3D01114A8AA5F4F2BE5DD4E4365978E3FD79565CDAB8BD46E86C36363215850875418DFA19588BBE2A74C317653F429DC090EDC46CCE5395DBBE83CE0947";
		// String ttt = encrypt(value);
		// System.out.println("加密后的数据为:" + ttt);
		System.out.println("解密后的数据 :" + decrypt(value));
	}
}
