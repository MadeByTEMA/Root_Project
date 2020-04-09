package com.keep.root.dao;

import java.util.List;

import com.keep.root.domain.PhotoBoard;
import com.keep.root.domain.PhotoFile;

public interface PhotoFileDao {
  int insert(PhotoBoard photoBoard) throws Exception;

  List<PhotoFile> findAll(int boardNo) throws Exception;

  int deleteAll(int boardNo) throws Exception;
}
