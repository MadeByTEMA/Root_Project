package com.keep.root.service.impl;

import java.util.HashMap;
import java.util.List;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;
import com.keep.root.TempKey;
import com.keep.root.dao.UserDao;
import com.keep.root.domain.User;
import com.keep.root.service.UserService;

@Component
public class UserServiceImpl implements UserService {
  UserDao userDao;

  @Autowired
  JavaMailSender mailSender;

  public UserServiceImpl(UserDao UserDao) {
    this.userDao = UserDao;
  }

  @Override
  public List<User> list() throws Exception {
    return userDao.findAll();
  }

  @Override
  public List<User> list(int userNo) throws Exception {
    return userDao.findAll(userNo);
  }

  @Override
  public int delete(int no) throws Exception {
    return userDao.delete(no);
  }

  @Override
  public int add(User user) throws Exception {

    // 임의의 authkey 생성
    String authKey = new TempKey().getKey(50, false);

    user.setAuthKey(authKey);

    // mail 작성 관련
    MimeMessage mail = mailSender.createMimeMessage();
    String mailContent = "<h1>[이메일 인증]</h1><br><p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>"
        + "<a href='http://localhost:9999/Root_Project/app/user/joinConfirm?email="
        + user.getEmail() + "&authKey=" + authKey + "' target='_blenk'>이메일 인증 확인</a>";

    try {
      mail.setSubject("회원가입 이메일 인증 ", "utf-8");
      mail.setText(mailContent, "utf-8", "html");
      mail.addRecipient(Message.RecipientType.TO, new InternetAddress(user.getEmail()));
      mailSender.send(mail);
    } catch (MessagingException e) {
      e.printStackTrace();
    }
    return userDao.insert(user);
  }

  @Override
  public User get(int no) throws Exception {
    return userDao.findByNo(no);
  }

  @Override
  public User get(String email) throws Exception {
    return userDao.findByEmail(email);
  }

  @Override
  public User get(String email, String password) throws Exception {
    HashMap<String, Object> params = new HashMap<>();
    params.put("email", email);
    params.put("password", password);
    return userDao.findByEmailAndPassword(params);
  }

  @Override
  public List<User> search(String keyword) throws Exception {
    return userDao.findByKeyword(keyword);
  }

  @Override
  public Integer nickNameSearch(String nickName) throws Exception {
    return userDao.nickNameSearch(nickName);
  }

  @Override
  public Integer emailSearch(String email) throws Exception {
    return userDao.emailSearch(email);
  }

  @Override
  public Integer telSearch(String tel) throws Exception {
    return userDao.telSearch(tel);
  }

  @Override
  public int update(User user) throws Exception {
    return userDao.update(user);
  }

  @Override
  public int updateAuthStatus(User user) {
    return userDao.updateAuthStatus(user);
  }

  @Override
  public User get(String name, String tel, String account, String bank) throws Exception {
    HashMap<String, Object> params = new HashMap<>();
    params.put("name", name);
    params.put("tel", tel);
    params.put("account", account);
    params.put("bank", bank);
    return userDao.findForWithdraw(params);
  }
}
