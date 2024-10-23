from Crypto.Cipher import SM4
from Crypto.Random import get_random_bytes
 
# 密钥生成
key = get_random_bytes(16)  # 128位密钥
 
# 加密数据
plaintext = b'Hello, SM4 decryption!'
cipher = SM4.new(key, SM4.MODE_ECB)
ciphertext = cipher.encrypt(plaintext)
 
# 解密数据
decrypted = cipher.decrypt(ciphertext)
 
print("Original:", plaintext)
print("Encrypted:", ciphertext)
print("Decrypted:", decrypted)
