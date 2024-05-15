package org.fullstack4.mystudyproject.service;

import org.fullstack4.mystudyproject.dto.MyStudyDTO;
import org.fullstack4.mystudyproject.dto.PageRequestDTO;
import org.fullstack4.mystudyproject.dto.PageResponseDTO;

import java.util.List;

public interface MyStudyServiceIf {
    PageResponseDTO<MyStudyDTO> list(PageRequestDTO pageRequestDTO);
    MyStudyDTO view(int study_idx);
    int regist(MyStudyDTO myStudyDTO);
    int modify(MyStudyDTO myStudyDTO);
    int delete(int study_idx);
    int total_count(PageRequestDTO requestDTO);
}
