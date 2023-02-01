package kh.team2.swith;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "/rtc", method = RequestMethod.GET)
	public String webrtc() {
		
		return "webrtctest/webrtctest";
	}
	
	@RequestMapping(value = "/caja_index", method = RequestMethod.GET)
	public String caja() {
		return "caja/index";
	}
	@RequestMapping(value = "/caja_header", method = RequestMethod.GET)
	public String caja1() {
		return "caja/header";
	}
	@RequestMapping(value = "/caja_project", method = RequestMethod.GET)
	public String caja2() {
		return "caja/project";
	}
	@RequestMapping(value = "/caja_tags", method = RequestMethod.GET)
	public String caja3() {
		return "caja/tags";
	}
	@RequestMapping(value = "/caja_page", method = RequestMethod.GET)
	public String caja4() {
		return "caja/page";
	}
	@RequestMapping(value = "/caja_fullwidth", method = RequestMethod.GET)
	public String caja5() {
		return "caja/full-width-page";
	}
	
	// temp
	@RequestMapping(value = "/index_temp", method = RequestMethod.GET)
	public String caja6() {
		return "temp";
	}
	
	// project
	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public String map1() {
		return "map/map_home";
	}
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String map2() {
		return "join";
	}
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String map3() {
		return "login";
	}
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		return "main";
	}
	// 삭제예정
	@RequestMapping(value = "/loginmain", method = RequestMethod.GET)
	public String main2() {
		return "loginmain";
	}
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String myPage1() {
		return "myPage/myPage";
	}
	@RequestMapping(value = "/myskd", method = RequestMethod.GET)
	public String myPage2() {
		return "myPage/mySchedule";
	}
	@RequestMapping(value = "/mystd", method = RequestMethod.GET)
	public String myPage3() {
		return "myPage/myStudy";
	}
	@RequestMapping(value = "/mystden", method = RequestMethod.GET)
	public String myPage4() {
		return "myPage/myStudyEnroll";
	}
	
}
