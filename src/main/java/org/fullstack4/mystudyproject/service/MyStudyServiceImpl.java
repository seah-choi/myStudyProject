package org.fullstack4.mystudyproject.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.mystudyproject.domain.MyStudyVO;
import org.fullstack4.mystudyproject.domain.ShareVO;
import org.fullstack4.mystudyproject.dto.MyStudyDTO;
import org.fullstack4.mystudyproject.dto.PageRequestDTO;
import org.fullstack4.mystudyproject.dto.PageResponseDTO;
import org.fullstack4.mystudyproject.dto.ShareDTO;
import org.fullstack4.mystudyproject.mapper.MyStudyMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Log4j2
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
    public List<ShareDTO> shareList(int study_idx) {
        List<ShareDTO> shareDTOList = myStudyMapper.shareList(study_idx).stream()
                .map(vo -> modelMapper.map(vo, ShareDTO.class))
                .collect(Collectors.toList());

        return shareDTOList;
    }


    @Override
    public int insertId() {
        int result = myStudyMapper.insertId();
        return result;
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

        List<ShareDTO> shareDTOList = myStudyMapper.shareList(study_idx).stream()
                .map(vo -> modelMapper.map(vo, ShareDTO.class))
                .collect(Collectors.toList());

        return myStudyDTO;
    }

    @Override
    public int regist(MyStudyDTO myStudyDTO) {
        MyStudyVO myStudyVO = modelMapper.map(myStudyDTO, MyStudyVO.class);
        int result = myStudyMapper.regist(myStudyVO);

        //공유
        int insertId = myStudyMapper.insertId();
        int shareResult = 0;
        myStudyDTO.setStudy_idx(insertId);

        String[] ids = myStudyDTO.getReceive_id();
        for(String id : ids) {
            shareResult = myStudyMapper.shareRegist(id, myStudyDTO.getShare_id(), myStudyDTO.getStudy_idx());
        }

        return result;
    }

    @Override
    public int modify(MyStudyDTO myStudyDTO) {
        MyStudyVO myStudyVO = modelMapper.map(myStudyDTO, MyStudyVO.class);
        int result = myStudyMapper.modify(myStudyVO);

        myStudyMapper.shareDelete(myStudyDTO.getStudy_idx());

        //공유
        int shareResult = 0;

        String[] ids = myStudyDTO.getReceive_id();
        log.info(myStudyDTO.getShare_id());
        log.info(myStudyDTO.getStudy_idx());
        for(String id : ids) {
            System.out.println("ids : " + id);

            shareResult = myStudyMapper.shareRegist(id, myStudyDTO.getShare_id(), myStudyDTO.getStudy_idx());
        }

        return result;
    }

    @Override
    public int delete(int study_idx) {
        return myStudyMapper.delete(study_idx);
    }

}
