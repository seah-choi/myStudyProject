package org.fullstack4.mystudyproject.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.mystudyproject.domain.MyStudyVO;
import org.fullstack4.mystudyproject.dto.MyStudyDTO;
import org.fullstack4.mystudyproject.dto.PageRequestDTO;
import org.fullstack4.mystudyproject.dto.PageResponseDTO;
import org.fullstack4.mystudyproject.dto.ShareDTO;
import org.fullstack4.mystudyproject.mapper.MyStudyMapper;
import org.fullstack4.mystudyproject.mapper.ShareStudyMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class ShareStudyServiceImpl implements ShareStudyServiceIf{

    private final ShareStudyMapper myStudyMapper;
    private final ModelMapper modelMapper;

    @Override
    public PageResponseDTO<MyStudyDTO> list(PageRequestDTO pageRequestDTO) {
        log.info("ShareStudyServiceImpl >> list");
        log.info("ShareStudyServiceImpl>> list >> pageRequestDTO = " + pageRequestDTO);
        List<MyStudyVO> voList = myStudyMapper.list(pageRequestDTO);
        List<MyStudyDTO> dtoList = voList.stream().map(vo->modelMapper.map(vo,MyStudyDTO.class)).collect(Collectors.toList());
        int total_count = myStudyMapper.total_count(pageRequestDTO);
        PageResponseDTO<MyStudyDTO> responseDTO = PageResponseDTO.<MyStudyDTO>withAll().requestDTO(pageRequestDTO)
                .dtoList(dtoList).total_count(total_count).build();
        log.info("ShareStudyServiceImpl>> list >> responseDTO = " + responseDTO);
        return responseDTO;
    }



    @Override
    public MyStudyDTO view(int study_idx) {
        MyStudyVO myStudyVO = myStudyMapper.view(study_idx);
        MyStudyDTO myStudyDTO = modelMapper.map(myStudyVO, MyStudyDTO.class);
        return myStudyDTO;
    }

    @Override
    public int total_count(PageRequestDTO requestDTO) {
        return myStudyMapper.total_count(requestDTO);
    }

    @Override
    public List<ShareDTO> shareList(int study_idx) {
        List<ShareDTO> shareDTOList = myStudyMapper.shareList(study_idx).stream()
                .map(vo -> modelMapper.map(vo, ShareDTO.class))
                .collect(Collectors.toList());

        System.out.println(("ShareStudyServiceImpl >> listAll() : "+ shareDTOList.toString()));
        return shareDTOList;
    }
}
