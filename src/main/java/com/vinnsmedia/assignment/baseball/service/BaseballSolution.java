package com.vinnsmedia.assignment.baseball.service;

import org.springframework.stereotype.Service;

@Service
public class BaseballSolution implements BaseballService {
	//실제 구현
	@Override
	public Integer calcHits(int score_blue, int score_red) throws Exception {
		// 반환할 결과(안타 수)
		Integer result = null;
		
		// 트리거 형성
		boolean earnable = true;
		
		// Blue - Red 점수 차!
		int reqScore = score_blue - score_red;
		
		System.out.println("필요 점수 : "+reqScore);
		// 이미 Red 팀이 앞서고 있을 때
		if(reqScore < 0) {
			System.out.println("이미 앞서고 있음");
			result = 0;
		// 필요 안타 수 구하기!
		}else {
			// 인덱스
			int i = 0;
			// while문을 돌면서 구하기
			while(earnable) {
				System.out.println("i : "+i);
				int score = 3*i+1;
				int triple = 3*i+2;
				// 안타로 낸 점수가 필요 점수보다 적을 때
				if(score <= reqScore) {
					i++;
				// 안타로 낸 점수가 필요 점수를 넘었을 때!
				}else {
					System.out.println("끝 : "+score);
					System.out.println("필요 안타 수 : "+triple);
					
					result = triple;
					earnable = false;
				}
				
			}
			
		}
		
		return result;
	}
	
}
