package com.gada.travelgada.utils;

import java.util.List;

import com.gada.travelgada.domain.PointVO;

public class PointCalculator {
	//save_flag == 0 적립
	//sage_flag == 1 사용
	
	public static int getCurrentPoint(List<PointVO> pointList) {
		int currPoint = 0;
		if(pointList == null) {
			return 0;
		} else {
			for(PointVO point : pointList) {
				if(point.getSave_flag() == 0) {
					currPoint += point.getAmount();
				} else {
					currPoint -= point.getAmount();
				}
			}			
		}
		return currPoint;
	}

}