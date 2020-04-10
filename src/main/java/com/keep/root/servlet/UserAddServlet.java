package com.keep.root.servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.springframework.context.ApplicationContext;

import com.keep.root.domain.User;
import com.keep.root.service.UserService;

@WebServlet("/user/add")
@MultipartConfig(maxFileSize = 1000000)
public class UserAddServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    request.getRequestDispatcher("/user/addform.jsp").include(request, response);
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    try {
      request.setCharacterEncoding("UTF-8");

      ServletContext servletContext = getServletContext();
      ApplicationContext iocContainer = (ApplicationContext) servletContext.getAttribute("iocContainer");
      UserService userService = iocContainer.getBean(UserService.class);

      User user = new User();
      user.setEmail(request.getParameter("email"));
      user.setPassword(request.getParameter("password"));
      user.setName(request.getParameter("name"));
      user.setBirth(Date.valueOf(request.getParameter("birth")));
      user.setGender(Integer.parseInt(request.getParameter("gender")));
      user.setTel(request.getParameter("tel"));
      user.setZipCode(Integer.parseInt(request.getParameter("zipCode")));
      user.setBasicAddr(request.getParameter("basicAddr"));
      user.setDetailAddr(request.getParameter("detailAddr"));
      user.setNickName(request.getParameter("nickName"));
      Part photoPart = request.getPart("photo");
      if (photoPart.getSize() > 0) {
        String dirPath = getServletContext().getRealPath("/upload/user");
        String filename = UUID.randomUUID().toString();
        photoPart.write(dirPath + "/" + filename);
        user.setPhoto(filename);
      }

      if (userService.add(user) > 0) {
        response.sendRedirect("../index.html");
      } else {
        throw new Exception("회원을 추가할 수 없습니다.");
      }
    } catch (Exception e) {
      request.setAttribute("error", e);
      request.setAttribute("url", "list");
      request.getRequestDispatcher("/error").forward(request, response);
    }
  }
}
