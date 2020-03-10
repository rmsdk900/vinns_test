package com.vinnsmedia.assignment.hash.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vinnsmedia.assignment.hash.util.KISA_SHA256;
import com.vinnsmedia.assignment.hash.util.MD5;

@Controller
@RequestMapping("/hash/*")
public class HashController {
	
	@GetMapping("/")
	public String hash()throws Exception {
		System.out.println("해쉬 함수 페이지 호출");
		
		return "hash/hash";
	}
	
	@PostMapping("/hashing")
	@ResponseBody
	public ResponseEntity<String> hashingMsg(String msg)throws Exception {
		ResponseEntity<String> entity = null;
		
		/**
		 * MD5
		 */
		String hashingMsg = MD5.toHexString(MD5.computeMD5(msg.getBytes()));
		if(hashingMsg.length()>0) {
			entity = new ResponseEntity<>(hashingMsg, HttpStatus.OK);
		}
		
		return entity;
	}
	
}
