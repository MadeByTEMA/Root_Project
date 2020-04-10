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
  public int update(User user) throws Exception {
    return userDao.update(user);
  }
}
