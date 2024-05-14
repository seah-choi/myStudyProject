package org.fullstack4.mystudyproject.util;

import java.security.SecureRandom;

public class CommonUtil {
    public String makePassword(int len){
        SecureRandom sr = new SecureRandom();
        StringBuilder sb = new StringBuilder();

        String strPool = "ABCDEFGHIJKLMNOPQSTUVWXYZabcdefghijklmnopqrstuvwxyz" + "0123456789!@#$%^&*()_+";

        //시드값 설정
        sr.setSeed(System.currentTimeMillis());

        for(int i = 0; i < len; i++){
            int char_index = sr.nextInt(strPool.length());
            sb.append(strPool.charAt(char_index));
        }

        return sb.toString();
    }
}
