package com.prabin.converter.domain;

import java.util.HashMap;


public class CurrencyObject {
	String base;
	String date;
	HashMap<String,String>rates=new HashMap<String, String>();
	public String getBase() {
		return base;
	}
	public void setBase(String base) {
		this.base = base;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public HashMap<String, String> getRates() {
		return rates;
	}
	public void setRates(HashMap<String, String> rates) {
		this.rates = rates;
	}
	
	
	
	
	
	
}
