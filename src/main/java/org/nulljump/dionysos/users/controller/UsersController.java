package org.nulljump.dionysos.users.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.nulljump.dionysos.common.SearchDate;
import org.nulljump.dionysos.common.Searchs;
import org.nulljump.dionysos.users.model.service.UsersService;
import org.nulljump.dionysos.users.model.vo.Users;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@RequestMapping(value = "loginPage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String moveLoginPage() {
		return "users/loginPage";
	}

	// ȸ������ ������ ��������
	@RequestMapping(value = "enrollPage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String moveEnrollPage() {
		return "users/enrollPage";
	}

	// ȸ������ ���������� ��������
	@RequestMapping(value = "moveup.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String moveUpdatePage(@RequestParam("user_id") String user_id, Model model) {
		Users users = usersService.selectUsers(user_id);

		if (users != null) {
			model.addAttribute("users", users);
			return "users/updatePage";
		} else {
			model.addAttribute("message", user_id + " : ȸ�� ��ȸ ����!");
			return "common/error";
		}
	}

	// �α��� ó����
	@RequestMapping(value = "login.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String loginMethod(Users users, HttpSession session, SessionStatus status, Model model) {
		logger.info("login.do : " + users);

		Users loginUsers = usersService.selectUsers(users.getUser_id());
		if (loginUsers == null) {
			// ���� ó��
			model.addAttribute("message", "�α��� ���� : �������� �ʴ� ������Դϴ�.");
			return "common/error";
		} else if (loginUsers.getEmail() == null) {
			// ���� ó��
			model.addAttribute("message", "�α��� ���� : �̸��� ������ �����ϴ�.");
			return "common/error";
		} else if (this.bcryptPasswordEncoder.matches(users.getPassword(), loginUsers.getPassword())) {
			session.setAttribute("loginUsers", loginUsers);
			status.setComplete();
			if(loginUsers.getAdmin().equals("Y")) {
				return "redirect:admin.do";
			} else {
				return "redirect:main.do";
			}
			
		} else {
			model.addAttribute("message", "�α��� ���� : ���̵� ��ȣ Ȯ���ϼ���.");
			return "common/error";
		}
	}

	@RequestMapping("logout.do")
	public String logoutMethod(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession(false);
		logger.info("logout.do : " + session);

		if (session != null) {
			session.invalidate();
			return "redirect:main.do";
		} else {
			model.addAttribute("message", "�α��� ������ �������� �ʽ��ϴ�");
			return "common/error";
		}
	}

	// ajax ������� ���̵� �ߺ�Ȯ�� ��û
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

	// ȸ������ ��û
	@RequestMapping(value = "enroll.do", method = RequestMethod.POST)
	public String usersInsertMethod(Users users, Model model) {
		logger.info("enroll.do : " + users);

		// �н����� ��ȣȭ ó��
		users.setPassword(bcryptPasswordEncoder.encode(users.getPassword()));
		logger.info("after encode : " + users.getPassword());
		logger.info("length : " + users.getPassword().length());

		if (usersService.insertUsers(users) > 0) {
			// ȸ�� ���� ����
			return "redirect:main:do";
		} else {
			// ȸ�� ���� ����
			model.addAttribute("message", "ȸ�� ���� ����!");
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
			mv.addObject("message", user_id + " : ȸ�� ���� ��ȸ ����!");
			mv.setViewName("common/error");
		}

		return mv;
	}

	// ȸ�� Ż��(����) ��û
	@RequestMapping("mdel.do")
	public String usersDeleteMethod(@RequestParam("user_id") String user_id, Model model) {
		logger.info("mdel.do : " + user_id);

		if (usersService.deleteUsers(user_id) > 0) {
			return "redirect:logout.do";
		} else {
			model.addAttribute("message", user_id + " : ȸ�� ���� ����!");
			return "common/error";
		}
	}

	// ȸ�� ���� Ż��
	@RequestMapping("eviction.do")
	public String EvictionMethod(@RequestParam("user_id") String user_id, Model model) {
		if (usersService.evictionUsers(user_id)>0) {
			return "redirect:mlist.do";
		} else {
			model.addAttribute("message", user_id + " : ȸ�� ���� ����!");
			return "common/error";
		}
	}

	// ȸ������ ���� ó��
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
			model.addAttribute("message", users.getUser_id() + " : ȸ�� ���� ���� ����!");
			return "common/error";
		}
	}

	// ȸ�������� ȸ����ü��� ��ȸ ó��
	@RequestMapping("mlist.do")
	public String usersListViewMethod(Model model) {
		ArrayList<Users> list = usersService.selectList();

		if (list != null && list.size() > 0) {
			model.addAttribute("list", list);
			return "users/userListView";
		} else {
			model.addAttribute("message", "ȸ�� ������ �������� �ʽ��ϴ�.");
			return "common/error";
		}
	}

	// ȸ�� �˻� ó����
	@RequestMapping(value = "msearch.do", method = RequestMethod.POST)
	public String usersSearchMethod(HttpServletRequest request, Model model) {
		// ���ۿ� �� ������
		String action = request.getParameter("action");
		String keyword = null, beginDate = null, endDate = null;

		if (action.equals("birth")) {
			beginDate = request.getParameter("begin");
			endDate = request.getParameter("end");
		} else {
			keyword = request.getParameter("keyword");
		}

		ArrayList<Users> list = null;
		Searchs searchs = new Searchs();

		switch (action) {
		case "id":
			searchs.setKeyword(keyword);
			list = usersService.selectSearchUserid(searchs);
			break;
		case "email":
			searchs.setKeyword(keyword);
			list = usersService.selectSearchEmail(searchs);
			break;
		case "birth":
			list = usersService.selectSearchBirthday(new SearchDate(Date.valueOf(beginDate), Date.valueOf(endDate)));
			break;
		} // switch

		if (list != null && list.size() > 0) {
			model.addAttribute("list", list);
			return "users/userListView";
		} else {
			model.addAttribute("message", action + " �˻��� ���� ����� �������� �ʽ��ϴ�.");
			return "common/error";
		}
	}

	// ���̵� ã��(��������)
	@RequestMapping(value = "findid_form.do")
	public String findid() throws Exception {
		return "users/findIdPage";
	}

	// ���̵� ã��
	@RequestMapping(value = "find_id.do", method = RequestMethod.POST)
	public String findid(@RequestParam("email") String email, Model model) throws Exception {
		String user_id = usersService.find_id(email);

		if (user_id == null) {
			model.addAttribute("message", "�̸����� ��ġ���� �ʽ��ϴ�");
			return "common/error";
		} else {
			model.addAttribute("user_id", user_id);
			return "users/findidsuccess";
		}
	}

	// ��й�ȣ ã��(��������)
	@RequestMapping(value = "findpw_form.do")
	public String findpw() throws Exception {
		return "users/findPwPage";
	}

	public void send_mail(Users users) {
		// ���� ����
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "wlstjr2234@naver.com"; // �̸��� �Է�
		String hostSMTPpwd = ""; // ��й�ȣ �Է�
		// ������ ��� ����
		String fromEmail = "wlstjr2234@naver.com"; // �̸��� �Է�
		String fromName = "Dionysos";
		String subject = "�ӽ� ��й�ȣ �Դϴ�";
		String msg = users.getPassword() + "�Դϴ�";

		// �޴� ��� E-Mail �ּ�
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

	// ��й�ȣ ã��
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

			return "redirect:main.do";
		} else {
			model.addAttribute("message", "���̵�� �̸����� �� �� �Է��ϼ̽��ϴ�");
			return "common/error";
		}

	}
	
	@RequestMapping(value = "admin.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView moveAdmin(Users users, ModelAndView mv) {
		Users loginUsers = usersService.selectUsers(users.getUser_id());
		if(loginUsers == null || loginUsers.getAdmin().equals("N")) {
			String message = "관리자만 접근 가능한 페이지입니다. 메인 화면으로 이동합니다.";
			mv.addObject("alertMessage", message);
			mv.setViewName("common/main");
		} else {
			mv.setViewName("admin/admin");
		}
		return mv;
	}

}
