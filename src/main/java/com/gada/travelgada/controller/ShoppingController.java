package com.gada.travelgada.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.domain.BuyDetailVO;
import com.gada.travelgada.domain.BuyVO;
import com.gada.travelgada.domain.MemberDetails;
import com.gada.travelgada.domain.PointVO;
import com.gada.travelgada.domain.ProductVO;
import com.gada.travelgada.service.MemberService;
import com.gada.travelgada.service.ShippingLocServiceImpl;
import com.gada.travelgada.service.ShoppingServiceImpl;
import com.gada.travelgada.utils.PointCalculator;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@AllArgsConstructor
public class ShoppingController {
   
   private ShoppingServiceImpl shoppingService;
   private ShippingLocServiceImpl shippingService;
   private MemberService memberService;
   
   @GetMapping("/shopping")
   public ModelAndView shoppingMain(ModelAndView modelAndView, @RequestParam("product_type_id") int product_type_id, @RequestParam(value="sorter", required=false, defaultValue="default") String sorter) {
      String type = shoppingService.getProductType(product_type_id);
      modelAndView.addObject("productList", shoppingService.getProductByTypeWithSorting(product_type_id, sorter));
      modelAndView.setViewName("/shopping/" + type);
      return modelAndView;
   }
   
   @GetMapping("/shopping/scroll")
   public List<ProductVO> shoppingPage(@RequestParam("product_type_id") int product_type_id, @RequestParam(value="sorter", required=false, defaultValue="defualt") String sorter, @RequestParam(value="page", required=false, defaultValue="1") int page) {
      return shoppingService.getProductByTypeWithSortingAndPaging(product_type_id, sorter, page);
   }
   
   @GetMapping("/shopping/{product_id}")
   public ModelAndView productView(ModelAndView modelAndView, ProductVO productVO) {
      modelAndView.addObject("product", shoppingService.getProduct(productVO.getProduct_id()));
      modelAndView.setViewName("/shopping/product");
      return modelAndView;
   }
   
   @GetMapping("/shopping/cart")
   public ModelAndView memberCart(ModelAndView modelAndView, @AuthenticationPrincipal MemberDetails memberDetails) {
      Map<Integer, Integer> cart = memberDetails.getCart(); 
      Set<Integer> idSet = cart.keySet();
      Map<ProductVO, Integer> productCart = new HashMap<>();
      for(Integer id : idSet) {
         productCart.put(shoppingService.getProduct(id), cart.get(id));
      }
      
      modelAndView.addObject("cart", productCart);
      modelAndView.setViewName("/shopping/cart");
      return modelAndView;
   }
   
   @PostMapping("/shopping/cart")
   public ResponseEntity<String> insertIntoCart(@RequestBody BuyDetailVO buyDetailVO, @AuthenticationPrincipal MemberDetails memberDetails) {
      ResponseEntity<String> entity = null;
      try {
         memberDetails.insertIntoCart(buyDetailVO.getProduct_id(), buyDetailVO.getQuantity());
         entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
      } catch(Exception e) {
         e.printStackTrace();
         entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
      }
      return entity;
   }
   
   @DeleteMapping("/shopping/cart")
   public ResponseEntity<String> deleteFromCart(@RequestBody ProductVO productVO, @AuthenticationPrincipal MemberDetails memberDetails) {
      ResponseEntity<String> entity = null;
      try {
         memberDetails.deleteFromCart(productVO.getProduct_id());
         entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
      } catch(Exception e) {
         e.printStackTrace();
         entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
      }
      return entity;
   }
   
   // 결제 페이지
   @PostMapping("/shopping/order")
   public ModelAndView sendOrderPage(@RequestParam("product_id") String productId, @RequestParam("quantity") String quantity, @RequestParam("price") String price, @RequestParam("product_name") String productName, ModelAndView modelAndView, @AuthenticationPrincipal MemberDetails memberDetails) {
      String[] arrProduct_id = productId.split(",");
      String[] arrQuantity = quantity.split(",");
      String[] arrPrice = price.split(",");
      String[] arrProduct_name = productName.split(",");
      
      List<BuyDetailVO> buyList = new ArrayList<>();
      
      for(int i = 0; i < arrProduct_id.length; i++) {
         BuyDetailVO buy = new BuyDetailVO();
         buy.setProduct_id(Integer.parseInt(arrProduct_id[i]));
         buy.setQuantity(Integer.parseInt(arrQuantity[i]));
         buy.setPrice(Integer.parseInt(arrPrice[i]));
         buy.setProduct_name(arrProduct_name[i]);
         buyList.add(buy);
      }
      
      modelAndView.addObject("buyDetailList", buyList);
      modelAndView.addObject("shippingList", memberService.getShippingLoc(memberDetails.getUsername()));
      modelAndView.addObject("point", PointCalculator.getCurrentPoint(memberService.getPoint(memberDetails.getUsername())));
      modelAndView.addObject("member", memberService.getMember(memberDetails.getUsername()));
      
      modelAndView.setViewName("/shopping/order");
      
      return modelAndView;
   }
   
