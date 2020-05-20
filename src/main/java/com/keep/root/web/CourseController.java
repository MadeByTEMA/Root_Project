package com.keep.root.web;

import java.sql.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.keep.root.domain.Course;
import com.keep.root.domain.CourseDay;
import com.keep.root.domain.CoursePlace;
import com.keep.root.domain.User;
import com.keep.root.service.CourseService;
import com.keep.root.service.ScrapDayService;
import com.keep.root.service.ScrapPlaceService;
import com.keep.root.service.UserService;

@Controller
@RequestMapping("/course")
public class CourseController {

  @Autowired
  ServletContext servletContext;

  @Autowired
  CourseService courseService;

  @Autowired
  ScrapDayService scrapDayService;

  @Autowired
  ScrapPlaceService scrapPlaceService;

  @Autowired
  UserService userService;

  @GetMapping("form")
  public void form(String no, HttpSession session, Model model) throws Exception {
    User user = (User) session.getAttribute("loginUser");
    if (user == null) {
      throw new Exception("로그인이 필요합니다.");
    }
    if (!no.equals("newForm")) {
      int courseNo = Integer.parseInt(no);
      model.addAttribute("course", courseService.get(courseNo));
    }

    model.addAttribute("scrapDays", scrapDayService.list(user.getNo()));
    model.addAttribute("scrapPlaces", scrapPlaceService.list(user.getNo()));
  }

  @RequestMapping("add")
  public String add(//
      HttpSession session, //
      String title, //
      Date dayDate, //

      String[] placeNames, //
      String[] basicAddrs, //
      String[] detailAddrs, //
      String[] etcs, //
      Course course) throws Exception {
    User user = (User) session.getAttribute("loginUser");
    if (user == null) {
      throw new Exception("유저 번호가 유효하지 않습니다.");
    }

    course.setUser(user);

    List<CoursePlace> courseplaces = new LinkedList<>();

    for (int i = 0; i < placeNames.length; i++) {
      CoursePlace courseplace = new CoursePlace(placeNames[i], basicAddrs[i], detailAddrs[i], etcs[i]);
      courseplaces.add(courseplace);
    }

    List<CourseDay> coursedays = new LinkedList<>();
    CourseDay courseday = new CourseDay(title, dayDate, courseplaces);
    coursedays.add(courseday);

    course.setCourseDay(coursedays);
    courseService.add(course);
    return "redirect:list?userNo=" + user.getNo();
  }

  @GetMapping("list")
  public void list(HttpSession session, Model model) throws Exception {
    User user = (User) session.getAttribute("loginUser");
    if (user == null) {
      throw new Exception("로그인이 필요합니다.");
    }
    model.addAttribute("list", courseService.list(user.getNo()));
  }
  /*
   * @GetMapping("detail") public void detail(int no, Model model) throws
   * Exception { model.addAttribute("course", courseService.get(no)); }
   */

  @GetMapping("delete")
  public String delete(int no, int userNo) throws Exception {
    courseService.delete(no);
    return "redirect:list?userNo=" + userNo;
  }
}
