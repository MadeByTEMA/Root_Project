package com.keep.root.service;

import java.util.List;
import com.keep.root.domain.Criteria;
import com.keep.root.domain.Point;

public interface PointService {

  int scrapAdd(//
      int userNo, //
      int reviewUserNo, //
      int pointType, //
      int content, //
      int price) throws Exception;

  List<Point> list() throws Exception;

  List<Point> list(int userNo) throws Exception;

  List<Point> findOutputByUserNo() throws Exception;

  Point get(int no) throws Exception;

  Point getUser(int userNo) throws Exception;

  // getUserNo() - list 연결

  Point getTrader(int traderNo) throws Exception;

  int update(Point point) throws Exception;

  int delete(int no) throws Exception;

  // paging
  int getTotalCount(int userNo) throws Exception;

  List<Point> listPage(int userNo, Criteria cri) throws Exception;

}
