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
        System.out.println("Ǯ����ַ��\n"+wallet.getAddress());
        System.out.println("Ǯ����Կ��\n"+wallet.getPublicKey());
        System.out.println("Ǯ��˽Կ��\n"+wallet.getPrivateKey());
    }
}