package com.keep.root.service.impl;

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
  public int add(Point point) throws Exception {
    return pointDao.insert(point);
  }

  @Override
  public void withdraw(Point point) throws Exception {
    pointDao.insert(point);
  }

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



}
