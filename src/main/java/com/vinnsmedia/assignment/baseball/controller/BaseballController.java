package com.vinnsmedia.assignment.baseball.controller;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vinnsmedia.assignment.baseball.service.BaseballService;

@Controller
@RequestMapping("/baseball/*")
public class BaseballController {
	
	@Inject
	BaseballService ballService;
	
	@GetMapping("/")
	public String baseball()throws Exception {
		System.out.println("야구 게임 페이지 호출");
		
		return "baseball/baseball";
	}
	
	@PostMapping("/calc")
	@ResponseBody
	public ResponseEntity<Integer> calcHits(int score_blue, int score_red)throws Exception {
		ResponseEntity<Integer> entity = null;
		
		System.out.println("score_blue : "+score_blue+", score_red : "+score_red);
		
		// 필요 안타 수 구하기!
		Integer requiredHits = ballService.calcHits(score_blue, score_red);
		if(requiredHits != null) {
			// jsp로 전달
			entity = new ResponseEntity<>(requiredHits, HttpStatus.OK);
		}
		
		return entity;
	}
}
