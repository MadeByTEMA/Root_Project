package com.keep.root.dao;

import java.util.List;
import java.util.Map;
import com.keep.root.domain.ScrapDay;

public interface ScrapDayDao {
  int insert(Map<String, Object> scrap) throws Exception;

  List<ScrapDay> findAll(int userNo) throws Exception;

  ScrapDay findDayNo(int reviewDayNo) throws Exception;

  int delete(int reviewDayNo) throws Exception;
}
