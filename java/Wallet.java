package com.blockchain.model;

import java.util.Map;
import com.blockchain.security.CryptoUtil;
import com.blockchain.security.RSACoder;

/**
 * Ǯ������Կ��˽Կ��Ǯ����ַ
 */
public class Wallet {

    /**
     * ��Կ
     */
    private String publicKey;
    /**
     * ˽Կ
     */
    private String privateKey;
    /**
     * Ǯ����ַ
     */
    private String address=null;

    /**
     * �����޲ι�����
     */
    private Wallet() {}

    /**
     * ֻ������Կ��Ǯ���������������ڵ�ʹ�ã������ڵ���ת��ʱ��Ҫ�õ�
     * @param publicKey
     */
    public Wallet(String publicKey) {
        this.publicKey = publicKey;
        this.address= CryptoUtil.md5(hashPubKey(publicKey));
    }
    /**
     * �ù�����������̬����createWallet()ʹ��
     * @param publicKey
     * @param privateKey
     */
    private Wallet(String publicKey, String privateKey) {
        this.publicKey = publicKey;
        this.privateKey = privateKey;
        this.address= CryptoUtil.md5(hashPubKey(publicKey));
    }

    /**
     * ����һ����Ǯ����Ҳ���������µ���Կ��
     * @return
     */
    public static Wallet createWallet() {
        Map<String, Object> initKey;
        try {
            // �������ɹ�˽Կ��
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
     * ��ȡǮ����ַ���ɹ�Կ����Ǯ����ַ
     * @return
     */
    public String getAddress() {
        //����ģʽ������Ҫ�ظ������ַ
        if(null==address){
            String publicKeyHash = hashPubKey(publicKey);
            return CryptoUtil.md5(publicKeyHash);
        }else{
            return address;
        }
    }
    /**
     * ��̬����������ָ��Ǯ����Կ����Ǯ����ַ
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
     * ��ȡǮ����Կhash
     * 
     * @return
     */
    public String getHashPubKey() {
        return CryptoUtil.sha256(publicKey);
    }

    /**
     * ����Ǯ����Կhash
     * 
     * @param publicKey
     * @return
     */
    public static String hashPubKey(String publicKey) {
        return CryptoUtil.sha256(publicKey);
    }

}