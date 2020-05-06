package com.keep.root.service;

import java.util.List;
import org.springframework.stereotype.Service;
import com.keep.root.domain.Point;

@Service
public interface PointService {


  List<Point> list() throws Exception;

  Point get(int no) throws Exception;

}
