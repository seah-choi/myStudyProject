package org.fullstack4.mystudyproject.domain;

import lombok.*;

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ShareVO {
    private int share_idx;
    private String user_id;
    private int study_idx;
    private String share_id;
    private String name;
}
