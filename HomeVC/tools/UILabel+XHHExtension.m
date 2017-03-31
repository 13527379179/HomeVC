//
//
//    Howie  2017.
//
//
//

#import "UILabel+XHHExtension.h"

@implementation UILabel (XHHExtension)

//添加label
+(instancetype)xhh_LabelWithView:(UIView *)superView Text:(NSString *)text TextColor:(UIColor *)color Font:(CGFloat)font TextAlignment:(NSTextAlignment)alignment{
    
    UILabel *label = [[UILabel alloc]init];
    label.text = text;
    label.textColor = color;
    label.textAlignment = alignment;
    label.font = [UIFont systemFontOfSize:font];
    [superView addSubview:label];
    return label;
}
@end
