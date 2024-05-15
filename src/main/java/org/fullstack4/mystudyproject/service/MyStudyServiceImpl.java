package org.fullstack4.mystudyproject.service;

import lombok.RequiredArgsConstructor;
import org.fullstack4.mystudyproject.domain.MyStudyVO;
import org.fullstack4.mystudyproject.dto.MyStudyDTO;
import org.fullstack4.mystudyproject.dto.PageRequestDTO;
import org.fullstack4.mystudyproject.dto.PageResponseDTO;
import org.fullstack4.mystudyproject.mapper.MyStudyMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class MyStudyServiceImpl implements MyStudyServiceIf{
    private final MyStudyMapper myStudyMapper;
    private final ModelMapper modelMapper;

    @Override
    public int total_count(PageRequestDTO requestDTO) {
        return myStudyMapper.total_count(requestDTO);
    }

    @Override
    public PageResponseDTO<MyStudyDTO> list(PageRequestDTO pageRequestDTO) {
        List<MyStudyVO> voList = myStudyMapper.list(pageRequestDTO);
        List<MyStudyDTO> dtoList = voList.stream().map(vo->modelMapper.map(vo,MyStudyDTO.class)).collect(Collectors.toList());
        int total_count = myStudyMapper.total_count(pageRequestDTO);
        PageResponseDTO<MyStudyDTO> responseDTO = PageResponseDTO.<MyStudyDTO>withAll().requestDTO(pageRequestDTO)
                .dtoList(dtoList).total_count(total_count).build();
        return responseDTO;
    }

    @Override
    public MyStudyDTO view(int study_idx) {
        MyStudyVO myStudyVO = myStudyMapper.view(study_idx);
        MyStudyDTO myStudyDTO = modelMapper.map(myStudyVO, MyStudyDTO.class);
        return myStudyDTO;
    }

    @Override
    public int regist(MyStudyDTO myStudyDTO) {
        MyStudyVO myStudyVO = modelMapper.map(myStudyDTO, MyStudyVO.class);
        int result = myStudyMapper.regist(myStudyVO);
        return result;
    }

    @Override
    public int modify(MyStudyDTO myStudyDTO) {
        MyStudyVO myStudyVO = modelMapper.map(myStudyDTO, MyStudyVO.class);
        int result = myStudyMapper.modify(myStudyVO);
        return result;
    }

    @Override
    public int delete(int study_idx) {
        return myStudyMapper.delete(study_idx);
    }

}
