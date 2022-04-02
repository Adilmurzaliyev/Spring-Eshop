package com.adil.springeshop.endpoint;

import com.adil.springeshop.config.WebServiceConfig;
import com.adil.springeshop.service.GreetingService;
import com.adil.springeshop.ws.greeting.GetGreetingRequest;
import com.adil.springeshop.ws.greeting.GetGreetingResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ws.server.endpoint.annotation.Endpoint;
import org.springframework.ws.server.endpoint.annotation.PayloadRoot;
import org.springframework.ws.server.endpoint.annotation.RequestPayload;
import org.springframework.ws.server.endpoint.annotation.ResponsePayload;

import javax.xml.datatype.DatatypeConfigurationException;

@Endpoint
public class GreetingEndpoint {

	public static final String NAMESPACE_URL = "http://adil.com/springeshop/ws/greeting";

	private GreetingService greetingService;

	@Autowired
	public GreetingEndpoint(GreetingService greetingService) {
		this.greetingService = greetingService;
	}

	@PayloadRoot(namespace = NAMESPACE_URL, localPart = "getGreetingRequest")
	@ResponsePayload //полезная нагрузка
	public GetGreetingResponse getGreeting(@RequestPayload GetGreetingRequest request)
			throws DatatypeConfigurationException {
		GetGreetingResponse response = new GetGreetingResponse();

		response.setGreeting(greetingService.generateGreeting(request.getName()));

		return response;
	}
}