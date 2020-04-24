package com.keep.root.dao;

import java.util.List;

import com.keep.root.domain.Info;

public interface InfoDao {

	Info findByNo(int no) throws Exception;

	List<Info> findAll() throws Exception;

}
