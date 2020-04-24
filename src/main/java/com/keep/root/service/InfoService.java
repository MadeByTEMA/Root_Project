package com.keep.root.service;

import java.util.List;

import com.keep.root.domain.Info;

public interface InfoService {

	Info get(int no) throws Exception;

	List<Info> list() throws Exception;

}
