//
//
//    Howie  2017.
//
//
//
#import <UIKit/UIKit.h>

@interface UIImageView (XHHExtension)
/** 使用layer进行剪裁 */
-(void)circleImageUseLayer;

/** 使用2D绘图进行剪裁 */
- (instancetype)circleImage:(NSString *)imageName;
+ (instancetype)circleImage:(NSString *)imageName;
 //添加imageView
+ (instancetype)xhh_ImageViewWithView:(UIView *)superView imageName:(NSString *)imageName;@end
