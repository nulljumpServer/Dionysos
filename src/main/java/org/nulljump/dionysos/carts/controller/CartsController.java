
package org.nulljump.dionysos.carts.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.nulljump.dionysos.carts.model.service.CartsService;
import org.nulljump.dionysos.carts.model.vo.Carts;
import org.nulljump.dionysos.carts.model.vo.MyCart;
import org.nulljump.dionysos.product.model.service.ProductService;
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


   @RequestMapping(value = "insertCart.do", method = RequestMethod.POST)
   @ResponseBody
   public void addCart(Carts cart, HttpServletResponse response, HttpSession session) throws IOException {
      logger.info("cart : " + cart);
          int result = cartsService.insertCarts(cart);
          PrintWriter out = response.getWriter();
          Users loginUsers = (Users)session.getAttribute("loginUsers");
           if (result>0 && loginUsers != null) {
              out.append("add_success");
              out.flush();
           } else {
              out.append("update_fail");
              out.flush();
           }
       out.close();
   }

   @RequestMapping(value = "cart.do", method = { RequestMethod.POST, RequestMethod.GET })
   public String detailOrder(Carts cart, Model model, HttpSession session) {
   // 카트 페이지로 이동
   
      Users loginUsers = (Users)session.getAttribute("loginUsers");
      ArrayList<MyCart> clist = cartsService.selectCarts(cart);
      
      if (clist != null && loginUsers != null) {
         model.addAttribute("clist", clist);
         return "carts/cartPage";

      }else {
         
         return "users/loginPage";

      }

   }

   @RequestMapping("clist.do")
   public String carsListViewMethod(Carts cart, Model model) {
      ArrayList<MyCart> cartList = cartsService.selectCarts(cart);

      if (cartList != null && cartList.size() > 0) {
         model.addAttribute("cartList", cartList);
         return "cart/cartPage";
      } else {
         return "common/error";
      }
   }

   // 카트 삭제
   @RequestMapping(value="deleteCarts.do", method = { RequestMethod.POST, RequestMethod.GET })
    @ResponseBody
    public String deleteCartItem(@RequestParam("product_id") int product_id) {
        int result = cartsService.deleteCarts(product_id);
        if (result == 1) {
            return "success";
        } else {
            return "fail";
        }
    }
   
   // 카트 수량 업데이트
   @RequestMapping(value = "updateCarts.do", method = RequestMethod.POST)
   @ResponseBody
   public String updateCarts(Carts cart) {
       int result = cartsService.updateCarts(cart);
       return Integer.toString(result);
   }
   
   // 카트 내부에서 수량 업데이트
   @RequestMapping(value = "updateQty.do", method = RequestMethod.POST)
   @ResponseBody
   public String updateQty(Carts cart) {
       int result = cartsService.updateQty(cart);
       return Integer.toString(result);
   }
}