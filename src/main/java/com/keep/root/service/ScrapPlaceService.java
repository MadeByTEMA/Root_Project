package com.keep.root.service;

import java.util.List;
import com.keep.root.domain.ScrapPlace;

public interface ScrapPlaceService {
  int addReviewPlace(int userNo, int reviewPlaceNo) throws Exception;

  List<ScrapPlace> list(int userNo) throws Exception;

  ScrapPlace get(int reviewPlaceNo) throws Exception;

  int delete(int reviewPlaceNo) throws Exception;
}
