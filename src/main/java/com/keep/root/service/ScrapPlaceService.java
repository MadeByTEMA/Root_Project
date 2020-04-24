package com.keep.root.service;

import java.util.List;
import java.util.Map;
import com.keep.root.domain.ScrapPlace;

public interface ScrapPlaceService {

  int add(ScrapPlace scrapPlace) throws Exception;

  List<ScrapPlace> list(int userNo) throws Exception;

  ScrapPlace get(int reviewPlaceNo) throws Exception;

  int delete(Map<String, Integer> params) throws Exception;
}