   // 결제 정보, 포인트 사용-적립 내역을 테이블에 저장
   @PostMapping("/shopping/order/result")
   public ModelAndView insertOrderResult(HttpServletRequest request, ModelAndView modelAndView, @AuthenticationPrincipal MemberDetails memberDetails) {
      String[] productName = request.getParameterValues("product_name");
      String[] quantity = request.getParameterValues("quantity");
      String[] price = request.getParameterValues("price");
      String[] productId = request.getParameterValues("product_id");
      String buyId = request.getParameter("buy_id");
      String shippingLocName = request.getParameter("shipping_loc_name");
      String usedPoint = request.getParameter("used_point");
      String savedPoint = request.getParameter("accumulate_point");
      
      // buy 테이블에 결제 내역 저장
      BuyVO paymentResult = new BuyVO();
      paymentResult.setBuy_id(buyId);
      paymentResult.setMember_id(memberDetails.getUsername());
      paymentResult.setShipping_loc_name(shippingLocName);
      
      shoppingService.insertPaymentResult(paymentResult);
      
      // buy_detail 테이블에 결제 상세 내역 저장
      for (int i = 0; i < productName.length; i++) {
         BuyDetailVO paymentResultDetail = new BuyDetailVO();
         paymentResultDetail.setProduct_name(productName[i]);
         paymentResultDetail.setPrice(Integer.parseInt(price[i]));
         paymentResultDetail.setQuantity(Integer.parseInt(quantity[i]));
         paymentResultDetail.setBuy_id(buyId);
         paymentResultDetail.setProduct_id(Integer.parseInt(productId[i]));
         
         shoppingService.insertPaymentResultDetail(paymentResultDetail);
      }
      
      // 결제 금액의 5%를 포인트로 적립
      PointVO accumulatePoint = new PointVO();
      accumulatePoint.setAmount(Integer.parseInt(savedPoint));
      accumulatePoint.setMember_id(memberDetails.getUsername());
      
      shoppingService.updateAccumulatePoint(accumulatePoint);
      
      // 결제 단게에서 포인트 사용 시 포인트 차감
      if (Integer.parseInt(usedPoint) > 0) {
         PointVO deductionPoint = new PointVO();
         deductionPoint.setAmount(Integer.parseInt(usedPoint));
         deductionPoint.setMember_id(memberDetails.getUsername());
         
         shoppingService.updateDeductionPoint(deductionPoint);
      }
      
      modelAndView.setViewName("redirect:/shopping/order/" + buyId);
      
      return modelAndView;
   }
   
   // 결제 완료 페이지
   @GetMapping("/shopping/order/{buy_id}")
   public ModelAndView getOrderResultPage(@PathVariable("buy_id") String buyId, ModelAndView modelAndView) {
      modelAndView.addObject("payResultInformation", shoppingService.getPaymentResult(buyId));
      
      modelAndView.setViewName("shopping/order_result");
      
      return modelAndView;
   }
   
   @GetMapping("/shopping/buy_list")
   public ModelAndView buyList(ModelAndView modelAndView, @AuthenticationPrincipal MemberDetails memberDetails) {
      List<BuyVO> buyList = shoppingService.getBuyList(memberDetails.getUsername());
      List<BuyDetailVO> buyDetailList = null;
      for(BuyVO vo : buyList) {
         if(buyDetailList == null) {
            buyDetailList = shoppingService.getBuyDetailList(vo.getBuy_id());            
         } else {
            for(BuyDetailVO detailVO : shoppingService.getBuyDetailList(vo.getBuy_id())) {
               buyDetailList.add(detailVO);
            }
         }
      }
      Map<Integer, BuyVO> buyMap = new HashMap<>();
      Map<Integer, ProductVO> productMap = new HashMap<>();
      
      for(BuyDetailVO vo : buyDetailList) {
         buyMap.put(vo.getBuy_detail_id(), shoppingService.getBuyByDetail(vo));
         productMap.put(vo.getBuy_detail_id(), shoppingService.getProductByDetail(vo));
      }
      
      modelAndView.addObject("buyDetailList", buyDetailList);
      modelAndView.addObject("buyMap", buyMap);
      modelAndView.addObject("productMap", productMap);
      modelAndView.setViewName("/shopping/buy_list");
      return modelAndView;
   }
   
   @GetMapping("/shopping/buy_list/{buy_id}")
   public ModelAndView buyDetailList(ModelAndView modelAndView, BuyVO buyVO) {
      BuyVO buy = shoppingService.getBuy(buyVO.getBuy_id());
      List<BuyDetailVO> buyDetailList = shoppingService.getBuyDetailList(buy.getBuy_id());
      Map<Integer, ProductVO> productMap = new HashMap<>();
      for(BuyDetailVO vo : buyDetailList) {
         productMap.put(vo.getBuy_detail_id(), shoppingService.getProductByDetail(vo));
      }
      
      modelAndView.addObject("shoppingLoc", shippingService.getShippingLoc(buy.getMember_id(), buy.getShipping_loc_name()));
      modelAndView.addObject("buy", buy);
      modelAndView.addObject("buyDetailList", buyDetailList);
      modelAndView.addObject("productMap", productMap);
      modelAndView.setViewName("/shopping/buy_detail_list");
      return modelAndView;
   }
}