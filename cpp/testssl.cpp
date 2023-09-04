//test.cpp 代码样例
//g++ testssl.cpp $LDFLAGS $CPPFLAGS -std=c++11 -lcrypto
#include <openssl/ec.h>
#include <openssl/bn.h>
#include <openssl/obj_mac.h>
#include <openssl/sha.h>

void printBigNumber(const BIGNUM * a)
{
    char * str = BN_bn2dec(a);
    printf("%s",str);

    return;
}

void Sha256(const std::string input, uint8_t output[32]) {
    SHA256_CTX sha256;
    SHA256_Init(&sha256);
    SHA256_Update(&sha256, input.c_str(), input.size());
    SHA256_Final(output, &sha256);
};

int main()
{
    BIGNUM * p = BN_new();
    BN_dec2bn(&p,"13"); // 十进制串转 BIGNUM
    BN_CTX * ctx = BN_CTX_new();// ctx环境
    /*
     * BN_rand_range // 指定范围中选随机元素
     * BN_lshift 按比特左移
     * BN_mod_mul 模乘
     * BN_mod_exp 模幂 
	 */
    BN_CTX_free(ctx);
    BN_free(a);
}

