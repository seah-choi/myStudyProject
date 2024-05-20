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
    public void main(@Valid PageRequestDTO pageRequestDTO,Model model, @RequestParam(name="study_idx", defaultValue = "0") int study_idx,HttpServletRequest req) {
        MyStudyDTO myStudyDTO = myStudyService.view(study_idx);
        List<ShareDTO> shareDTOList = myStudyService.shareList(study_idx);

        HttpSession session = req.getSession();
        pageRequestDTO.setUser_id((String) session.getAttribute("user_id"));

        model.addAttribute("shareDTOList", shareDTOList);
        model.addAttribute("myStudy", myStudyDTO);
    }

    @GetMapping("/list")
    public void listGet(@Valid PageRequestDTO pageRequestDTO, BindingResult bindingResult, RedirectAttributes redirectAttributes, Model model, HttpServletRequest req) {

        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }

        HttpSession session = req.getSession();
        String user_id = (String) session.getAttribute("user_id");
        pageRequestDTO.setUser_id(user_id);
        pageRequestDTO.setShare_id(user_id);

        PageResponseDTO<MyStudyDTO> responseDTO = myStudyService.list(pageRequestDTO);
        model.addAttribute("responseDTO", responseDTO);
        model.addAttribute("order", responseDTO.getOrder());
        model.addAttribute("count", responseDTO.getCount());
    }

    @GetMapping("/view")
    public void view(@Valid PageRequestDTO pageRequestDTO,Model model, @RequestParam(name="study_idx", defaultValue = "0") int study_idx,HttpServletRequest req) {

        MyStudyDTO myStudyDTO = myStudyService.view(study_idx);
        List<ShareDTO> shareDTOList = myStudyService.shareList(study_idx);

        HttpSession session = req.getSession();
        pageRequestDTO.setUser_id((String) session.getAttribute("user_id"));

        model.addAttribute("shareDTOList", shareDTOList);
        model.addAttribute("myStudy", myStudyDTO);

    }

    @GetMapping("/regist")
    public void registGet(ShareDTO shareDTO,Model model) {
        model.addAttribute("shareDTO", shareDTO);
    }

    @PostMapping("/regist")
    public String registPost(MyStudyDTO myStudyDTO, BindingResult bindingResult,
                             @RequestParam("file") MultipartFile image
                             ,RedirectAttributes redirectAttributes) {

        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("myStudy", myStudyDTO);
            return "redirect:/myStudy/regist";
        }

        String uploadFolder = "S:\\java4\\spring\\myStudyProject\\src\\main\\webapp\\resources\\img\\uploads";
        String fileRealName = image.getOriginalFilename();
        long size = image.getSize();

        if(fileRealName.length() !=0){
            String fileExt = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());

            //새로운 파일명 생성
            UUID uuid = UUID.randomUUID();
            String[] uuids = uuid.toString().split("-");
            String newName = uuids[0];

            File saveFile = new File(uploadFolder + "\\" + newName + fileExt);

            try {
                image.transferTo(saveFile);
                myStudyDTO.setImage(newName+fileExt);
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
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
        List<ShareDTO> shareDTOList = myStudyService.shareList(study_idx);

        model.addAttribute("myStudy", myStudyDTO);
        model.addAttribute("shareDTOList", shareDTOList);

    }

    @PostMapping("/modify")
    public String modifyPost(MyStudyDTO myStudyDTO, @RequestParam("file") MultipartFile image){

        for(String i : myStudyDTO.getReceive_id()){
            System.out.println("receivce id : " +   i);
        }

        String uploadFolder = "S:\\java4\\spring\\myStudyProject\\src\\main\\webapp\\resources\\img\\uploads";
        String fileRealName = image.getOriginalFilename();
        long size = image.getSize();

        if(fileRealName.length() !=0){
            String fileExt = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());

            //새로운 파일명 생성
            UUID uuid = UUID.randomUUID();
            String[] uuids = uuid.toString().split("-");
            String newName = uuids[0];

            File saveFile = new File(uploadFolder + "\\" + newName + fileExt);

            try {
                image.transferTo(saveFile);
                myStudyDTO.setImage(newName+fileExt);
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        log.info("stud_idx : "+ myStudyDTO.getStudy_idx());
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
