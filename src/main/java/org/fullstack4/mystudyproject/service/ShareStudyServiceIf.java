package org.fullstack4.mystudyproject.service;

import org.fullstack4.mystudyproject.dto.MyStudyDTO;
import org.fullstack4.mystudyproject.dto.PageRequestDTO;
import org.fullstack4.mystudyproject.dto.PageResponseDTO;
import org.fullstack4.mystudyproject.dto.ShareDTO;

import java.util.List;

public interface ShareStudyServiceIf {
    PageResponseDTO<MyStudyDTO> list(PageRequestDTO pageRequestDTO);
    MyStudyDTO view(int study_idx);
    int total_count(PageRequestDTO requestDTO);
    List<ShareDTO> shareList(int study_idx);
}
