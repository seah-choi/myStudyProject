package org.fullstack4.mystudyproject.dto;

import lombok.*;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ShareDTO {
    private int share_idx;
    private String user_id;
    private int study_idx;
    private String share_id;
    private String name;
}
