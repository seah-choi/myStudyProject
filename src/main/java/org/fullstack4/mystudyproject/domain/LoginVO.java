package org.fullstack4.mystudyproject.domain;

import lombok.*;

import java.time.LocalDate;

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class LoginVO {
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
