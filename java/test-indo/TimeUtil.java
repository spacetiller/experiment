//package test;
/*
 * @param none
 * @return void
 * @author Juncheng
 * @version 0.1
 */
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

public class TimeUtil {
    private static String TIME_FROM = "time_from";
    private static String TIME_TO = "time_to";

    private static ZoneOffset ID_OFFSET = ZoneOffset.ofHours(7);

    private static final DateTimeFormatter DT_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    private static final DateTimeFormatter D_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd");

    private static Date dateTimeStrToDate(String timeStr) {
        LocalDateTime date = LocalDateTime.parse(timeStr, DT_FORMATTER);
        return Date.from(date.toInstant(ID_OFFSET));
    }

    public static Date dateStrToDate(String timeStr) {
        LocalDate date = LocalDate.parse(timeStr, D_FORMATTER);
        return Date.from(date.atStartOfDay().toInstant(ID_OFFSET));
    }

    public static Date yyyyMMddtoEndofTheDay(String timeStr) {
        LocalDate date = LocalDate.parse(timeStr, D_FORMATTER);
        LocalDateTime endDay = date.plusDays(1).atStartOfDay().minusSeconds(1);
        return Date.from(endDay.toInstant(ID_OFFSET));
    }

    public static Date beginOfDay() {
        LocalDate today = LocalDate.now();
        return Date.from(today.atStartOfDay().toInstant(ID_OFFSET));
    }

    public static Date endOfDay() {
        LocalDate tomorrow = LocalDate.now().plusDays(1);
        return Date.from(tomorrow.atStartOfDay()
                                 .minusSeconds(1)
                                 .toInstant(ID_OFFSET));
    }

    public static Date beginOfWeekAgo() {
        LocalDate weekAgo = LocalDate.now().minusDays(7);
        return Date.from(weekAgo.atStartOfDay().toInstant(ID_OFFSET));
    }

    public static String beginOfYesterDay() {
        LocalDate yesterday = LocalDate.now().minusDays(1);
        return yesterday.atStartOfDay().format(DT_FORMATTER);
    }

    public static String endOfYesterDay() {
        LocalDate yesterday = LocalDate.now();
        return yesterday.atStartOfDay().minusSeconds(1).format(DT_FORMATTER);
    }

    public static String today() {
        LocalDate today = LocalDate.now();
        return today.format(D_FORMATTER);
    }

    public static String yesterday() {
        LocalDate yesterday = LocalDate.now().minusDays(1);
        return yesterday.format(D_FORMATTER);
    }

    public static String pastHourBegin() {
        LocalDateTime pastHour = LocalDateTime.now(ID_OFFSET)
                                              .minusHours(1)
                                              .withMinute(0)
                                              .withSecond(0);
        return pastHour.format(DT_FORMATTER);
    }

    public static String pastHourEnd() {
        LocalDateTime pastHour = LocalDateTime.now(ID_OFFSET)
                                              .minusHours(1)
                                              .withMinute(59)
                                              .withSecond(59);
        return pastHour.format(DT_FORMATTER);
    }

    public static String thirtyDaysAgo() {
        LocalDate monthAgo = LocalDate.now(ID_OFFSET).minusDays(30);
        return monthAgo.format(D_FORMATTER);
    }

    public static void main(String args[]){
        System.out.println(pastHourBegin());
        System.out.println(pastHourEnd());
    }
}





