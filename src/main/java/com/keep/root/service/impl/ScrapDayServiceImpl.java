package com.keep.root.service.impl;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.support.TransactionTemplate;
import com.keep.root.dao.ScrapDayDao;
import com.keep.root.dao.ScrapPlaceDao;
import com.keep.root.domain.ScrapDay;
import com.keep.root.service.ScrapDayService;

@Component
public class ScrapDayServiceImpl implements ScrapDayService {

  TransactionTemplate transactionTemplate;
  ScrapDayDao scrapDayDao;

  public ScrapDayServiceImpl( //
      PlatformTransactionManager txManager, // 
      ScrapDayDao scrapDayDao //
      ) {
    this.transactionTemplate = new TransactionTemplate(txManager);
    this.scrapDayDao = scrapDayDao;
  }

  @Override
  public int add(ScrapDay scrapDay) throws Exception {
    return scrapDayDao.insert(scrapDay);
  }

  @Override
  public List<ScrapDay> list(int userNo) throws Exception {
    return scrapDayDao.findAll(userNo);
  }

  @Override
  public ScrapDay get(int reviewDayNo) throws Exception {
    return scrapDayDao.findDayNo(reviewDayNo);
  }

  @Override
  public int delete(Map<String, Integer> params) throws Exception {
    return scrapDayDao.delete(params);
  }

  
}
