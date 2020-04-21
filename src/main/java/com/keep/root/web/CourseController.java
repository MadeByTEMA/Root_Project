package com.keep.root.web;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.keep.root.domain.Course;
import com.keep.root.domain.User;
import com.keep.root.service.CourseService;
import com.keep.root.service.UserService;

@Controller
@RequestMapping("/course")
public class CourseController {

  @Autowired
  ServletContext servletContext;

  @Autowired
  CourseService courseService;

  @Autowired
  UserService userService;

  @PostMapping("add")
  public String add(//
      int userNo, //
      Course course) throws Exception {
    User user = userService.get(userNo);
    if (user == null) {
      throw new Exception("유저 번호가 유효하지 않습니다.");
    }

    course.setUser(user);
    if (courseService.add(course) > 0) {
      return "redirect:list?userNo=" + userNo;
    } else {
      throw new Exception("코스 등록에 실패했습니다.");
    }
  }

  @GetMapping("list")
  public void list(HttpSession session, Model model) throws Exception {
    User user = (User) session.getAttribute("loginUser");
    if (user == null) {
      throw new Exception("로그인이 필요합니다.");
    }
    model.addAttribute("list", courseService.list(user.getNo()));
  }

  @GetMapping("detail")
  public void detail(int userNo, Model model) throws Exception {
    model.addAttribute("course", courseService.get(userNo));
  }

  @GetMapping("delete")
  public String delete(int no, int userNo) throws Exception {
    courseService.delete(no);
    return "redirect:list?userNo=" + userNo;
  }
}
