package org.fullstack4.mystudyproject.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.mystudyproject.domain.LoginVO;
import org.fullstack4.mystudyproject.domain.MemberVO;
import org.fullstack4.mystudyproject.dto.LoginDTO;
import org.fullstack4.mystudyproject.dto.MemberDTO;
import org.fullstack4.mystudyproject.mapper.LoginMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

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
}
