package com.tour.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tour.test.dao.TESTDAO;

@Controller
public class TestController {
	
	@Autowired
	private TESTDAO testDAO;
	
	@GetMapping("/test1")
	@ResponseBody
	public String test1() {
		return "Hello World";
	}
	
	@GetMapping("/test2")
	@ResponseBody
	public Map<String, Object> test2() {
		Map<String, Object> result = new HashMap<>();
		result.put("테스트", 1);
		result.put("바나나", 2);
		result.put("사과", 3);
		
		return result;
	}
	
	@GetMapping("/test3")
	public String test3() {
		return "test/test";
	}
	
	@GetMapping("/test4")
	@ResponseBody
	public List<Map<String, Object>> test4() {
		return testDAO.selectImageList();
	}
	
}
