//
//
//    Howie  2017.
//
//
//

#import "NSCalendar+XHHExtension.h"

@implementation NSCalendar (XHHExtension)


//8.0以后才支持这种方法,所以在这里根据条件进行判断
+(instancetype)calendar {
    
    if ([NSCalendar respondsToSelector:@selector(calendarWithIdentifier:)]) {
        return [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
        
    }else {
        return [NSCalendar currentCalendar];
    }
    
    
}

@end
