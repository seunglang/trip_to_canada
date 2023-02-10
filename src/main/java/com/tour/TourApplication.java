package com.tour;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

//@EnableScheduling 스케줄링
@SpringBootApplication
public class TourApplication {

	public static void main(String[] args) {
		SpringApplication.run(TourApplication.class, args);
	}

//	@Component
//	public class TestTask() {
//		@Scheduled(cron 문법)
//		public void test() { 이 메소드가 크론 문법에 의해서 수행된다.
//			
//		}
//	}
}
