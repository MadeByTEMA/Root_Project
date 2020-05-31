package com.keep.root.service.impl;

import java.util.HashMap;
import java.util.List;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.support.TransactionTemplate;
import com.keep.root.dao.ScrapPlaceDao;
import com.keep.root.domain.ScrapPlace;
import com.keep.root.service.ScrapPlaceService;

@Component
public class ScrapPlaceServiceImpl implements ScrapPlaceService {

  TransactionTemplate transactionTemplate;
  ScrapPlaceDao scrapPlaceDao;

  public ScrapPlaceServiceImpl(PlatformTransactionManager txManager, ScrapPlaceDao scrapPlaceDao) {
    this.transactionTemplate = new TransactionTemplate(txManager);
    this.scrapPlaceDao = scrapPlaceDao;
  }

  @Override
  public int addReviewPlace(int userNo, int reviewPlaceNo) throws Exception {
	    HashMap<String, Object> params = new HashMap<>();
	    params.put("userNo", userNo);
	    params.put("reviewPlaceNo", reviewPlaceNo);
	    return scrapPlaceDao.insert(params);
	  }

  @Override
  public List<ScrapPlace> list(int scrapDayNo) throws Exception {
    return scrapPlaceDao.findAll(scrapDayNo);
  }

  @Override
  public ScrapPlace get(int reviewPlaceNo) throws Exception {
    // TODO Auto-generated method stub
    return scrapPlaceDao.findPlaceNo(reviewPlaceNo);
  }

  @Override
  public int delete(int reviewPlaceNo) throws Exception {
    return scrapPlaceDao.delete(reviewPlaceNo);
  }

}
