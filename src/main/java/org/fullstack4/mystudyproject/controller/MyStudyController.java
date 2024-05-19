package org.fullstack4.mystudyproject.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.mystudyproject.dto.MyStudyDTO;
import org.fullstack4.mystudyproject.dto.PageRequestDTO;
import org.fullstack4.mystudyproject.dto.PageResponseDTO;
import org.fullstack4.mystudyproject.dto.ShareDTO;
import org.fullstack4.mystudyproject.service.MyStudyServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping("/myStudy")
public class MyStudyController {
    private final MyStudyServiceIf myStudyService;

    @GetMapping("/main")
    public void main() {}

    @GetMapping("/list")
    public void listGet(@Valid PageRequestDTO pageRequestDTO, BindingResult bindingResult, RedirectAttributes redirectAttributes, Model model, HttpServletRequest req) {

        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }

        HttpSession session = req.getSession();
        pageRequestDTO.setUser_id((String) session.getAttribute("user_id"));

        PageResponseDTO<MyStudyDTO> responseDTO = myStudyService.list(pageRequestDTO);
        model.addAttribute("responseDTO", responseDTO);
        model.addAttribute("order", responseDTO.getOrder());
        model.addAttribute("count", responseDTO.getCount());
    }

    @GetMapping("/view")
    public void view(@Valid PageRequestDTO pageRequestDTO,Model model, @RequestParam(name="study_idx", defaultValue = "0") int study_idx,HttpServletRequest req) {
        log.info("MyStudyController >> view");
        MyStudyDTO myStudyDTO = myStudyService.view(study_idx);
        List<ShareDTO> shareDTOList = myStudyService.shareList(study_idx);

        HttpSession session = req.getSession();
        pageRequestDTO.setUser_id((String) session.getAttribute("user_id"));

        model.addAttribute("shareDTOList", shareDTOList);
        model.addAttribute("receive_id", shareDTOList.get(0).getReceive_id());
        model.addAttribute("myStudy", myStudyDTO);
        System.out.println("MyStudyController >> view : "+shareDTOList.get(0).getReceive_id());

    }

    @GetMapping("/regist")
    public void registGet(ShareDTO shareDTO,Model model) {
        model.addAttribute("shareDTO", shareDTO);
    }

    @PostMapping("/regist")
    public String registPost(MyStudyDTO myStudyDTO, BindingResult bindingResult, RedirectAttributes redirectAttributes) {

        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("myStudy", myStudyDTO);
            return "redirect:/myStudy/regist";
        }

        int result = myStudyService.regist(myStudyDTO);

        if (result > 0) {
            return "redirect:/myStudy/list";
        } else {
            return "/myStudy/regist";
        }
    }

    @GetMapping("/modify")
    public void modifyGet(@RequestParam(name="study_idx", defaultValue = "0") int study_idx, Model model) {
        MyStudyDTO myStudyDTO = myStudyService.view(study_idx);
        model.addAttribute("myStudy", myStudyDTO);
    }

    @PostMapping("/modify")
    public String modifyPost(MyStudyDTO myStudyDTO){
        int result = myStudyService.modify(myStudyDTO);
        if(result > 0 ){
            return "redirect:/myStudy/list";
        } else {
            return "redirect:/myStudy/modify?study_idx=" + myStudyDTO.getStudy_idx();
        }
    }

    @PostMapping("/delete")
    public String deleteGet(@RequestParam(name="study_idx", defaultValue = "0") int study_idx) {
        int result = myStudyService.delete(study_idx);
        if(result > 0 ){
            return "redirect:/myStudy/list";
        } else {
            return "redirect:/myStudy/view?study_idx=" + study_idx;
        }
    }
}
