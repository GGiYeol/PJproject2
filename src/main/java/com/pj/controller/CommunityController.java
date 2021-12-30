package com.pj.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/comBoard")
public class CommunityController {
	
	@RequestMapping("/")
	public String main(HttpServletRequest request) {
	
	return "community/community";
	}
	
	@RequestMapping("/free")
	public String free(HttpServletRequest request) {
	
	return "community/community_FreeBoard";
	}
}
