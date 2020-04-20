package com.keep.root.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.keep.root.domain.User;
import com.keep.root.service.UserService;

@Controller
@RequestMapping("/auth")
public class AuthController {

  @Autowired
  UserService userService;

  @GetMapping("form")
  public void form() {
  }

  @PostMapping("login")
  public String login(String email, String password, String saveEmail, HttpServletResponse response,
      HttpSession session, Model model) throws Exception {

    Cookie cookie = new Cookie("email", email);
    if (saveEmail != null) {
      cookie.setMaxAge(60 * 60 * 24 * 30);
    } else {
      cookie.setMaxAge(0);
    }
    response.addCookie(cookie);

    User user = userService.get(email, password);
    if (user != null) {
      session.setAttribute("loginUser", user);
      model.addAttribute("refreshUrl", "2;url=../../index.html");
      // 인클루딩 되는 서블릿은 응답 헤더를 추가할 수 없다.
      // 따라서 프론트 컨트롤러에게 추가해달라고 요청해야 한다.
    } else {
      session.invalidate();
      model.addAttribute("refreshUrl", "2;url=login");
    }
    return "auth/login";
  }

  @RequestMapping("logout")
  public String logout(HttpSession session) {
    session.invalidate();
    return "redirect:../../index.html";
  }
}
