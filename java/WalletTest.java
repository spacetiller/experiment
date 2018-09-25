package com.blockchian.model;

import org.junit.Before;
import org.junit.Test;
import com.blockchain.model.Wallet;

public class WalletTest {
    @Before
    public void setUp() throws Exception {
    }

    @Test
    public void testWallet() throws Exception {
        Wallet wallet=Wallet.createWallet();
        System.out.println("钱包地址：\n"+wallet.getAddress());
        System.out.println("钱包公钥：\n"+wallet.getPublicKey());
        System.out.println("钱包私钥：\n"+wallet.getPrivateKey());
    }
}