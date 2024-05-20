package org.fullstack4.mystudyproject.mapper;

import org.apache.ibatis.annotations.Param;
import org.fullstack4.mystudyproject.domain.LoginVO;
import org.fullstack4.mystudyproject.domain.MemberVO;

public interface LoginMapper {
    LoginVO login(@Param("user_id") String id, @Param("password") String pwd);
    void logout(String id);
    int pwdChange(@Param("user_id") String id, @Param("password") String pwd);
    int idCheck(String user_id);
    int pwdSearch(@Param("user_id") String id, @Param("password") String pwd);

    LoginVO findByUsername(@Param("user_id") String user_id);
    void updateLoginFail(@Param("user_id") String user_id, @Param("loginFail") int loginFail);
    void lockAccount(@Param("user_id") String user_id);
    void resetLoginFail(@Param("user_id") String user_id);
}
