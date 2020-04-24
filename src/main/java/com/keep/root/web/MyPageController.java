package com.keep.root.web;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.keep.root.service.UserService;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
  @Autowired
  ServletContext servletContext;

  @Autowired
  UserService userService;

  @GetMapping("form")
  public void form() {
  }
}
