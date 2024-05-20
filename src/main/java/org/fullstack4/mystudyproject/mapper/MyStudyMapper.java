package org.fullstack4.mystudyproject.mapper;

import org.apache.ibatis.annotations.Param;
import org.fullstack4.mystudyproject.domain.MyStudyVO;
import org.fullstack4.mystudyproject.domain.ShareVO;
import org.fullstack4.mystudyproject.dto.PageRequestDTO;

import java.util.List;

public interface MyStudyMapper {
    List<MyStudyVO> list(PageRequestDTO requestDTO);
    MyStudyVO view(int study_idx);
    int regist(MyStudyVO myStudyVO);
    int modify(MyStudyVO myStudyVO);
    int delete(int study_idx);
    int total_count(PageRequestDTO requestDTO);
    List<ShareVO> shareList(int study_idx);
    int shareRegist(@Param(value = "receive_id") String receive_id, @Param(value = "share_id")String share_id, @Param(value = "study_idx")int study_idx);
    //int shareModify(@Param(value = "receive_id") String receive_id, @Param(value = "share_id")String share_id, @Param(value = "study_idx")int study_idx);
    int insertId();
    int shareDelete(int study_idx);
}
