package org.fullstack4.mystudyproject.dto;

import lombok.*;

import java.time.LocalDate;
import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MyStudyDTO {
    private int study_idx;
    private String user_id;
    private String title;
    private String content;
    private String display_status;
    private LocalDate display_start;
    private LocalDate display_end;
    private LocalDate reg_date;
    private String share_people;
    private String hashtag;
    private String field;
    private int like;
    private String image;

    private String[] receive_id;
    private String share_id;
}
