package org.fullstack4.mystudyproject.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.mystudyproject.dto.MyStudyDTO;
import org.fullstack4.mystudyproject.dto.PageRequestDTO;
import org.fullstack4.mystudyproject.dto.PageResponseDTO;
import org.fullstack4.mystudyproject.dto.ShareDTO;
import org.fullstack4.mystudyproject.service.MyStudyServiceIf;
import org.fullstack4.mystudyproject.service.ShareStudyServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping("/shareStudy")
public class ShareController {
    private final ShareStudyServiceIf shareStudyService;

    @GetMapping("/list")
    public void listGet(@Valid PageRequestDTO pageRequestDTO, BindingResult bindingResult, RedirectAttributes redirectAttributes, Model model, HttpServletRequest req) {

        log.info("ShareController >> list");
        if (bindingResult.hasErrors()) {
            log.info("BookController >> list errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }

        HttpSession session = req.getSession();
        String user_id = (String)session.getAttribute("user_id");
        pageRequestDTO.setUser_id(user_id);
        pageRequestDTO.setShare_id(user_id);

        log.info("ShareController >> listGet >> session.getAttribute(user_id) : "+session.getAttribute("user_id"));
        log.info("ShareController >> listGet >> share_id : "+pageRequestDTO.getShare_id());

        PageResponseDTO<MyStudyDTO> responseDTO = shareStudyService.list(pageRequestDTO);

        model.addAttribute("responseDTO", responseDTO);
        model.addAttribute("share_type",responseDTO.getShare_type());
        model.addAttribute("count", responseDTO.getCount());
        model.addAttribute("share_id",responseDTO.getShare_id());
        model.addAttribute("receive_id",responseDTO.getReceive_id());

        System.out.println("user_id = "+user_id);
        System.out.println("share_type = " + responseDTO.getShare_type());
        System.out.println("receive_id : " + responseDTO.getReceive_id());
        System.out.println("share_id : " + responseDTO.getShare_id());
        System.out.println("ShareController >> responseDTO : " + responseDTO);
    }

    @GetMapping("/view")
    public void view(@Valid PageRequestDTO pageRequestDTO,Model model, @RequestParam(name="study_idx", defaultValue = "0") int study_idx,HttpServletRequest req) {
        log.info("ShareController >> view");
        MyStudyDTO myStudyDTO = shareStudyService.view(study_idx);
        List<ShareDTO> shareDTOList = shareStudyService.shareList(study_idx);

        HttpSession session = req.getSession();
        pageRequestDTO.setUser_id((String) session.getAttribute("user_id"));

        model.addAttribute("shareDTOList", shareDTOList);
        model.addAttribute("receive_id", shareDTOList.get(0).getReceive_id());
        model.addAttribute("myStudy", myStudyDTO);

    }
}
