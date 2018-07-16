import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Random;
 
public class CongruentialPublicKey {
	private static BigInteger Q, H, F, G;
 
	public BigInteger[] generatorQandH() {
		int alpha = 50;
		BigInteger g;
		Random r = new Random();
		BigInteger q = null;
		while (true) {
			q = BigInteger.probablePrime(alpha, r);
			if (q.bitLength() != alpha)
				continue;
			if (q.isProbablePrime(10)) // if q is prime ,contiune
			{
				Q = q.multiply(new BigInteger("2")).add(BigInteger.ONE);
				if (Q.isProbablePrime(10)) // if p is prime,then break
					break;
			}
		}
		while (true) {
			g = BigInteger.probablePrime(Q.bitLength() - 1, r);
			if (!g.modPow(BigInteger.ONE, Q).equals(BigInteger.ONE)
					&& !g.modPow(q, Q).equals(BigInteger.ONE)) {
				break;
			}
		}
 
		// Q = new BigInteger("122430513841");
		// 选择随机的F和G作为密钥
		BigInteger max = Q.divide(new BigInteger("2"));
		boolean flag_exit = true;
		F = (new BigDecimal(Math.random() + "").multiply(new BigDecimal(max)))
				.toBigInteger();
		// F = new BigInteger("231231");
		while (flag_exit) {
			if ((F.pow(2).subtract(max)).signum() < 0) {
				flag_exit = false;
			} else {
				F = (new BigDecimal(Math.random() + "")
						.multiply(new BigDecimal(F))).toBigInteger();
			}
		}
 
		BigInteger min = Q.divide(new BigInteger("4"));
		flag_exit = true;
		G = (new BigDecimal(Math.random() + "").multiply(new BigDecimal(Q)))
				.toBigInteger();
		// G = new BigInteger("195698");
		while (flag_exit) {
			if (G.pow(2).subtract(max).signum() < 0
					&& G.pow(2).subtract(min).signum() > 0
					&& F.gcd(G).equals(BigInteger.ONE)) {
				flag_exit = false;
			} else if (G.pow(2).subtract(max).signum() > 0)// only 满足这个
			{
				G = (new BigDecimal(G)).multiply(
						new BigDecimal(Math.random() + "")).toBigInteger();
			} else if (G.pow(2).subtract(min).signum() < 0)// 仅仅满足这个
			{
				G = (new BigDecimal(G)).divide(
						new BigDecimal(Math.random() + ""), 0).toBigInteger();
			}else if(!F.gcd(G).equals(BigInteger.ONE))//保证F,G互素
			{
				G = (new BigDecimal(G)).multiply(
						new BigDecimal(Math.random() + "")).toBigInteger();
			}
		}
 
		// 计算公钥H
		H = F.modInverse(Q).multiply(G).mod(Q);
		BigInteger[] temp = new BigInteger[2];
		temp[0] = Q;
		temp[1] = H;
		return temp;
	}
 
	public BigInteger encrypt(BigInteger m) {
		BigInteger e;
		BigInteger r = (new BigDecimal(F)).multiply(
				new BigDecimal(Math.random() + "")).toBigInteger();
		// r = new BigInteger("101010");
		e = r.multiply(H).add(m).mod(Q);
		return e;
	}
 
	public BigInteger decrypt(BigInteger e) {
		BigInteger a = F.multiply(e).mod(Q);
		// System.out.println(F.gcd(G));
		BigInteger b = (F.modInverse(G).multiply(a)).mod(G);
		return b;
	}
 
	public static void main(String args[]) {
		CongruentialPublicKey cpk = new CongruentialPublicKey();
		BigInteger[] PublicKey = cpk.generatorQandH();
		System.out.println("Alice：随机产生的公钥（q,h）：(" + PublicKey[0] + ","
				+ PublicKey[1] + ")");
 
		// Bob发送消息
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		System.out.println("Bob：请输入要发送的明文：");
		try {
			String str;
			BigInteger m = null;
			while ((str = br.readLine()) != null) {
				m = new BigInteger(str);
				if (m.pow(2).subtract(PublicKey[0].divide(new BigInteger("2")))
						.signum() < 0) {
					break;
				} else {
					System.out.println("您输入的明文过大，请重新输入！");
				}
			}
			System.out.println(cpk.decrypt(cpk.encrypt(m)));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
