package com.adil.springeshop.service;

import com.adil.springeshop.ws.greeting.Greeting;
import com.adil.springeshop.ws.greeting.Greeting;
import org.springframework.stereotype.Component;

import javax.xml.datatype.DatatypeConfigurationException;
import javax.xml.datatype.DatatypeFactory;
import java.util.GregorianCalendar;

@Component
public class GreetingService {
	public Greeting generateGreeting(String name) throws DatatypeConfigurationException {
		Greeting greeting = new Greeting();
		greeting.setText("Hello, " + name);
		greeting.setDate(DatatypeFactory.newInstance()
				.newXMLGregorianCalendar(new GregorianCalendar()));
		return greeting;
	}
}