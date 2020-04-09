package com.keep.root.domain;

import java.sql.Date;

public class User {

  int no;
  String name;
  Date birth;
  int gender;
  String email;
  String password;
  String tel;
  int zipCode;
  String basicAddr;
  String detailAddr;
  String photo;
  String nickName;
  int account;
  String bank;
  int point; // setter 아직 정의 안함.

  @Override
  public String toString() {
    return "User [no=" + no + ", name=" + name + ", birth=" + birth + ", gender=" + gender + ", email=" + email
        + ", password=" + password + ", tel=" + tel + ", zipCode=" + zipCode + ", basicAddr=" + basicAddr
        + ", detailAddr=" + detailAddr + ", photo=" + photo + ", nickName=" + nickName + ", account=" + account
        + ", bank=" + bank + "]";
  }

  public int getNo() {
    return no;
  }

  public void setNo(int no) {
    this.no = no;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public Date getBirth() {
    return birth;
  }

  public void setBirth(Date birth) {
    this.birth = birth;
  }

  public int getGender() {
    return gender;
  }

  public void setGender(int gender) {
    this.gender = gender;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getTel() {
    return tel;
  }

  public void setTel(String tel) {
    this.tel = tel;
  }

  public int getZipCode() {
    return zipCode;
  }

  public void setZipCode(int zipCode) {
    this.zipCode = zipCode;
  }

  public String getBasicAddr() {
    return basicAddr;
  }

  public void setBasicAddr(String basicAddr) {
    this.basicAddr = basicAddr;
  }

  public String getDetailAddr() {
    return detailAddr;
  }

  public void setDetailAddr(String detailAddr) {
    this.detailAddr = detailAddr;
  }

  public String getPhoto() {
    return photo;
  }

  public void setPhoto(String photo) {
    this.photo = photo;
  }

  public String getNickName() {
    return nickName;
  }

  public void setNickName(String nickName) {
    this.nickName = nickName;
  }

  public int getAccount() {
    return account;
  }

  public void setAccount(int account) {
    this.account = account;
  }

  public String getBank() {
    return bank;
  }

  public void setBank(String bank) {
    this.bank = bank;
  }

  public int getPoint() {
    return point;
  }

  public void setPoint(int point) {
  }
}
