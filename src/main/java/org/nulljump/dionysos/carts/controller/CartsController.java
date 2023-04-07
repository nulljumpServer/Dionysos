package org.nulljump.dionysos.carts.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.nulljump.dionysos.carts.model.service.CartsService;
import org.nulljump.dionysos.carts.model.vo.Carts;
import org.nulljump.dionysos.users.model.vo.Users;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CartsController {
	private static final Logger logger = LoggerFactory.getLogger(CartsController.class);

	@Autowired
	private CartsService cartsService;

	
	 //장바구니 페이지 이동
    @RequestMapping("clistView.do")
    public String moveReviewDetailView() {
    	return "carts/cartsListView";
    }
    
    // 장바구니 페이지로 이동하기
    @RequestMapping(value="clist.do" , method={ RequestMethod.GET , RequestMethod.POST })
    public String movecartsListPage(@RequestParam("cart_id") int cart_id, HttpSession session,
                                   @RequestParam("cart_quantity") int number, Model model) {

        // 1. 로그인된 사용자인지 체크 : 현재 세션에 저장된 사용자 정보를 가져옴
        Users loginUser = (Users) session.getAttribute("loginUser");

        // 2. 로그인되어 있지 않은 경우, 로그인 페이지로 이동
        if (loginUser == null) {

            return "redirect:/users/loginPage.do";
        }

    // 3. 로그인된 사용자의 장바구니 목록을 가져오기 : 사용자의 이메일로 장바구니 목록을 가져옴
        ArrayList<Carts> cartsList = cartsService.listCarts(loginUser.getEmail());

        // 4. 장바구니에 상품이 있는지 체크
        if (cartsList != null && !cartsList.isEmpty()) {
            // 5. 상품이 존재하면 모델에 추가하고 장바구니 페이지 반환
            model.addAttribute("cartsList", cartsList);
            return "carts/cartsListView";
        } else {
            // 6. 상품이 없으면 오류 메시지를 표시하고 홈페이지로 리다이렉트
            model.addAttribute("message", "장바구니에 상품이 존재하지 않습니다!");
            return "redirect:/";
        }
    }

    
	 
    @RequestMapping("carts.do")
    public ModelAndView list(HttpSession session, ModelAndView mav) {
        Map<String, Object> map=new HashMap<>();
 
//hashmap은 map(key,value)로 이뤄져 있고,
//key값은 중복이 불가능 하고 value는 중복이 가능하다.
//value에 null값도 사용이 가능하다.
 //전달할 정보가 많을 경우에는 HashMap<>을 사용하는 것이 좋다.
 //장바구니에 담을 값들이 많기 때문에 여기선 HashMap<>를 사용한다.
 
 
        String user_id=(String)session.getAttribute("user_id");
 
//session에 저장된 userid를 getAttribute()메소드를 사용해서 얻어오고 오브젝트 타입이기 때문에
//String 타입으로 타입변환한다.
 
        if(user_id != null) { 
 //로그인한 상태이면 실행
            ArrayList<Carts> list=cartsService.listCarts(user_id);//장바구니 목록
            int totalPrice=cartsService.totalPrice(user_id);//금액 합계
            
 
 //hasp map에 장바구니에 넣을 각종 값들을 저장함
            map.put("totalPrice", totalPrice);
            map.put("list", list); //장바구니 목록
            map.put("count", list.size()); //레코드 갯수
 
 //ModelAndView mav에 이동할 페이지의 이름과 데이터를 저장한다.
 
            mav.setViewName("carts/cartsDetailView"); //이동할 페이지의 이름
            mav.addObject("map", map); //데이터 저장
 
            return mav; //화면 이동
 
        }else { //로그인하지 않은 상태
 
            return new ModelAndView("member/login", "", null);
//로그인을 하지 않았으면 로그인 페이지로 이동시킨다.
        }
    }

	@RequestMapping("cartsInsert.do") //세부적인 url mapping
	 
    public String insertCarts(@ModelAttribute Carts carts, 
            HttpSession session) {
 
        //@ModelAttribute는 sumit된 form의 내용을 저장해서 전달받거나, 다시 뷰로 넘겨서 출력하기 위해 사용되는 오브젝트 이다.
 
        //도메인 오브젝트나 DTO의 프로퍼티에 요청 파라미터를 바인딩해서 한번에 받으면 @ModelAttribute 라고 볼 수 있다.
 
        //@ModelAttribute는 컨트롤러가 리턴하는 모델에 파라미터로 전달한 오브젝트를 자동으로 추가해준다.
        
        
        //로그인 여부를 체크하기 위해 세션에 저장된 아이디 확인
 
        String user_id=(String)session.getAttribute("user_id");
        if(user_id == null) { 
 
 //로그인하지 않은 상태이면 로그인 화면으로 이동
 
            return "redirect:/member/login.do";
        }
        //Users.setUser_id();
        cartsService.insertCarts(carts); //장바구니 테이블에 저장됨
        return "redirect:carts.do"; //장바구니 목록으로 이동
    }


	@PostMapping("updateCarts.do")
	public String updateCart(@ModelAttribute("carts") Carts carts, String userId) {
		cartsService.updateCarts(carts);
		return "redirect:carts.do";
	}

	@RequestMapping("deleteCarts.do")
    public String deleteCarts(@RequestParam int cart_id) {
        cartsService.deleteCarts(cart_id);
        return "redirect:carts.do";
    }
	
	@RequestMapping("deleteAllCarts.do")
    public String deleteAllCarts(HttpSession session) {
        String user_id=(String)session.getAttribute("user_id");
        if(user_id != null) {
            cartsService.deleteAllCarts(user_id);
        }
        return "redirect:carts.do";
    }

}