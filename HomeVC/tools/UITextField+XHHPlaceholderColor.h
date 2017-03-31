//
//
//    Howie  2017.
//
//
//
/*********************************************************
 
 ✞ 工具类作用:占位文本的颜色
 
 *********************************************************/







#import <UIKit/UIKit.h>

@interface UITextField (XHHPlaceholderColor)

@property (nonatomic,strong)UIColor *placeholderColor;

+(instancetype)xhh_textFieldWithView:(UIView *)superView placeholderText:(NSString *)placeholderText placeholderColor:(UIColor *)placeholderColor Font:(CGFloat)font  TintColor:(UIColor *)tintColor textAlignment:(NSTextAlignment)textAlignment;
@end
