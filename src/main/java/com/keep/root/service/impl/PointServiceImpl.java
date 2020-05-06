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
  public List<Point> list() throws Exception {
    return pointDao.findAll();
  }

  @Override
  public Point get(int no) throws Exception {
    return pointDao.find(no);
  }

}
