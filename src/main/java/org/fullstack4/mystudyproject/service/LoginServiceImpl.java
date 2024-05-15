package org.fullstack4.mystudyproject.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.mystudyproject.domain.LoginVO;
import org.fullstack4.mystudyproject.domain.MemberVO;
import org.fullstack4.mystudyproject.dto.LoginDTO;
import org.fullstack4.mystudyproject.dto.MemberDTO;
import org.fullstack4.mystudyproject.mapper.LoginMapper;
import org.fullstack4.mystudyproject.util.CommonUtil;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Log4j2
@Service
@RequiredArgsConstructor
public class LoginServiceImpl implements LoginServiceIf{
    private final LoginMapper loginMapper;
    private final ModelMapper modelMapper;

    @Override
    public LoginDTO login(String id, String pwd) {
        LoginVO memberVO = loginMapper.login(id, pwd);
        LoginDTO memberDTO = null;

        if(memberVO != null && memberVO.getPassword().equals(pwd)) {
            memberDTO = modelMapper.map(memberVO, LoginDTO.class);
        }

        return memberDTO;
    }

    @Override
    public int pwdChange(String id, String pwd) {
        int result = loginMapper.pwdChange(id, pwd);
        return result;
    }

    @Override
    public int idCheck(String user_id) {
        int result = loginMapper.idCheck(user_id);
        return result;
    }

    @Override
    public String pwdSearch(String id) {
        String tempPassword = UUID.randomUUID().toString().substring(0, 10);
        int result = loginMapper.pwdSearch(id, tempPassword);
        if(result > 0){
            return tempPassword;
        } else {
            return null;
        }
    }

    @Override
    public int login_fail(String id) {
        int result = loginMapper.login_fail(id);
        return result;
    }
}
