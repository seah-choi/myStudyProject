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

    private String email1;
    private String email2;
    private String phone_number1;
    private String phone_number2;
    private String phone_number3;

    public void setPhone_number(String phone_number1, String phone_number2, String phone_number3) {
        this.phone_number = phone_number1 +"-"+ phone_number2 +"-"+ phone_number3;
    }

    public void setEmail(String email1, String email2){
        this.email = email1+email2;
    }
}
