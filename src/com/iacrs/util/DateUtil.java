package com.iacrs.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public abstract class DateUtil
{

    public static String format(Date date, String pattern)
    {
        return new SimpleDateFormat(pattern).format(date);
    }
    /*
     * Manipulate date to 00:00:00 and 23:59:59 
     */
    public static Date toStartDate(Date date)
    {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        return calendar.getTime();
    }

    public static Date toEndDate(Date date)
    {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.set(Calendar.HOUR_OF_DAY, 23);
        calendar.set(Calendar.MINUTE, 59);
        calendar.set(Calendar.SECOND, 59);
        return calendar.getTime();
    }

    public static int getInterval(Date base, Date date)
    {
	
        base = toStartDate(base);
        date = toStartDate(date);
        GregorianCalendar baseCalendar = new GregorianCalendar();
      
        GregorianCalendar calendar = new GregorianCalendar();
        baseCalendar.setTime(base);
        calendar.setTime(date);
        return (int)((calendar.getTimeInMillis() - baseCalendar.getTimeInMillis()) / (1000 * 3600 * 24));
    }
}
