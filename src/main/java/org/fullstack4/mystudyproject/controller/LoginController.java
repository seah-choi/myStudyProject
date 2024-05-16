package org.fullstack4.mystudyproject.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.mystudyproject.dto.LoginDTO;
import org.fullstack4.mystudyproject.dto.MemberDTO;
import org.fullstack4.mystudyproject.service.LoginServiceIf;
import org.fullstack4.mystudyproject.util.CookieUtil;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Log4j2
@Controller
@RequestMapping("/login")
@RequiredArgsConstructor
public class LoginController {
    private final LoginServiceIf loginService;

    @GetMapping("/login")
    public void loginGet(HttpServletRequest req) {
        CookieUtil.getCookieValue(req,"id");
    }

    @PostMapping("/login")
    public String loginPost(Model model, LoginDTO memberDTO,
                                       @RequestParam(name="sava_id", defaultValue = "") String save_id,
                                       HttpServletResponse resp,
                                       HttpServletRequest req,
                                       BindingResult bindingResult,
                                       RedirectAttributes redirectAttributes){
                
        log.info("LoginController >> loginPost");

        LoginDTO loginMemberDTO = loginService.login(memberDTO.getUser_id(), memberDTO.getPassword());

        if(bindingResult.hasErrors()){
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            return "redirect:/login/login";
        }

        if(loginMemberDTO != null){
            if(save_id != null && !save_id.equals("Y")){
                CookieUtil.setDeleteCookie(resp,"","/",60*60*24, "save_id", memberDTO.getUser_id());
                log.info("아이디 저장");
            }


        HttpSession session = req.getSession();
        session.setAttribute("user_id",loginMemberDTO.getUser_id());
        session.setAttribute("name",loginMemberDTO.getName());
        session.setAttribute("loginMemberDTO",loginMemberDTO);
        model.addAttribute("memberDTO",loginMemberDTO);
        return "redirect:/";
        }
        else{
//            int login_fail = loginService.login_fail(loginMemberDTO.getUser_id());
//            if(login_fail > 5){
//                redirectAttributes.addFlashAttribute("loginFail","5회 이상 로그인 실패로 잠근 처리된 계정입니다. 관리자에게 문의해주세요.");
//            } else{
            redirectAttributes.addFlashAttribute("loginErr", "아이디 혹은 비밀번호가 일치하지 않습니다.");
            return "redirect:/login/login";
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest req){
        HttpSession session = req.getSession();
        if(session != null) {
            session.invalidate();
        }
        return "redirect:/";
    }

    @GetMapping("/pwdSearch")
    public void pwdSearchGet(){
        System.out.println("pwdsearch get");
    }

    @PostMapping("/pwdSearch")
    public String pwdSearchPost(@RequestParam("user_id") String user_id
                                ,HttpSession session){
        System.out.println("pwdsearch posts");
        String pwd = loginService.pwdSearch(user_id);
        if(pwd != null){
            session.setAttribute("id",user_id);
            session.setAttribute("pwd", pwd);
            return "redirect:/login/pwdSearchResult";
        } else {
            return "redirect:/login/pwdSearch";
        }
    }

    @GetMapping("/pwdSearchResult")
    public void pwdSearchResult(Model model){}

    @GetMapping("/pwdChange")
    public void pwdChangeGet(HttpSession session){
        session.getAttribute("id");
    }

    @PostMapping("/pwdChange")
    public String pwdChangePost(@RequestParam(name="user_id", defaultValue = "")String user_id,
                                @RequestParam(name="password", defaultValue = "") String newpassword){
        int result = loginService.pwdChange(user_id, newpassword);
        log.info("result : "+result);
        if(result > 0 ) {
            return "redirect:/login/login";
        } else {
            log.info("변경 실패");
            return "redirect:/login/pwdChange";
        }
    }

    @ResponseBody
    @PostMapping("/idCheck")
    public void idCheck(@RequestParam(name = "user_id", defaultValue = "") String user_id,
                        HttpServletResponse resp){
        int result = loginService.idCheck(user_id);
        System.out.println("id check : "+result);
        log.info("result :"+ result);
        log.info("user_id:"+user_id);
        if(result > 0){
            resp.setContentType("application/json; charset=utf-8");
            try{
                resp.getWriter().print("{\"result\":\"Y\"}");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        } else {
            try {
                resp.getWriter().print("{\"result\":\"N\"}");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

}
