package com.tour.kakao;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
//@RequestMapping(value="/user/*")
@RequestMapping("/user")
public class KakaoController {
	
//	@GetMapping(value="/kakao_login")
//	public String kakaoLogin(@RequestParam(value = "code", required = false) String code, Model model) throws Exception {
//		System.out.println("#########" + code);
//		
//		model.addAttribute("viewName", "kakao/index");
//		return "/template/layout";
//		/*
//		 * 리턴값의 testPage는 아무 페이지로 대체해도 괜찮습니다.
//		 * 없는 페이지를 넣어도 무방합니다.
//		 * 404가 떠도 제일 중요한건 #########인증코드 가 잘 출력이 되는지가 중요하므로 너무 신경 안쓰셔도 됩니다.
//		 */
//    	}
	
//	@Autowried
//	private MemberService ms;
//
//	@RequestMapping(value="/kakaoLogin", method=RequestMethod.GET)
//	public String kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Exception {
//		System.out.println("#########" + code);
//		String access_Token = ms.getAccessToken(code);
//		HashMap<String, Object> userInfo = ms.getUserInfo(access_Token);
//		System.out.println("###access_Token#### : " + access_Token);
//		System.out.println("###nickname#### : " + userInfo.get("nickname"));
//		System.out.println("###email#### : " + userInfo.get("email"));
//		return "member/testPage";
//    }
	
		
		  @GetMapping("/kakao_login")
		  public String kakaoLogin(Model model) {
			  
		  
		  model.addAttribute("viewName", "kakao/index");
		  
		  
		  return "/template/layout"; 
		  }
		 
}
