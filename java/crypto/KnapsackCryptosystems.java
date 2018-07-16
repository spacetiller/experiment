import java.math.BigDecimal;
import java.math.BigInteger;
 
public class KnapsackCryptosystems {
	private final int MAX = 10;
	BigInteger[] SuperSet = new BigInteger[MAX];
	BigInteger[] PublicKeySet = new BigInteger[MAX];// 公钥
	BigInteger A, B;
 
	public void GenerateSetAndPublicKey() {
		SuperSet[0] = (new BigDecimal("10").multiply(new BigDecimal(Math
				.random() + "")).add(BigDecimal.ONE)).toBigInteger();
		for (int i = 1; i < MAX; i++) {
			SuperSet[i] = (SuperSet[i - 1].multiply(new BigInteger("2"))
					.add(new BigDecimal("10")
							.multiply(new BigDecimal(Math.random() + ""))
							.add(BigDecimal.ONE).toBigInteger()));
		}
		B = (SuperSet[MAX - 1].multiply(new BigInteger("2"))
				.add(new BigDecimal("10")
						.multiply(new BigDecimal(Math.random() + ""))
						.add(BigDecimal.ONE).toBigInteger()));
 
		A = SuperSet[MAX - 1];
		while (true) {
			A = A.subtract(BigInteger.ONE);
			if (B.gcd(A).equals(BigInteger.ONE)) {
				break;
			}
		}
		for (int i = 0; i < MAX; i++) {
			PublicKeySet[i] = A.multiply(SuperSet[i]).mod(B);
		}
	}
 
	public BigInteger encrypt(String x) {
		BigInteger S = BigInteger.ZERO;
		for (int i = x.length(); i < MAX; i++) {
			x = x.concat("0");
		}
 
		for (int i = 0; i < MAX; i++) {
			if (x.charAt(i) == '1')
				S = S.add(PublicKeySet[i]);
		}
		return S;
	}
 
	public String decrypt(BigInteger S) {
		BigInteger S1;
		String x = "";
		S1 = A.modInverse(B).multiply(S).mod(B);
		int num = MAX;
		while (true) {
			if (S1.subtract(SuperSet[num - 1]).signum() > 0) {
				S1 = S1.subtract(SuperSet[num - 1]);
				x = "1".concat(x);
			} else if (S1.subtract(SuperSet[num - 1]).signum() == 0) {
				x = "1".concat(x);
				break;
			} else {
				x = "0".concat(x);
			}
			num--;
		}
		if (num != 0) {
			for (int i = 0; i < num - 1; i++)
				x = "0".concat(x);
		}
		return x;
 
	}
 
	public static void main(String args[]) {
		KnapsackCryptosystems kc = new KnapsackCryptosystems();
		kc.GenerateSetAndPublicKey();
		System.out.println("随机产生的公钥：");
		System.out.print("(");
		for (int i = 0; i < kc.MAX - 1; i++)
			System.out.print(kc.PublicKeySet[i] + ",");
		System.out.println(kc.PublicKeySet[kc.MAX - 1] + ")");
		// 随机产生5组消息
		for (int j = 0; j < 5; j++) {
			String x = "";
			for (int i = 0; i < kc.MAX; i++) {
				if (Math.random() < 0.5) {
					x = x.concat("1");
				} else
					x = x.concat("0");
			}
			// 加密x信息，得到密文S
			System.out.println("第" + (j + 1) + "组随机产生的明文： " + x);
			String S = kc.encrypt(x).toString();
			System.out.println("加密得到的密文：" + S);
			System.out.println("解密得到的明文" + kc.decrypt(new BigInteger(S)));
		}
	}
}