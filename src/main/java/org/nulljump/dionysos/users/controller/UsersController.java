package org.nulljump.dionysos.users.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.nulljump.dionysos.common.Paging;
import org.nulljump.dionysos.common.SearchDate;
import org.nulljump.dionysos.common.Searchs;
import org.nulljump.dionysos.order.model.service.OrderService;
import org.nulljump.dionysos.product.model.service.ProductService;
import org.nulljump.dionysos.product.model.vo.Product;
import org.nulljump.dionysos.users.model.service.UsersService;
import org.nulljump.dionysos.users.model.vo.Users;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UsersController {

	private static final Logger logger = LoggerFactory.getLogger(UsersController.class);

	@Autowired
	private UsersService usersService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private ProductService productService;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@RequestMapping(value = "loginPage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String moveLoginPage() {
		return "users/loginPage";
	}

	// 회원가입 페이지 내보내기
	@RequestMapping("enrollPage.do")
	public String moveEnrollPage() {
		return "users/enrollPage";
	}

	// 회원정보 수정페이지 내보내기
	@RequestMapping("moveup.do")
	public String moveUpdatePage(@RequestParam("user_id") String user_id, Model model) {
		Users users = usersService.selectUsers(user_id);

		if (users != null) {
			model.addAttribute("users", users);
			return "users/updatePage";
		} else {
			model.addAttribute("message", user_id + " : 회원 조회 실패!");
			return "common/error";
		}
	}

	// 로그인 처리용
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String loginMethod(Users users, HttpSession session, SessionStatus status, Model model) {
		logger.info("login.do : " + users);
		
		ArrayList<Product> list1 = productService.selectNew4();
		ArrayList<Product> list2 = productService.selectTop4();
		model.addAttribute("list1", list1);
		model.addAttribute("list2", list2);

		Users loginUsers = usersService.selectUsers(users.getUser_id());
		if (loginUsers == null) {
			// 예외 처리
			model.addAttribute("message", "로그인 실패 : 존재하지 않는 사용자입니다.");
			return "common/error";
		} else if (loginUsers.getEmail() == null) {
			// 예외 처리
			model.addAttribute("message", "로그인 실패 : 이메일 정보가 없습니다.");
			return "common/error";
		}   else if (this.bcryptPasswordEncoder.matches(users.getPassword(), loginUsers.getPassword())) {
			session.setAttribute("loginUsers", loginUsers);
			status.setComplete();
			if(loginUsers.getAdmin().equals("Y")) {
				return "admin/admin";
			} else {
				return "common/main";
			}
			
		} else {
			model.addAttribute("message", "로그인 실패 : 아이디나 암호 확인하세요.");
			return "common/error";
		}
	}

	@RequestMapping("logout.do")
	public String logoutMethod(HttpServletRequest request, Model model) {
		
		ArrayList<Product> list1 = productService.selectNew4();
		ArrayList<Product> list2 = productService.selectTop4();
		model.addAttribute("list1", list1);
		model.addAttribute("list2", list2);

		
		HttpSession session = request.getSession(false);
		logger.info("logout.do : " + session);

		if (session != null) {
			session.invalidate();
			return "common/main";
		} else {
			model.addAttribute("message", "로그인 세션이 존재하지 않습니다");
			return "common/error";
		}
	}

	// ajax 통신으로 아이디 중복확인 요청
	@RequestMapping(value = "idchk.do", method = RequestMethod.POST)
	public void dupCheckIdMethod(@RequestParam("user_id") String user_id, HttpServletResponse response)
			throws IOException {
		int idCount = usersService.selectDupCheckId(user_id);

		String returnStr = null;
		if (idCount == 0) {
			returnStr = "ok";
		} else {
			returnStr = "duple";
		}

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.append(returnStr);
		out.flush();
		out.close();
	}

	// 회원가입 요청
	@RequestMapping(value = "enroll.do", method = RequestMethod.POST)
	public String usersInsertMethod(Users users, Model model) {
		logger.info("enroll.do : " + users);

		// 패스워드 암호화 처리
		users.setPassword(bcryptPasswordEncoder.encode(users.getPassword()));
		logger.info("after encode : " + users.getPassword());
		logger.info("length : " + users.getPassword().length());

		if (usersService.insertUsers(users) > 0) {
			// 회원 가입 성공
			return "common/main";
		} else {
			// 회원 가입 실패
			model.addAttribute("message", "회원 가입 실패!");
			return "common/error";
		}
	}

	@RequestMapping("myinfo.do")
	public ModelAndView memberDetailMethod(@RequestParam("user_id") String user_id, ModelAndView mv) {
		Users users = usersService.selectUsers(user_id);

		if (users != null) {
			mv.addObject("users", users);
			mv.setViewName("users/myinfoPage");
		} else {
			mv.addObject("message", user_id + " : 회원 정보 조회 실패!");
			mv.setViewName("common/error");
		}

		return mv;
	}
	
	@RequestMapping("myinfodetail.do")
	public ModelAndView memberInfoDetailMethod(@RequestParam("user_id") String user_id, ModelAndView mv) {
		Users users = usersService.selectUsers(user_id);

		if (users != null) {
			mv.addObject("users", users);
			mv.setViewName("users/myinfoUpdatePage");
		} else {
			mv.addObject("message", user_id + " : 회원 정보 조회 실패!");
			mv.setViewName("common/error");
		}

		return mv;
	}

	// 회원 탈퇴(삭제) 요청
	@RequestMapping("mdel.do")
	public String usersDeleteMethod(@RequestParam("user_id") String user_id, Model model) {
		logger.info("mdel.do : " + user_id);

		if (usersService.deleteUsers(user_id) > 0) {
			return "redirect:logout.do";
		} else {
			model.addAttribute("message", user_id + " : 회원 삭제 실패!");
			return "common/error";
		}
	}

	// 회원정보 수정 처리
	@RequestMapping(value = "mupdate.do", method = RequestMethod.POST)
	public String usersUpdateMethod(Users users, Model model, @RequestParam("origin_password") String originUserpwd) {
		logger.info("mupdate.do : " + users);

		String userpwd = users.getPassword().trim();
		if (userpwd != null && userpwd.length() > 0) {
			if (!this.bcryptPasswordEncoder.matches(userpwd, originUserpwd)) {
				users.setPassword(this.bcryptPasswordEncoder.encode(userpwd));
			} else {
				users.setPassword(originUserpwd);
			}

		}
		if (usersService.updateUsers(users) > 0) {

			return "redirect:myinfo.do?user_id=" + users.getUser_id();
		} else {
			model.addAttribute("message", users.getUser_id() + " : 회원 정보 수정 실패!");
			return "common/error";
		}
	}

	// 회원관리용 회원전체목록 조회 처리
	@RequestMapping("mlist.do")
	public String usersListViewMethod(Model model) {
		ArrayList<Users> list = usersService.selectList();

		if (list != null && list.size() > 0) {
			model.addAttribute("list", list);
			return "users/adminUserListView";
		} else {
			model.addAttribute("message", "회원 정보가 존재하지 않습니다.");
			return "common/error";
		}
	}

	

	// 아이디 찾기(페이지로)
	@RequestMapping(value = "findid_form.do")
	public String findid() throws Exception {
		return "users/findIdPage";
	}

	// 아이디 찾기
	@RequestMapping(value = "find_id.do", method = RequestMethod.POST)
	public String findid(@RequestParam("email") String email, Model model) throws Exception {
		String user_id = usersService.find_id(email);

		if (user_id == null) {
			model.addAttribute("message", "이메일이 일치하지 않습니다");
			return "common/error";
		} else {
			model.addAttribute("user_id", user_id);
			return "users/findidsuccess";
		}
	}

	// 비밀번호 찾기(페이지로)
	@RequestMapping(value = "findpw_form.do")
	public String findpw() throws Exception {
		return "users/findPwPage";
	}

	public void send_mail(Users users) {
		// 서버 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "wlstjr2234@naver.com"; // 이메일 입력
		String hostSMTPpwd = "Hufig4h@!"; // 비밀번호 입력
		// 보내는 사람 정보
		String fromEmail = "wlstjr2234@naver.com"; // 이메일 입력
		String fromName = "Dionysos";
		String subject = "임시 비밀번호 입니다";
		String msg = users.getPassword() + "입니다";

		// 받는 사람 E-Mail 주소
		String mail = users.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 비밀번호 찾기
	@RequestMapping(value = "find_pw.do", method = RequestMethod.POST)
	public String find_pw(Users user, HttpServletResponse response, Model model) {
		response.setContentType("text/html;charset=utf-8");

		if (usersService.pwdsearch(user) == 1) {
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			user.setPassword(pw);
			send_mail(user);
			user.setPassword(bcryptPasswordEncoder.encode(pw));
			usersService.update_pw(user);

			return "common/main";
		} else {
			model.addAttribute("message", "아이디와 이메일을 잘 못 입력하셨습니다");
			return "common/error";
		}

	}
	
	@RequestMapping(value = "admin.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView moveAdmin(@RequestParam(name = "page", required = false) String page,
									ModelAndView mv, HttpSession session) {
		
		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}

		
		// 페이징 계산 처리 - 별도의 클래스로 작성해서 이용해도 됨
		int limit = 10; // 한 페이지에 출력할 목록 갯수
		// 총 페이지 수 계산을 위해 게시글 총 갯수 조회해 옴
		int listCount = orderService.selectListCount();
		String url = "admin.do";
		Paging paging = new Paging(listCount, currentPage, limit, url);
		paging.calculator();
		
		Users loginUsers = (Users)session.getAttribute("loginUsers");
//		ArrayList<Orders> list = ordersService.selectOrdersList(paging);
		if(loginUsers == null || loginUsers.getAdmin().equals("N")) {
			String message = "관리자만 접근 가능한 페이지입니다. 메인 화면으로 이동합니다.";
			mv.addObject("alertMessage", message);
			mv.setViewName("common/main");
		} else {
//			mv.addObject("list", list);
			mv.addObject("listCount", listCount);
			mv.addObject("paging", paging);
			mv.setViewName("admin/admin");
		}
		return mv;
	}
	
	// 관리자 회원검색기능 메소드 (페이징 적용)
				@RequestMapping(value = "usersSearch.do", method = { RequestMethod.GET, RequestMethod.POST })
				public ModelAndView adminUsersSearchMethod(ModelAndView mv, HttpServletRequest request,
						@RequestParam(value = "page", required = false) String page) {
					String action = request.getParameter("action");
					logger.info("action : " + action);
					
					String keyword = null;
					keyword = request.getParameter("keyword");
					logger.info("keyword : " + keyword);
					
					
					int currentPage = 1;
					if (page != null) {
						currentPage = Integer.parseInt(page);
					}
					String url = "usersSearch.do";
					int limit = 10;
					int listCount = usersService.selectSearchUsersCount(action, keyword);
					logger.info("paging : " + listCount + ", " + currentPage + ", " + limit + ", " +  url);
					Paging paging = new Paging(listCount, currentPage, limit, url);
					
					paging.setListCount(listCount);
					paging.calculator();
					
					ArrayList<Users> list = usersService.selectSearchUsers(action, keyword, paging);

					if (list != null && list.size() > 0) {
						mv.addObject("list", list);
						mv.addObject("action", action);
						mv.addObject("keyword", keyword);
						mv.addObject("paging", paging);
						mv.setViewName("users/adminUsersListView");
						
					} else {
						mv.addObject("message", action + " 검색 결과가 없습니다.");
						mv.setViewName("common/error");
					}
					return mv;
				}
			
			
			
			// 관리자용 회원 관리 기능 페이지 이동 메소드(페이징)
				@RequestMapping("adminUsersListView.do")
				public ModelAndView adminUsersListMethod(@RequestParam(name = "page", required = false) String page,
						ModelAndView mv) {

					int currentPage = 1;
					if (page != null) {
						currentPage = Integer.parseInt(page);
					}

					// 한 페이지에 게시글 10개씩 출력되게 하는 경우 :
					// 페이징 계산 처리 - 별도의 클래스로 작성해서 이용해도 됨
					int limit = 10;  // 한 페이지에 출력할 목록 갯수
					// 총 페이지 수 계산을 위해 게시글 총 갯수 조회해 옴
					int listCount = usersService.selectListCount();
					String url = "adminUsersListView.do";
					Paging paging = new Paging(listCount, currentPage, limit, url);
					paging.calculator();

					ArrayList<Users> list = usersService.selectUsersPage(paging);

					if (list != null && list.size() > 0) {
						mv.addObject("list", list);
						mv.addObject("paging", paging);

						mv.setViewName("users/adminUsersListView");
					} else {
						mv.addObject("message", currentPage + " 출력 실패");
						mv.setViewName("common/error");
					}

					return mv;
				}

}
