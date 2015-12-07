package com.prabin.converter.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.prabin.converter.domain.SendingCurrencyObj;
import com.prabin.converter.service.CalculateService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	CalculateService calService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}

	@RequestMapping(value = "/convert", method = RequestMethod.POST)
	@ResponseBody
	public String getValue(@RequestBody SendingCurrencyObj currencydetail) {
		double amt1;//=currencydetail.getAmtFrom();
		if(currencydetail.getAmtFrom()!=0){
			amt1=currencydetail.getAmtFrom();
		}
		else{
			amt1=currencydetail.getAmtTo();
		}
		System.out.println(currencydetail.getFrom()+","+ currencydetail.getTo()+","+ amt1);
		double amount = calService.getValue(currencydetail.getFrom(), currencydetail.getTo(), amt1);
		System.out.println(amount);
		return ("" + amount);
	}

}
