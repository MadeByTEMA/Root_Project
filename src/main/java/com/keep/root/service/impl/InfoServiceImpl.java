package com.keep.root.service.impl;

import java.util.List;

import org.springframework.stereotype.Component;

import com.keep.root.dao.InfoDao;
import com.keep.root.domain.Info;
import com.keep.root.service.InfoService;

@Component
public class InfoServiceImpl implements InfoService {

  InfoDao infoDao;

  public InfoServiceImpl(InfoDao infoDao) {
    this.infoDao = infoDao;
  }

  @Override
  public Info get(int no) throws Exception {
    return infoDao.findByNo(no);
  }

  @Override
  public List<Info> list() throws Exception {
    return infoDao.findAll();
  }

}
