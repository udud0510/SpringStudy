package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

// @Controller 를 통해서 스프링의 빈으로 인식
// @RequestMapping을 통해서 /board로 시작하는 모든 처리를 BoardController에서 하도록 지정
@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {

	private BoardService service;

	@GetMapping("/list")
	public void list(Model model) {
		log.info("list");
		// list라는 곳에 service.getList()값 저장
		model.addAttribute("list", service.getList());
	}
}
