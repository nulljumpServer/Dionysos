package org.nulljump.dionysos.order.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.nulljump.dionysos.carts.model.service.CartsService;
import org.nulljump.dionysos.carts.model.vo.Carts;
import org.nulljump.dionysos.carts.model.vo.MyCart;
import org.nulljump.dionysos.common.Paging;
import org.nulljump.dionysos.order.model.service.OrderService;
import org.nulljump.dionysos.order.model.vo.Order;
import org.nulljump.dionysos.product.model.service.ProductService;
import org.nulljump.dionysos.product.model.vo.Product;
import org.nulljump.dionysos.store.model.service.StoreService;
import org.nulljump.dionysos.store.model.vo.Store;
import org.nulljump.dionysos.users.model.service.UsersService;
import org.nulljump.dionysos.users.model.vo.Users;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

	@Autowired
	private StoreService storeService;

	@Autowired
	private CartsService cartsService;

	// 주문 정보 화면
	@RequestMapping(value = "orderinfo.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String orderInfo(Order order, Model model) {
		Users users = usersService.selectUsers(order.getUser_id());
		Store store = storeService.selectStore(order.getStore_id());
		Product product = productService.selectProduct(order.getProduct_id());

		SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");

		StringBuilder sb = new StringBuilder();
		sb.append(sdf.format(new java.util.Date()));

		for (int i = 0; i < 6; i++) {
			int random = (int) (Math.random() * 10);
			sb.append(random);
		}

		logger.info(sb.toString());

		order.setOrder_number(Long.parseLong(sb.toString()));
		order.setTotal_price(order.getOrder_qty() * product.getProduct_price());
		orderService.insertOrder(order);

		model.addAttribute("users", users);
		model.addAttribute("store", store);
		model.addAttribute("product", product);
		model.addAttribute("order", order);

		return "orders/orderInfo";
	}

	// 장바구니 결제
	@RequestMapping(value = "orderlistinfo.do", method = { RequestMethod.GET })
	public String orderlistinfo(Order order, Model model) {
		Users users = usersService.selectUsers(order.getUser_id());

		Carts cart = new Carts();
		cart.setUser_id(order.getUser_id());
		ArrayList<MyCart> clist = cartsService.selectCarts(cart);

		SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");

		StringBuilder sb = new StringBuilder();
		sb.append(sdf.format(new java.util.Date()));

		for (int i = 0; i < 6; i++) {
			int random = (int) (Math.random() * 10);
			sb.append(random);
		}

		logger.info(sb.toString());

		order.setOrder_number(Long.parseLong(sb.toString()));
		int totalprice = 0;
		int qty = 0;
		for (MyCart mycart : clist) {
			totalprice += mycart.getCart_quantity() * mycart.getProduct_price();
			qty += mycart.getCart_quantity();
			Order cartorder = new Order();
			cartorder.setOrder_number(Long.parseLong(sb.toString()));
			cartorder.setUser_id(mycart.getUser_id());
			cartorder.setStore_id(mycart.getStore_id());
			cartorder.setProduct_id(mycart.getProduct_id());
			cartorder.setOrder_qty(mycart.getCart_quantity());
			cartorder.setTotal_price(mycart.getCart_quantity() * mycart.getProduct_price());
			cartorder.setProduct_name(mycart.getProduct_name());
			cartorder.setProduct_image(mycart.getProduct_image());
			cartorder.setStore_name(mycart.getStore_name());

			orderService.insertOrder(cartorder);
			cartsService.deleteCarts(mycart.getProduct_id());
		}
		order.setOrder_qty(qty);
		order.setTotal_price(totalprice);

		// order.setOrder_date((java.sql.Date)new java.util.Date());
		order.setOrder_date(new java.sql.Date(new java.util.Date().getTime()));
		orderService.selectOrderlist(order);

		model.addAttribute("users", users);
		model.addAttribute("order", order);
		model.addAttribute("clist", clist);

		return "orders/orderInfo";
	}

	@RequestMapping(value = "moveSuccess.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String orderSuccessView(Order order, Model model) {
		Users users = usersService.selectUsers(order.getUser_id());
		Store store = storeService.selectStore(order.getStore_id());
		Product product = productService.selectProduct(order.getProduct_id());
		order = orderService.selectOrder(order);

		model.addAttribute("users", users);
		model.addAttribute("store", store);
		model.addAttribute("product", product);
		model.addAttribute("order", order);

		return "orders/orderSuccessView";
	}

	@RequestMapping(value = "movelistSuccess.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String orderlistSuccessView(Order order, Model model) {
		Users users = usersService.selectUsers(order.getUser_id());

		ArrayList<Order> olist = orderService.selectOrderlist(order);
		ArrayList<Product> plist = new ArrayList<Product>();

		int totalprice = 0;
		int qty = 0;
		for (Order o : olist) {
			totalprice += o.getTotal_price();
			qty += o.getOrder_qty();
		}
		order.setTotal_price(totalprice);
		order.setOrder_qty(qty);

		model.addAttribute("users", users);
		model.addAttribute("order", order);
		model.addAttribute("olist", olist);

		return "orders/orderSuccessView";
	}

	@RequestMapping("myorderList.do")
	public ModelAndView myinfoOrderListMethod(
			@RequestParam(name = "page", required = false) String page,
			@RequestParam("user_id") String user_id, ModelAndView mv) {

		Users users = usersService.selectUsers(user_id);
		ArrayList<Order> list = null;
		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}

		int limit = 10;

		int listCount = orderService.selectMyorderListCount(user_id);
		String url = "myorderList.do";
		Paging paging = new Paging(listCount, currentPage, limit, url, user_id);
		paging.calculator();

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("user_id", user_id);
		paramMap.put("paging", paging);

		list = orderService.orderMyList(paramMap);

		if (users != null) {
			mv.addObject("users", users);
			mv.addObject("list", list);
			mv.addObject("paging", paging);

			mv.setViewName("orders/orderListPage");
		} else {
			mv.addObject("message", user_id + " : 회원 정보 조회 실패!");
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	// 주문 취소 신청 페이지로 이동
		@RequestMapping(value = "applyOC.do", method = { RequestMethod.GET, RequestMethod.POST })
		public String applyOrderCancelPage(@RequestParam("order_number") long order_number,
				@RequestParam("user_id") String user_id, Model model) {

			Order order = orderService.selectOrderForCancel(order_number);
			Users users = usersService.selectUsers(user_id);

			logger.info("order_number : " + order_number);
			logger.info("user_id : " + user_id);

			String url = "applyOC.do";

			if (order != null) {
				model.addAttribute("order", order);
				model.addAttribute("users", users);
				return "orders/orderCancel";
			} else {
				model.addAttribute("message", "주문 취소 페이지로 이동 실패!");
				return "common/error";
			}

		}

		// 주문 취소시 cancel_info N으로 변경 처리
		@RequestMapping(value = "OCstatus.do", method = { RequestMethod.GET, RequestMethod.POST })
		public String updateOrderCancelStatusMethod(Order order, Model model) {

			if (orderService.updateOrderCancelStatus(order) > 0) {
				model.addAttribute("order_id", order.getCancle_info());

				return "orders/cancelReceipt";
			} else {
				model.addAttribute("message", order.getOrder_number() + "주문 취소 실패!");
				return "common/error";
			}
		}

}
