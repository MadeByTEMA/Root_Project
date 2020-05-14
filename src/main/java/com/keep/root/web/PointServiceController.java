package com.keep.root.web;

import javax.servlet.ServletContext;
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
  public void form(int userNo, Model model) throws Exception {
    model.addAttribute("user", userService.get(userNo));
    model.addAttribute("point", pointService.get(userNo));

    // return "redirect:form?userNo=" + userNo;
  }

  @GetMapping("payment")
  public String payment() throws Exception {
    return "/point/payment";
  }

  @PostMapping("add")
  public String add(//
      int userNo, //
      int tarderNo, //
      int pointType, //
      int content, //
      int price) throws Exception {
    User user = userService.get(userNo);
    if (user == null) {
      throw new Exception("없음");
    }

    // tarderNo은 Scarp을 당할때 저장되는 번호
    //
    Point point = new Point();
    point.setTraderNo(tarderNo);
    point.setContent(content);
    point.setPointType(pointType);
    point.setPrice(price);
    point.setUser(user);

    return "redirect:list?userNo=" + userNo;
  }

  // @PostMapping("withdraw")
  // public String withdraw(//
  // String name, //
  // String tel, //
  // String account, //
  // String bank, //
  // int price, //
  // int no, //
  // HttpServletResponse response, //
  // HttpSession session, //
  // Model model) throws Exception {
  //
  // User user = userService.get(name, tel, account, bank);
  // if (user == null) {
  // throw new Exception("정보가 일치하지 않습니다.");
  // }
  // model.addAttribute("user", user);
  //
  // Point point = (Point) session.getAttribute("point");
  // point.setPrice(price);
  //
  // pointService.update(point);
  //
  // return "/WEB-INF/jsp/point/form.jsp";
  // // return "/WEB-INF/view/point/withdraw.jsp";
  // }

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

  // @GetMapping
  // public ModelAndView listOutput(//
  // HttpServletRequest request, //
  // @RequestParam("user") User user) throws Exception {
  // ModelAndView mv = new ModelAndView();
  // mv.addObject("out", pointService.findOutputByUserNo());
  // mv.addObject("user", user);
  // mv.setViewName("output");
  // return mv;
  // }
  // model

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
  public String delete(int no) throws Exception {
    if (pointService.delete(no) > 0) {
      return "redirect:list";
    } else {
      throw new Exception("삭제할 게시물 번호가 유효하지 않습니다.");
    }
  }
}
