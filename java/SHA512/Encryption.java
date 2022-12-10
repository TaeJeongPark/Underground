package SHA512;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;


public class Encryption {
	// Salt 생성
		public static String Salt() {

			String salt = ""; //난수 값

			try {
				SecureRandom random = SecureRandom.getInstance("SHA1PRNG");
				byte[] bytes = new byte[16]; //생성 하여 받음
				random.nextBytes(bytes);
				salt = new String(Base64.getEncoder().encode(bytes));
			} catch (NoSuchAlgorithmException e) {
				System.out.println("난수 생성 오류");
				e.printStackTrace();
			}

			return salt;

		}

		// SHA512 암호화
		public static String SHA512(String password, String hash) {

			String salt = hash + password; //암호화를 위한 준비
			System.out.println("salt : " + salt);
			String hex = null;

			try {
				MessageDigest msg = MessageDigest.getInstance("SHA-512");
				msg.update(salt.getBytes());

				hex = String.format("%128x", new BigInteger(1, msg.digest()));
			} catch (Exception e) {
				System.out.println("암호화 오류");
				e.printStackTrace();
			}

			return hex;

		}
		
		public static void main(String[] args) {
			String result = SHA512("450","2bQ9ehRuUg3klfG7gHC4XQ==" );
			System.out.println("result : " + result);

		}

}
