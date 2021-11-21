package com.project.gymcarry.payment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping
public class PaymentCompleteController {
	
	  @GetMapping("payment/complete")
	  public String paymentComplete() {
		  return "payment/paymentComplete";
	  }
	  
}

