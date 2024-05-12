package org.fullstack4.mystudyproject.mapper;

import org.apache.ibatis.annotations.Param;
import org.fullstack4.mystudyproject.domain.MemberVO;

public interface LoginMapper {
    MemberVO login(@Param("user_id") String id, @Param("password") String pwd);
    void logout(String id);
}
