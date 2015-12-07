package com.prabin.converter.service;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.prabin.converter.domain.CurrencyObject;

@Service
public class CalculateService {
	CurrencyObject result;

	public void loadData() {
		final String uri = "http://api.fixer.io/latest";
		RestTemplate restTemplate = new RestTemplate();

		result = restTemplate.getForObject(uri, CurrencyObject.class);
		System.out.println(result.getRates().size());

	}

	public double getValue(String fromCountry, String toCountry, double amount) {
		loadData();
		
		if (fromCountry.equals(result.getBase())) {
			double temp = Double.parseDouble((result.getRates().get(toCountry)));
			
			return (temp * amount);
		}
		else if(toCountry.equals(result.getBase())){
			double temp=Double.parseDouble((result.getRates().get(fromCountry)));
			return amount/temp;
		}
		else{
			double c1=Double.parseDouble((result.getRates().get(fromCountry)));
			double c2=Double.parseDouble((result.getRates().get(toCountry)));
			double amt=amount/c1;
			return(amt*c2);
		}
	}
}
