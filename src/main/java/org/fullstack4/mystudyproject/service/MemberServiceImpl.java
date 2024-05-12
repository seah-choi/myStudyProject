package org.fullstack4.mystudyproject.service;

import lombok.RequiredArgsConstructor;
import org.fullstack4.mystudyproject.domain.MemberVO;
import org.fullstack4.mystudyproject.dto.MemberDTO;
import org.fullstack4.mystudyproject.mapper.MemberMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberServiceIf{
    private final MemberMapper memberMapper;
    private final ModelMapper modelMapper;

    @Override
    public int join(MemberDTO memberDTO) {
        MemberVO memberVO = modelMapper.map(memberDTO, MemberVO.class);
        int result = memberMapper.join(memberVO);
        return result;
    }

    @Override
    public int modify(MemberDTO memberDTO) {
        MemberVO memberVO = modelMapper.map(memberDTO, MemberVO.class);
        int result = memberMapper.modify(memberVO);
        return result;
    }

    @Override
    public MemberDTO view(String user_id) {
        MemberVO memberVO = memberMapper.view(user_id);
        MemberDTO memberDTO = modelMapper.map(memberVO, MemberDTO.class);
        return memberDTO;
    }

    @Override
    public int delete(String user_id) {
        int result = memberMapper.delete(user_id);
        return result;
    }

    @Override
    public int idCheck(String user_id) {
        int result = memberMapper.idCheck(user_id);
        return result;
    }
}
