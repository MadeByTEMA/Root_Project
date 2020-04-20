package com.keep.root.web;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import com.keep.root.domain.User;
import com.keep.root.service.UserService;

public class UserController {
  static Logger logger = LogManager.getLogger(UserController.class);

  @Autowired
  UserService userService;

  public UserController() {
    logger.debug("UserController 생성됨!");
  }

  @RequestMapping("/user/form")
  public String form() throws Exception {
    return "/user/form.jsp";
  }

  @RequestMapping("/user/add")
  public String add(User user) throws Exception {
    userService.add(user);
    return "redirect:list";
  }
}
