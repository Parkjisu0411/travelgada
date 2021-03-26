package com.gada.travelgada.utils;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class DateCalculator {
	
	private static final int DAYTIME = 60*60*24*1000;
	
	private static Calendar calendar = Calendar.getInstance();
	
	public static Date nextDay(Date date) {
		calendar.setTime(date);
		calendar.add(Calendar.DATE, 1);
		return calendar.getTime();
	}
	
	public static int getDifference(Date day1, Date day2) {
		return (int) ((day2.getTime() - day1.getTime())/DAYTIME) + 1;
	}
	
	public static List<Date> getDateList(Date startDate, Date endDate) {
		List<Date> dateList = new ArrayList<Date>();
		Date date = startDate;
		for(int i = 0 ; i < getDifference(startDate, endDate); i++) {
			dateList.add(date);
			date = nextDay(date);
		}
		
		return dateList;
	}

}
