//
//
//    Howie  2017.
//
//
//
/*********************************************************
 
 ✞ 工具类作用:通过2D绘图对Image剪裁,返回圆形图片
 
 *********************************************************/


#import <UIKit/UIKit.h>

@interface UIImage (XHHExtension)
/**
 *  返回圆形图片
 */
- (instancetype)circleImage;

+ (instancetype)circleImage:(NSString *)name;

@end
