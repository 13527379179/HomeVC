//
//
//    Howie  2017.
//
//
//
/*********************************************************
 
 ✞ 工具类作用:简化使用坐标和尺寸的代码
 
 *********************************************************/



#import <UIKit/UIKit.h>

@interface UIView (Frame)

@property (nonatomic, assign) CGFloat xhh_right;
@property (nonatomic, assign) CGFloat xhh_bottom;
@property (nonatomic, assign) CGSize  xhh_size;
@property (nonatomic, assign) CGFloat xhh_width;
@property (nonatomic, assign) CGFloat xhh_height;
@property (nonatomic, assign) CGFloat xhh_x;
@property (nonatomic, assign) CGFloat xhh_y;
@property (nonatomic, assign) CGFloat xhh_centerX;
@property (nonatomic, assign) CGFloat xhh_centerY;

+ (instancetype)viewFromXib;
@end
