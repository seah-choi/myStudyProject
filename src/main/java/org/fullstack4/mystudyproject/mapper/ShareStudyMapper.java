package org.fullstack4.mystudyproject.mapper;

import org.fullstack4.mystudyproject.domain.MyStudyVO;
import org.fullstack4.mystudyproject.domain.ShareVO;
import org.fullstack4.mystudyproject.dto.PageRequestDTO;

import java.util.List;

public interface ShareStudyMapper {
    List<MyStudyVO> list(PageRequestDTO requestDTO);
    MyStudyVO view(int study_idx);
    int total_count(PageRequestDTO requestDTO);
    List<ShareVO> shareList(int study_idx);
}
