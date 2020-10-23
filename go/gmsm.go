package main_test

import (
    "bytes"
    "crypto/cipher"
    "fmt"
    "github.com/tjfoc/gmsm/sm2"
    "github.com/tjfoc/gmsm/sm3"
    "github.com/tjfoc/gmsm/sm4"
    "log"
    "testing"
)

func Test_SM3(t *testing.T)  {
    date := "hello world"
    s:= sm3.New()
    s.Write([]byte(date))
    sum := s.Sum(nil)
    fmt.Println(sum)
    fmt.Printf("%x\n",sum)
}

func Test_SM4(t *testing.T)  {
    // SM4私钥只支持16bit
    key := []byte("helloworldhellow")
    iv := make([]byte, sm4.BlockSize)
    data := []byte("Tongji Fintech Research Institute")
    ciphertxt,err := sm4Encrypt(key,iv, data)
    if err != nil{
        log.Fatal(err)
    }
    fmt.Printf("加密结果: %x\n", ciphertxt)
    fmt.Println(ciphertxt,len(ciphertxt))
    data,err = sm4Decrypt(key,iv,ciphertxt)
    if err != nil{
        log.Fatal(err)
    }
    fmt.Printf("加密结果: %s\n", data)
}

func sm4Encrypt(key, iv, plainText []byte) ([]byte, error) {
    block, err := sm4.NewCipher(key)
    if err != nil {
        return nil, err
    }
    blockSize := block.BlockSize()
    origData := pkcs5Padding(plainText, blockSize)
    blockMode := cipher.NewCBCEncrypter(block, iv)
    cryted := make([]byte, len(origData))
    blockMode.CryptBlocks(cryted, origData)
    return cryted, nil
}

func sm4Decrypt(key, iv, cipherText []byte) ([]byte, error) {
    block, err := sm4.NewCipher(key)
    if err != nil {
        return nil, err
    }
    blockMode := cipher.NewCBCDecrypter(block, iv)
    origData := make([]byte, len(cipherText))
    blockMode.CryptBlocks(origData, cipherText)
    origData = pkcs5UnPadding(origData)
    return origData, nil
}
// pkcs5填充
func pkcs5Padding(src []byte, blockSize int) []byte {
    padding := blockSize - len(src)%blockSize
    padtext := bytes.Repeat([]byte{byte(padding)}, padding)
    return append(src, padtext...)
}

func pkcs5UnPadding(src []byte) []byte {
    length := len(src)
    if(length==0){
        return nil
    }
    unpadding := int(src[length-1])
    return src[:(length - unpadding)]
}

func Test_SM2(t *testing.T)  {
    priv, err := sm2.GenerateKey() // 生成密钥对
    if err != nil {
        log.Fatal(err)
    }
    msg := []byte("Tongji Fintech Research Institute")
    pub := &priv.PublicKey
    ciphertxt, err := pub.Encrypt(msg)
    if err != nil {
        log.Fatal(err)
    }
    fmt.Printf("加密结果:%x\n",ciphertxt)
    plaintxt,err :=  priv.Decrypt(ciphertxt)
    if err != nil {
        log.Fatal(err)
    }
    if !bytes.Equal(msg,plaintxt){
        log.Fatal("原文不匹配")
    }

    r,s,err := sm2.Sign(priv, msg)
    if err != nil {
        log.Fatal(err)
    }
    isok := sm2.Verify(pub,msg,r,s)
    fmt.Printf("Verified: %v\n", isok)
}
