package com.tour;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.util.ObjectUtils;

@SpringBootTest
class TourApplicationTests {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 수행 단축키 : alt + shift + x(오른쪽에 창이 뜨면 t)
	@Test
	void contextLoads() {
		logger.info("###### logger test");
	}
	
	// 테스트는 한글 허용
	@Test
	void 더하기테스트() {
		logger.info("$$$$$$$$ 더하기 테스트 시작");
		int a = 10;
		int b = 20;
		
		assertEquals(30, a + b);
	}
	
	@Test
	void 널체크() {
		String a = null;
		if (ObjectUtils.isEmpty(a)) {
			logger.info("비어있다");
		} else {
			logger.info("비어있지 않다.");
		}
		
		List<String> list = null;
		logger.info(ObjectUtils.isEmpty(list) + "");
	}

}
