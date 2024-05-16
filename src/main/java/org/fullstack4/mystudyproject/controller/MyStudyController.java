package org.fullstack4.mystudyproject.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.mystudyproject.dto.MyStudyDTO;
import org.fullstack4.mystudyproject.dto.PageRequestDTO;
import org.fullstack4.mystudyproject.dto.PageResponseDTO;
import org.fullstack4.mystudyproject.service.MyStudyServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping("/myStudy")
public class MyStudyController {
    private final MyStudyServiceIf myStudyService;

    @GetMapping("/main")
    public void main() {}

    @GetMapping("/list")
    public void listGet(@Valid PageRequestDTO pageRequestDTO, BindingResult bindingResult, RedirectAttributes redirectAttributes, Model model) {

        if (bindingResult.hasErrors()) {
            log.info("BookController >> list errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }
        log.info("BookController >> list");

        PageResponseDTO<MyStudyDTO> responseDTO = myStudyService.list(pageRequestDTO);
        model.addAttribute("responseDTO", responseDTO);
        model.addAttribute("order", responseDTO.getOrder());
        model.addAttribute("count", responseDTO.getCount());
    }

    @GetMapping("/view")
    public void view(Model model, @RequestParam(name="study_idx", defaultValue = "0") int study_idx) {
        MyStudyDTO myStudyDTO = myStudyService.view(study_idx);
        model.addAttribute("myStudy", myStudyDTO);
    }

    @GetMapping("/regist")
    public void registGet() {}

    @PostMapping("/regist")
    public String registPost(MyStudyDTO myStudyDTO,BindingResult bindingResult, RedirectAttributes redirectAttributes){

        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("myStudy", myStudyDTO);
            return "redirect:/myStudy/regist";
        }

        int result = myStudyService.regist(myStudyDTO);
        if(result > 0 ){
            return "redirect:/myStudy/list";
        } else {
            return "redirect:/myStudy/regist";
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
