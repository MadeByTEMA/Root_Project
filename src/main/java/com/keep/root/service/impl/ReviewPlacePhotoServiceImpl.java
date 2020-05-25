package com.keep.root.service.impl;

import java.util.List;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.support.TransactionTemplate;
import com.keep.root.dao.ReviewPlacePhotoDao;
import com.keep.root.domain.ReviewPlace;
import com.keep.root.domain.ReviewPlacePhoto;
import com.keep.root.service.ReviewPlacePhotoService;

@Component
public class ReviewPlacePhotoServiceImpl implements ReviewPlacePhotoService {

  TransactionTemplate transactionTemplate;
  ReviewPlacePhotoDao reviewPlacePhotoDao;

  public ReviewPlacePhotoServiceImpl( //
      PlatformTransactionManager txManager, //
      ReviewPlacePhotoDao reviewPlacePhotoDao //
  ) {
    this.transactionTemplate = new TransactionTemplate(txManager);
    this.reviewPlacePhotoDao = reviewPlacePhotoDao;
  }

  @Override
  public int add(ReviewPlacePhoto reviewPlacePhoto) throws Exception {
    return reviewPlacePhotoDao.insert(reviewPlacePhoto);
  }

  @Override
  public List<ReviewPlacePhoto> list(int reviewPlaceNo) throws Exception {
    return reviewPlacePhotoDao.findAllByReviewPlaceNo(reviewPlaceNo);
  }

  @Override
  public ReviewPlacePhoto get(int no) throws Exception {
    return reviewPlacePhotoDao.findByNo(no);
  }

  @Override
  public int update(ReviewPlacePhoto reviewPlacePhoto) throws Exception {
    return reviewPlacePhotoDao.update(reviewPlacePhoto);
  }

  @Override
  public int delete(int no) throws Exception {
    return reviewPlacePhotoDao.delete(no);
  }

  // 
  @Override
  public List<ReviewPlacePhoto> listGet(int no) throws Exception {
	  return reviewPlacePhotoDao.findAll(no);
  }

	@Override
	public ReviewPlacePhoto searchPhotoGet(int no) throws Exception {
		return reviewPlacePhotoDao.find(no);
	}
}
