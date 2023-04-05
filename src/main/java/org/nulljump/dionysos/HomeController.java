package org.nulljump.dionysos;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import org.nulljump.dionysos.product.model.service.ProductService;
import org.nulljump.dionysos.product.model.vo.Product;
//import org.nulljump.dionysos.users.model.service.UsersService;
//import org.nulljump.dionysos.users.model.vo.Users;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	private ProductService productService;

//	@Autowired
//	private UsersService usersService;

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

		model.addAttribute("serverTime", formattedDate);

		return "home";
	}

	// index.jsp 가 웰컴될 때 포워딩된 요청을 받아서 main.jsp
	// common/main.jsp 를 내보내기 위해 리턴하는 메소드
	@RequestMapping(value = "main.do")
	public ModelAndView forwardMainView(ModelAndView mv) {
		ArrayList<Product> list1 = productService.selectNew4();
		ArrayList<Product> list2 = productService.selectTop4();
		mv.addObject("list1", list1);
		mv.addObject("list2", list2);

		mv.setViewName("common/main");

		return mv;
	}
}
