package com.gada.travelgada.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class DateCalculator {
	
	private static final int DAYTIME = 60*60*24*1000;
	
	private static Calendar calendar = Calendar.getInstance();
	private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
	
	public static Date getNextDate(Date date) throws ParseException {
		calendar.setTime(date);
		calendar.add(Calendar.DATE, 1);
		return calendar.getTime();
	}
	
	public static String getToday(Date date) {
		return DATE_FORMAT.format(date);
	}
	
	public static int getDifference(Date day1, Date day2) {
		return (int) ((day2.getTime() - day1.getTime())/DAYTIME) + 1;
	}
	
	public static int getDDay(Date day) {
		return (int) ((day.getTime() - calendar.getTime().getTime()) / DAYTIME) + 1;
	}
	
	public static List<String> getDateList(Date startDate, Date endDate) throws ParseException {
		List<String> dateList = new ArrayList<String>();
		Date date = startDate;
		dateList.add(getToday(date));
		for(int i = 1 ; i < getDifference(startDate, endDate); i++) {
			date = getNextDate(date);
			dateList.add(getToday(date));
		}
		
		return dateList;
	}

}
