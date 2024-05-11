package org.fullstack4.mystudyproject.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j2
@Controller
@RequestMapping("/login")
@RequiredArgsConstructor
public class LoginController {

    @GetMapping("/login")
    public void login() {

    }
}
