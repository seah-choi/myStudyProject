package org.fullstack4.mystudyproject.mapper;

import org.apache.ibatis.annotations.Param;
import org.fullstack4.mystudyproject.domain.LoginVO;
import org.fullstack4.mystudyproject.domain.MemberVO;

public interface LoginMapper {
    LoginVO login(@Param("user_id") String id, @Param("password") String pwd);
    void logout(String id);
    int pwdChange(String id);
}
