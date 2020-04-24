package com.keep.root.dao;

import java.util.List;
import java.util.Map;
import com.keep.root.domain.ScrapPlace;

// 데이터를 저장하고 꺼내는 방식(파일, 클라우드저장소, DB 등)에 상관없이
// DAO 사용법을 통일하기 위해
// 메서드 호출 규칙을 정의한다.
//
public interface ScrapPlaceDao {

  int insert(ScrapPlace scrapPlace) throws Exception;

  List<ScrapPlace> findAll(int userNo) throws Exception;

  ScrapPlace findPlaceNo(int reviewPlaceNo) throws Exception;

  int delete(Map<String, Integer> params) throws Exception;
}
