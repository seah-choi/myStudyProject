package org.fullstack4.mystudyproject.service;

import org.fullstack4.mystudyproject.dto.LoginDTO;
import org.fullstack4.mystudyproject.dto.MemberDTO;

public interface LoginServiceIf {
    LoginDTO login(String id, String pwd);
    int pwdChange(String id);
}
