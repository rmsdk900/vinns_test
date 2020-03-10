package com.vinnsmedia.assignment.baseball.service;

public interface BaseballService {
	
	// 필요 안타 수 계산하기
	Integer calcHits(int score_blue, int score_red)throws Exception;

}
