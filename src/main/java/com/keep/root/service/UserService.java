package com.keep.root.service;

import java.util.List;
import com.keep.root.domain.User;

public interface UserService {

  List<User> list() throws Exception;

  int delete(int no) throws Exception;

  int add(User user) throws Exception;

  User get(int no) throws Exception;

  User get(String email) throws Exception;

  User get(String email, String password) throws Exception;

  List<User> search(String keyword) throws Exception;

  int update(User user) throws Exception;

  Integer nickNameSearch(String nickName) throws Exception;

  Integer emailSearch(String email) throws Exception;

  Integer telSearch(String tel) throws Exception;

  int updateAuthStatus(User user);

  // withdraw
  List<User> list(int userNo) throws Exception;

  User get(String name, String tel, String account, String bank) throws Exception;



}
