package com.keep.root.web;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.keep.root.domain.User;
import com.keep.root.service.ScrapDayService;
import com.keep.root.service.ScrapPlaceService;
import com.keep.root.service.UserService;

@Controller
@RequestMapping("/scrap")
public class ScrapController {

  @Autowired
  ServletContext servletContext;

  @Autowired
  ScrapDayService scrapDayService;

  @Autowired
  ScrapPlaceService scrapPlaceService;

  @Autowired
  UserService userService;

  @GetMapping("list")
  public void list(HttpSession session, Model model) throws Exception {
    User user = (User) session.getAttribute("loginUser");
    if (user == null) {
      throw new Exception("로그인이 필요합니다.");
    }
    model.addAttribute("day", scrapDayService.list(user.getNo()));
    model.addAttribute("place", scrapPlaceService.list(user.getNo()));
  }

  @GetMapping("delete")
  public String delete(int no, HttpSession session, Model model) throws Exception {
    model.addAttribute("day", scrapDayService.delete(no));
    model.addAttribute("place", scrapPlaceService.delete(no));
    return "redirect:list?sessionNo=" + session.getId();

  }

}
