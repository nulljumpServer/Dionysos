package org.nulljump.dionysos.order.controller;

import javax.servlet.http.HttpSession;

import org.nulljump.dionysos.order.model.service.OrderService;
import org.nulljump.dionysos.order.model.vo.Order;
import org.nulljump.dionysos.product.model.dao.ProductDao;
import org.nulljump.dionysos.product.model.service.ProductService;
import org.nulljump.dionysos.product.model.vo.Product;
import org.nulljump.dionysos.users.model.service.UsersService;
import org.nulljump.dionysos.users.model.vo.Users;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class OrderController {
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private UsersService usersService;
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value="detailOrder.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String detailOrder(Product product, HttpSession session, Model model,
			@ModelAttribute("order_quantity") String order_quantity,
			@RequestParam("product_id") int product_id) {
		
		Users users = (Users) session.getAttribute("loginUsers");
		users = usersService.selectUsers(users.getUser_id());
		product = productService.selectProduct(product_id);
		
		model.addAttribute("users", users);
		model.addAttribute("product", product);
		model.addAttribute("order_quantity", order_quantity);
		
		return "order/confirmOrderPage";
	}

//	
//	@RequestMapping(value = "orderResult.do", method = RequestMethod.POST)
//	public String order(Product product, Model model, HttpSession session,
//			@ModelAttribute("order_quantity") int order_quantity,
//			@ModelAttribute("order_price") String totalprice,
//			@ModelAttribute("cal_info") String cal_info,
//			@RequestParam("product_id") int product_id) {
//		Order order = new Order();
//		
//		Users user = (Users) session.getAttribute("loginUsers");
//		user = usersService.selectUsers(user.getUser_id());
//		product = productService.selectProduct(product_id);
//		
//		order.setUser_id(user.getUser_id());
//		order.setProduct_id(product.getProduct_id());
//		order.setOrder_price(product.getProduct_price());
//		order.setProduct_name(product.getProduct_name());
//		
//		order.setCal_info(cal_info);
//		
//		int order_price = Integer.parseInt(totalprice);
//		order.setOrder_price(order_price);
//		
//		orderService.insert(order);
//		model.addAttribute("order", order);
//		
//		return "order/orderResultPage";
//	}
//	
//	
}
