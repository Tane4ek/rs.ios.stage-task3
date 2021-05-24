#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    if ((monthNumber < 1) || (monthNumber > 12))
        return nil;

    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierISO8601];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setMonth:monthNumber];
    NSDate *date = [calendar dateFromComponents:components];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMMM"];
    return [formatter stringFromDate:date];
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)str {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    NSDate *date = [formatter dateFromString:str];
    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierISO8601];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:date];
    return components.day;
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"RU_ru"];
    formatter.dateFormat = @"E";
    return [formatter stringFromDate:date];
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSDate *today = NSDate.date;
    NSCalendar *calendar = NSCalendar.currentCalendar;
    calendar.firstWeekday = 2;
    NSDateComponents *components = [calendar components:NSCalendarUnitWeekday | NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:today];

    NSDateComponents *componentsNew = [[NSDateComponents alloc] init];
    [componentsNew setDay:components.day];
    [componentsNew setMonth:components.month];
    [componentsNew setYear:components.year];
    today = [calendar dateFromComponents:componentsNew];

    NSDateComponents *add = [[NSDateComponents alloc] init];
    NSInteger tmpWeekDay = components.weekday;
    if (tmpWeekDay == 1)
        tmpWeekDay = 8;
    [add setDay: - (tmpWeekDay - calendar.firstWeekday)];
    NSDate *begin = [calendar dateByAddingComponents:add toDate:today options:0];
    [add setDay: 7];
    NSDate *end = [calendar dateByAddingComponents:add toDate:begin options:0];
    return !([date compare:begin] == NSOrderedAscending) && ([date compare:end] == NSOrderedAscending);
}
@end
