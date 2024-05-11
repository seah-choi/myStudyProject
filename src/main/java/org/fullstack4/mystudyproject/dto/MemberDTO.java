package org.fullstack4.mystudyproject.dto;

import lombok.*;

import java.time.LocalDate;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MemberDTO {
    private int member_idx;
    private String user_id;
    private String password;
    private String name;
    private String phone_number;
    private String email;
    private int login_fail;
    private LocalDate last_login_date;
    private String member_status;
}
