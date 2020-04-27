package com.keep.root.dao;

import java.util.List;
import com.keep.root.domain.ScrapDay;

// 데이터를 저장하고 꺼내는 방식(파일, 클라우드저장소, DB 등)에 상관없이
// DAO 사용법을 통일하기 위해
// 메서드 호출 규칙을 정의한다.
//
public interface ScrapDayDao {

  int insert(ScrapDay scrapDay) throws Exception;

  List<ScrapDay> findAll(int userNo) throws Exception;

  ScrapDay findDayNo(int reviewDayNo) throws Exception;

  int delete(int reviewDayNo) throws Exception;
}
