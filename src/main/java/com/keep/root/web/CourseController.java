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
import com.keep.root.service.CourseDayService;
import com.keep.root.service.CoursePlaceService;
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
  CourseDayService courseDayService;

  @Autowired
  CoursePlaceService coursePlaceService;

  @Autowired
  UserService userService;

  @GetMapping("form")
  public void form() {
  }

  @RequestMapping("add")
  public String add(//
      HttpSession session, //
      String title, //
      Date dayDate, //
      String placeName, //
      String basicAddr, //
      String detailAddr, //
      String etc, //
      Course course) throws Exception {
    User user = (User) session.getAttribute("loginUser");
    if (user == null) {
      throw new Exception("유저 번호가 유효하지 않습니다.");
    }
    course.setUser(user);
    CoursePlace courseplace = new CoursePlace();
    courseplace.setPlaceName(placeName);
    courseplace.setBasicAddr(basicAddr);
    courseplace.setDetailAddr(detailAddr);
    courseplace.setEtc(etc);
    List<CoursePlace> courseplaces = new LinkedList<>();
    courseplaces.add(courseplace);
    CourseDay courseday = new CourseDay();
    courseday.setTitle(title);
    courseday.setDayDate(dayDate);
    courseday.setCoursePlace(courseplaces);
    List<CourseDay> coursedays = new LinkedList<>();
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

  @GetMapping("detail")
  public void detail(int no, Model model) throws Exception {
    model.addAttribute("course", courseService.get(no));
    model.addAttribute("courseday", courseDayService.list(no));
  }

  @GetMapping("delete")
  public String delete(int no, int userNo) throws Exception {
    courseService.delete(no);
    return "redirect:list?userNo=" + userNo;
  }
}
