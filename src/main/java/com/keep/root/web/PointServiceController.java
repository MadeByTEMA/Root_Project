package com.keep.root.web;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.keep.root.domain.Criteria;
import com.keep.root.domain.PageMaker;
import com.keep.root.domain.Point;
import com.keep.root.domain.User;
import com.keep.root.service.PointService;
import com.keep.root.service.UserService;

@Controller
@RequestMapping("/point")
// @RequestMapping("/point/*")
public class PointServiceController {
  static Logger logger = LogManager.getLogger(PointServiceController.class);

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


  @GetMapping("adminList")
  public void list(Model model) throws Exception {
    model.addAttribute("list", pointService.list());
  }

  @RequestMapping("userlist")
  public void listPage(@RequestParam(value = "page", defaultValue = "1") int page,
      @RequestParam(value = "perPageNum") int perPageNum,
      Criteria cri, Model model,  HttpSession session) throws Exception {
    User loginUser = (User) session.getAttribute("loginUser");
    if (loginUser == null) {
      throw new Exception("로그인이 필요합니다.");
    }
    logger.info("listPage");

    model.addAttribute("list", pointService.listPage(loginUser.getNo(), cri));

    PageMaker pageMaker = new PageMaker(cri);
    int totalCount = pointService.getTotalCount(loginUser.getNo());
    pageMaker.setTotalCount(totalCount);
    model.addAttribute("pageMaker", pageMaker);

    logger.info(model);
  }

  @GetMapping("detail")
  public void detail(int no, Model model) throws Exception {
    Point point = pointService.get(no);
    model.addAttribute("point", point);
  }

  //total point
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
      return "redirect:userlist?userNo=" + loginUser.getNo() + "&page=1&perPageNum=8" ;
    } else {
      throw new Exception("삭제할 게시물 번호가 유효하지 않습니다.");
    }
  }
}
