package com.spring.dct.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

	@GetMapping("/userJoin")
	public void userJoin() {
		System.out.println("userJoin 페이지 진입");
	}
	
	@GetMapping("/userMypage")
	public void userMypage() {
		System.out.println("userMypage 페이지 진입");
	}
	
	@GetMapping("/userIdSearch")
	public void userIdSearch() {
		System.out.println("userIdSearch 페이지 진입");
	}
	
	@GetMapping("/userPwSearch")
	public void userPwSearch() {
		System.out.println("userPwSearch 페이지 진입");
	}

}
