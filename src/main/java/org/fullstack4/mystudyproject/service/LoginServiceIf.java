package org.fullstack4.mystudyproject.service;

import org.fullstack4.mystudyproject.dto.MemberDTO;

public interface LoginServiceIf {
    MemberDTO login(String id, String pwd);
}
