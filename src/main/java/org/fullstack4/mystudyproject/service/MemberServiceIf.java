package org.fullstack4.mystudyproject.service;

import org.fullstack4.mystudyproject.dto.MemberDTO;

public interface MemberServiceIf {
    int join(MemberDTO memberDTO);
    int modify(MemberDTO memberDTO);
    MemberDTO view(String user_id);
    int delete(String user_id);
    int idCheck(String user_id);
}
