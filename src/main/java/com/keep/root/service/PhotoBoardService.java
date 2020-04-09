package com.keep.root.service;

import java.util.List;

import com.keep.root.domain.PhotoBoard;

public interface PhotoBoardService {
  void add(PhotoBoard photoBoard) throws Exception;

  List<PhotoBoard> listLessonPhoto(int lessonNo) throws Exception;

  PhotoBoard get(int no) throws Exception;

  void update(PhotoBoard photoBoard) throws Exception;

  void delete(int no) throws Exception;
}
