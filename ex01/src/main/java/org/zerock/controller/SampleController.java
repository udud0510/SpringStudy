package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.zerock.domain.SampleDTO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping(value = "/sample/*")
public class SampleController {

	@RequestMapping(value = "")
	public void basic() {
		log.info("basic..................");
	}

	@RequestMapping(value = "/basic",method= {RequestMethod.GET,RequestMethod.POST})
	public void basicGet() {
		log.info("basic get..................");
	}
	
	@GetMapping("/basicOnlyGet")
	public void basicGet2() {
		log.info("basic get only get...........");
	}
	
	@GetMapping("/ex01")
	public String ex01(SampleDTO dto) {
		log.info(""+dto);
		return "ex01";
	}
}
