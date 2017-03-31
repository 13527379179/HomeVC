//
//
//    Howie  2017.
//
//
//





#import "NSDate+XHHExtension.h"
#import "NSCalendar+XHHExtension.h"

@implementation NSDate (XHHExtension)

//判断二者是否相同(self代表时间对象)
-(BOOL)isThisYear {
    
    NSCalendar *calendar = [NSCalendar calendar];
    NSInteger selfYear = [calendar component:NSCalendarUnitYear fromDate:self];
    NSInteger nowYear = [calendar component:NSCalendarUnitYear fromDate:[NSDate date]];
    return selfYear == nowYear;
}

-(BOOL)isToday {
    
    NSCalendar *calendar = [NSCalendar calendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    //必须年月日都想同
    NSDateComponents *selfDay = [calendar components:unit fromDate:self];
    NSDateComponents *today = [calendar components:unit fromDate:[NSDate date]];
    //这里不能直接相等
    return selfDay.year ==today.year && selfDay.month == today.month && selfDay.day ==today.day;
    
    
    
}

-(BOOL)isYesterday {
    NSCalendar *calendar = [NSCalendar calendar];
    //第一步先把时间的时分秒去掉
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    
    fmt.dateFormat = @"yyyy-MM-dd";
    NSString *selfString = [fmt stringFromDate:self];
    NSString *cmpString = [fmt stringFromDate:[NSDate date]];
    
    NSDate *selfDate = [fmt dateFromString:selfString];
    NSDate *TodayDate = [fmt dateFromString:cmpString];
    
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth |NSCalendarUnitDay ;
    
    NSDateComponents *cmpConponents = [calendar components:unit fromDate:selfDate toDate:TodayDate options:0];
    
    
    return cmpConponents.year ==0 && cmpConponents.month ==0 &&cmpConponents.day ==1;
}

@end
