package com.keep.root.service.impl;

import java.util.HashMap;
import java.util.List;
import org.springframework.stereotype.Component;
import com.keep.root.dao.UserDao;
import com.keep.root.domain.User;
import com.keep.root.service.UserService;

@Component
public class UserServiceImpl implements UserService {

  UserDao userDao;

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
    return userDao.insert(user);
  }

  @Override
  public User get(int no) throws Exception {
    return userDao.findByNo(no);
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
  public User get(String name, String tel, String account, String bank) throws Exception {
    HashMap<String, Object> params = new HashMap<>();
    params.put("name", name);
    params.put("tel", tel);
    params.put("account", account);
    params.put("bank", bank);
    return userDao.findForWithdraw(params);
  }
}
