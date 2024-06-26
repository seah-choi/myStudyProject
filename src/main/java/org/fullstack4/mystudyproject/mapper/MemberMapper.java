package org.fullstack4.mystudyproject.mapper;

import org.fullstack4.mystudyproject.domain.MemberVO;

public interface MemberMapper {
    int join(MemberVO memberVO);
    int modify(MemberVO memberVO);
    MemberVO view(String user_id);
    int delete(String user_id);
    int idCheck(String user_id);
}
