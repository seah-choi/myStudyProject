package org.fullstack4.mystudyproject.service;

import org.apache.ibatis.annotations.Param;
import org.fullstack4.mystudyproject.domain.LoginVO;
import org.fullstack4.mystudyproject.dto.LoginDTO;
import org.fullstack4.mystudyproject.dto.MemberDTO;

public interface LoginServiceIf {
    LoginDTO login(String id, String pwd);
    int pwdChange(String id, String pwd);
    int idCheck(String user_id);
    String pwdSearch(String id);

    LoginVO findByUsername(@Param("user_id") String user_id);
    void updateLoginFail(@Param("user_id") String user_id, @Param("loginFail") int loginFail);
    void lockAccount(@Param("user_id") String user_id);
    void resetLoginFail(@Param("user_id") String user_id);
}
