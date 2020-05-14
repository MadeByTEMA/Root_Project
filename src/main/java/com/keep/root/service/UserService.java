package com.keep.root.service;

import java.util.List;
import com.keep.root.domain.User;

public interface UserService {

  List<User> list() throws Exception;

  int delete(int no) throws Exception;

  int add(User user) throws Exception;

  User get(int no) throws Exception;

  User get(String email, String password) throws Exception;

  List<User> search(String keyword) throws Exception;

  int update(User member) throws Exception;

  // withdraw
  List<User> list(int userNo) throws Exception;

  User get(String name, String tel, String account, String bank) throws Exception;

}
