
package org.nulljump.dionysos.carts.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.nulljump.dionysos.carts.model.service.CartsService;
import org.nulljump.dionysos.carts.model.vo.Carts;
import org.nulljump.dionysos.product.model.service.ProductService;
import org.nulljump.dionysos.product.model.vo.Product;
import org.nulljump.dionysos.users.model.service.UsersService;
import org.nulljump.dionysos.users.model.vo.Users;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CartsController {
	private static final Logger logger = LoggerFactory.getLogger(CartsController.class);

	@Autowired
	private CartsService cartsService;

	@Autowired
	private UsersService usersService;

	@Autowired
	private ProductService productService;

//	@RequestMapping(value="cart.do")
//	public @ResponseBody String addProductCart(@PathVariable("product_id") int product_id, HttpSession session) {
//		Users users = (Users) session.getAttribute("loginUsers");
//		String user_id = users.getUser_id();
//		
//		Carts carts = new Carts();
//		
//		carts.setUser_id(user_id);
//		carts.setProduct_id(product_id);
//		
//		boolean isExisted = cartsService.findCartProduct(carts);
//		
//		System.out.println("isExisted : " + isExisted);
//		
//		if(isExisted) {
//			return "already_existed";
//		}else {
//			cartsService.addProductCart(carts);;
//			return "add_success";
//		}
//	}

//  @RequestMapping("insertCart.do")	  
//  @ResponseBody
//  	public String insertCart(Carts carts) {
//	    boolean isCartAdded = cartsService.insertCarts(carts);
//	    if (isCartAdded) {
//	      return "add_success";
//	    } else {
//	      return "already_existed";
//	    }
//	  }

	@RequestMapping("insertCart.do")
	@ResponseBody
	public String insertCart(@RequestParam("product_id") int product_id,
			HttpServletRequest request,
			HttpSession session) {
		Users users = (Users) session.getAttribute("loginUsers");
		Carts carts = new Carts();
		// int i = (int)(Math.random() * 100000000)+1;  seq 만들
		
		carts.setUser_id(users.getUser_id());
		carts.setProduct_id(product_id);
		carts.setCart_id(0);
		int cart_quantity = Integer.parseInt(request.getParameter("cart_quantity"));
		carts.setCart_quantity(cart_quantity);
		boolean isCartAdded= cartsService.insertCarts(carts);
		if (isCartAdded) {
			return "add_success";
		} else {
			return "already_existed";
		}
	}

	@RequestMapping(value = "cart.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String detailOrder(HttpSession session, Model model, @RequestParam("product_id") int product_id,
			@RequestParam(value = "cart_quantity", required = false) Integer cart_quantity) {
		logger.info("cart_quantity : ", cart_quantity);
		
		logger.info("porduct_id: ", product_id);
		
		Users users = (Users) session.getAttribute("loginUsers");
		users = usersService.selectUsers(users.getUser_id());
		Product product = productService.selectProduct(product_id);
	
		 ArrayList<Carts> cartList = cartsService.listCarts(users.getUser_id());
		 model.addAttribute("cartList", cartList);
		// 현재 카트에 상품이 있는는 경우, 해당 수량을 모델에 추가
		if (cart_quantity != null) {
			model.addAttribute("cart_quantity", cart_quantity);
		}

		model.addAttribute("users", users);
		model.addAttribute("product", product);

		
		
		return "carts/cartPage";
	}

	@RequestMapping("clist.do")
	public String carsListViewMethod(Model model, @RequestParam("user_id") String user_id) {
		ArrayList<Carts> clist = cartsService.listCarts(user_id);
		
		if(clist != null && clist.size() > 0) {
			model.addAttribute("clist", clist);
			return "cart/cartPage";
		}else {
			return "common/error";
		}
	}

	
//  @RequestMapping(value="cart.do", method = {RequestMethod.POST, RequestMethod.GET})
//  public String detailOrder(HttpSession session, Model model,
//     @RequestParam(value = "product_id", required = false) Integer product_id,
//     @RequestParam(value = "cart_quantity", required = false) Integer cart_quantity) {
//
//     if (product_id == null) {
//        // 예외 처리
//        model.addAttribute("message", "상품 정보가 없습니다.");
//        return "common/error";
//     }
//
//     Users users = (Users) session.getAttribute("loginUsers");
//     users = usersService.selectUsers(users.getUser_id());
//     Product product = productService.selectProduct(product_id);
//
//     // 현재 카트에 상품이 없는 경우, 해당 수량을 모델에 추가
//     if (cart_quantity == null) {
//        model.addAttribute("cart_quantity", cart_quantity);
//     }
//
//     model.addAttribute("users", users);
//     model.addAttribute("product", product);
//
//     return "carts/cartPage";
//  }

//	
//	@RequestMapping(value="cart.do", method = {RequestMethod.POST, RequestMethod.GET})
//	public String detailOrder(HttpSession session, Model model,
//		@RequestParam("product_id") int product_id,
//		@RequestParam(value = "cart_quantity", required = false) Integer cart_quantity) {
//		
//		Users users = (Users) session.getAttribute("loginUsers");
//		users = usersService.selectUsers(users.getUser_id());
//		Product product = productService.selectProduct(product_id);
//		
//		// 현재 카트에 상품이 없는 경우, 해당 수량을 모델에 추가
//		if (cart_quantity == null) {
//			model.addAttribute("cart_quantity", cart_quantity);
//		}
//		
//		model.addAttribute("users", users);
//		model.addAttribute("product", product);
//	
//		return "carts/cartPage";
//	}
//	
//	@RequestMapping("insertsCarts.do")
//	public String insertCart(@ModelAttribute("carts") Carts carts, String userId) {
//		cartsService.insertCarts(carts);
//		return "redirect:cart.do";
//	}
	@RequestMapping("updateCarts.do")
	public String updateCart(@ModelAttribute("carts") Carts carts, String userId) {
		cartsService.updateCarts(carts);
		return "redirect:cart.do";
	}

	@RequestMapping("deleteCarts.do")
	public String deleteCarts(@RequestParam int cart_id) {
		cartsService.deleteCarts(cart_id);
		return "redirect:cart.do";
	}
	

}