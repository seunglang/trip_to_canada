package com.tour.test.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface TESTDAO {
	public List<Map<String, Object>> selectImageList();
}
