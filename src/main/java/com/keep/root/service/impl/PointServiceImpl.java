package com.keep.root.service.impl;

import java.util.HashMap;
import java.util.List;
import org.springframework.stereotype.Component;
import com.keep.root.dao.PointDao;
import com.keep.root.domain.Point;
import com.keep.root.service.PointService;

@Component
public class PointServiceImpl implements PointService {

  PointDao pointDao;

  public PointServiceImpl(PointDao pointDao) {
    this.pointDao = pointDao;
  }

  @Override
  public int scrapAdd(//
      int userNo, //
      int reviewUserNo, //
      int pointType, //
      int content, //
      int price//
  ) throws Exception {
    HashMap<String, Object> params = new HashMap<>();
    if (userNo == reviewUserNo) {
      throw new Exception("동일한 게시물은 스크랩 할 수 없습니다.");
    } else {
    	params.put("userNo", userNo);
    	params.put("reviewUserNo", reviewUserNo);
    	params.put("pointType", pointType);
    	params.put("content", content);
    	params.put("price", price);
    } 
    return pointDao.insert(params) ;
  }
  // pointType : 입금 0 출금 1
  // content :
  // 1,2,3,4,
  // 1. 포인트 적립
  // 2. 포인트 사용
  // 3. 충전 결제
  // 4. 출금 계좌 출금
  
  // pointNo에 대해서 userNo -30/ trader 30 

  @Override
  public List<Point> list() throws Exception {
    return pointDao.findAll();
  }

  @Override
  public List<Point> list(int userNo) throws Exception {
    return pointDao.findAllByUser(userNo);
  }

  @Override
  public List<Point> findOutputByUserNo() throws Exception {
    return pointDao.findOutputByUserNo();
  }

  @Override
  public Point get(int no) throws Exception {
    return pointDao.find(no);
  }

  @Override
  public Point getUser(int userNo) throws Exception {
    return pointDao.findByUserNo(userNo);
  }

  @Override
  public Point getTrader(int traderNo) throws Exception {
    return pointDao.findBytraderNo(traderNo);
  }

  @Override
  public int update(Point point) throws Exception {
    return pointDao.update(point);
  }

  @Override
  public int delete(int no) throws Exception {
    return pointDao.delete(no);
  }

  @Override
  public void withdraw(Point point) throws Exception {
    // TODO Auto-generated method stub

  }

}
