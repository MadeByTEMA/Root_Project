package com.keep.root.dao;

import java.util.List;
import java.util.Map;

import com.keep.root.domain.ScrapPlace;
public interface ScrapPlaceDao {
  int insert(Map<String, Object> scrap) throws Exception;

  List<ScrapPlace> findAll(int userNo) throws Exception;

  ScrapPlace findPlaceNo(int reviewPlaceNo) throws Exception;

  int delete(int reviewPlaceNo) throws Exception;
}
