package com.keep.root.dao;

import java.util.List;

import com.keep.root.domain.Info;

public interface InfoDao {

	List<Info> findAll() throws Exception;

	Info findByNo(int no) throws Exception;

}
