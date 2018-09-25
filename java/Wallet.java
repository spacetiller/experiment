package com.blockchain.model;

import java.util.Map;
import com.blockchain.security.CryptoUtil;
import com.blockchain.security.RSACoder;

/**
 * 钱包：公钥、私钥、钱包地址
 */
public class Wallet {

    /**
     * 公钥
     */
    private String publicKey;
    /**
     * 私钥
     */
    private String privateKey;
    /**
     * 钱包地址
     */
    private String address=null;

    /**
     * 隐藏无参构造器
     */
    private Wallet() {}

    /**
     * 只包含公钥的钱包，用来给其他节点使用，其他节点在转账时需要用到
     * @param publicKey
     */
    public Wallet(String publicKey) {
        this.publicKey = publicKey;
        this.address= CryptoUtil.md5(hashPubKey(publicKey));
    }
    /**
     * 该构造器仅供静态方法createWallet()使用
     * @param publicKey
     * @param privateKey
     */
    private Wallet(String publicKey, String privateKey) {
        this.publicKey = publicKey;
        this.privateKey = privateKey;
        this.address= CryptoUtil.md5(hashPubKey(publicKey));
    }

    /**
     * 生成一个新钱包，也就是生成新的密钥对
     * @return
     */
    public static Wallet createWallet() {
        Map<String, Object> initKey;
        try {
            // 本地生成公私钥对
            initKey = RSACoder.initKey();
            String publicKey = RSACoder.getPublicKey(initKey);
            String privateKey = RSACoder.getPrivateKey(initKey);
            return new Wallet(publicKey, privateKey);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    /**
     * 获取钱包地址：由公钥生成钱包地址
     * @return
     */
    public String getAddress() {
        //单例模式，不需要重复计算地址
        if(null==address){
            String publicKeyHash = hashPubKey(publicKey);
            return CryptoUtil.md5(publicKeyHash);
        }else{
            return address;
        }
    }
    /**
     * 静态方法：根据指定钱包公钥生成钱包地址
     * @param publicKey
     * @return
     */
    public static String getAddress(String publicKey) {
        String publicKeyHash = hashPubKey(publicKey);
        return CryptoUtil.md5(publicKeyHash);
    }

    public String getPublicKey() {
        return publicKey;
    }

    public void setPublicKey(String publicKey) {
        this.publicKey = publicKey;
    }

    public String getPrivateKey() {
        return privateKey;
    }

    public void setPrivateKey(String privateKey) {
        this.privateKey = privateKey;
    }

    /**
     * 获取钱包公钥hash
     * 
     * @return
     */
    public String getHashPubKey() {
        return CryptoUtil.sha256(publicKey);
    }

    /**
     * 生成钱包公钥hash
     * 
     * @param publicKey
     * @return
     */
    public static String hashPubKey(String publicKey) {
        return CryptoUtil.sha256(publicKey);
    }

}