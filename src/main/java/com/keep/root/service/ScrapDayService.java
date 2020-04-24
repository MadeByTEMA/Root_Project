package com.keep.root.service;

import java.util.List;
import java.util.Map;
import com.keep.root.domain.ScrapDay;

public interface ScrapDayService {

  int add(ScrapDay scrapDay) throws Exception;

  List<ScrapDay> list(int userNo) throws Exception;

  ScrapDay get(int reviewDayNo) throws Exception;

  int delete(Map<String, Integer> params) throws Exception;
}
