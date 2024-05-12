package org.fullstack4.mystudyproject.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.mystudyproject.dto.MemberDTO;
import org.fullstack4.mystudyproject.service.MemberServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequiredArgsConstructor
@Log4j2
@RequestMapping("/member")
public class MemberController {
    private final MemberServiceIf memberService;

    @GetMapping("/join")
    public void joinGet(){}

    @PostMapping("/join")
    public String joinPost(MemberDTO memberDTO, BindingResult bindingResult, RedirectAttributes redirectAttributes){
        if(bindingResult.hasErrors()){
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("member", memberDTO);
        }

        int result = memberService.join(memberDTO);
        if(result > 0){
            return "redirect:/login/login";
        } else {
            return "redirect:/member/join";
        }

    }

    @GetMapping("/view")
    public void view(@RequestParam(name = "user_id", defaultValue = "") String user_id, Model model,
                     HttpServletRequest req){
        MemberDTO memberDTO = memberService.view(user_id);
        HttpSession session = req.getSession();
        session.setAttribute("member", memberDTO);
    }

    @GetMapping("/modify")
    public void modifyGet(@RequestParam(name = "user_id", defaultValue = "") String user_id, Model model){
        MemberDTO memberDTO = memberService.view(user_id);
        model.addAttribute("member", memberDTO);
    }

    @PostMapping("/modify")
    public String modifyPost(MemberDTO memberDTO, BindingResult bindingResult, Model model){
        int result = memberService.modify(memberDTO);
        if(result > 0){
            return "redirect:/member/view?user_id=" + memberDTO.getUser_id();
        } else {
            return "redirect:/member/modify?user_id=" + memberDTO.getUser_id();
        }
    }

    @PostMapping("/delete")
    public String delete(@RequestParam(name = "user_id", defaultValue = "") String user_id){
        int result = memberService.delete(user_id);
        if(result > 0){
            return "redirect:/";
        } else {
            return "redirect:/member/view?user_id=" + user_id;
        }
    }

    @ResponseBody
    @PostMapping("/idCheck")
    public void idCheck(@RequestParam(name = "user_id", defaultValue = "") String user_id,
                        HttpServletResponse resp){
        int result = memberService.idCheck(user_id);
        if(result > 0){
            try{
                resp.getWriter().print("Y");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        } else {
            try {
                resp.getWriter().print("N");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

}
