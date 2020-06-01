package com.keep.root.web;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.keep.root.domain.Point;
import com.keep.root.domain.User;
import com.keep.root.service.PointService;
import com.keep.root.service.UserService;

@Controller
@RequestMapping("/point")
// @RequestMapping("/point/*")
public class PointServiceController {

  @Autowired
  ServletContext servletContext;

  @Autowired
  PointService pointService;

  @Autowired
  UserService userService;

  @GetMapping("form")
  public void form(int userNo, HttpSession session, Model model) throws Exception {
    User loginUser = (User) session.getAttribute("loginUser");
    if (loginUser == null) {
      throw new Exception("로그인이 필요합니다.");
    }
    model.addAttribute("user", userService.get(userNo));
    model.addAttribute("point", pointService.get(userNo));

    // return "redirect:form?userNo=" + userNo;
  }

  @GetMapping("payment")
  public String payment() throws Exception {
    return "/point/payment";
  }

  @RequestMapping("add")
  public String add(//
      int userNo, //
      int reviewUserNo, //
      int pointType, //
      int content, //
      int price, HttpSession session, Model model) throws Exception {
    User loginUser = (User) session.getAttribute("loginUser");
    if (loginUser == null) {
      throw new Exception("로그인이 필요합니다.");
    }
    if (pointService.scrapAdd(userNo, reviewUserNo, pointType, content, price) > 0) {
      return "redirect:userlist?userNo=" + loginUser.getNo();
    } else {
      throw new Exception("스크랩을 실패했습니다.");
    }
  }

  // http://localhost:8080/Root_Project/app/point/add?userNo=51&reviewUserNo=54&pointType=1&content=2&price=30

  @GetMapping("outputdetail")
  public void getUser(int userNo, Model model) throws Exception {
    User user = userService.get(userNo);
    if (user == null) {
      throw new Exception("해당 번호의 정보가 없습니다.");
    }
    model.addAttribute("user", user);
    model.addAttribute("outputdetail", pointService.getUser(userNo));
  }


  @GetMapping("list")
  public void list(Model model) throws Exception {
    model.addAttribute("list", pointService.list());
  }

  @GetMapping("userlist")
  public void list(int userNo, Model model) throws Exception {
    model.addAttribute("user", userService.get(userNo));
    model.addAttribute("userlist", pointService.list(userNo));
  }

  @GetMapping("detail")
  public void detail(int no, Model model) throws Exception {
    Point point = pointService.get(no);
    model.addAttribute("point", point);
  }


  @GetMapping("output")
  public void listOutput(Model model) throws Exception {
    model.addAttribute("output", pointService.findOutputByUserNo());
  }

  @GetMapping("trader")
  public void getTrader(Model model, int traderNo) throws Exception {
    model.addAttribute("tarder", pointService.getTrader(traderNo));
  }

  @PostMapping("update")
  public String update(Point point) throws Exception {
    if (pointService.update(point) > 0) {
      return "redirect:list";
    } else {
      throw new Exception("변경할 수 없습니다.");
    }
  }

  @GetMapping("delete")
  public String delete(int no, HttpSession session) throws Exception {
    User loginUser = (User) session.getAttribute("loginUser");
    if (loginUser == null) {
      throw new Exception("로그인이 필요합니다.");
    }
    if (pointService.delete(no) > 0) {
      return "redirect:userlist?userNo=" + loginUser.getNo();
    } else {
      throw new Exception("삭제할 게시물 번호가 유효하지 않습니다.");
    }
  }
}
