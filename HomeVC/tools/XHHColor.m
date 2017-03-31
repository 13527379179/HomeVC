//
//
//    Howie  2017.
//
//
////

#import "XHHColor.h"

@implementation XHHColor


+ (UIImage *)xhh_imageFromColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    //开启位图图形上下文
    UIGraphicsBeginImageContext(rect.size);
    //获得当前的图形上下文(也就是指定上下文的范围)
    CGContextRef context = UIGraphicsGetCurrentContext();
    //填充颜色
    CGContextSetFillColorWithColor(context, [color CGColor]);
    //填充到指定范围
    CGContextFillRect(context, rect);
    //从上下文获取图片
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    //关闭图形上下文
    UIGraphicsEndImageContext();
    return img;
}
+(void)xhh_chageColor:(UIView *)aView :(UIColor *)color1 :(UIColor *)color2 :(BOOL)isInsert{
    //  创建 CAGradientLayer 对象

    CAGradientLayer *gradientLayer = [CAGradientLayer layer];

    //  设置 gradientLayer 的 Frame

    gradientLayer.frame = aView.bounds;

    //  创建渐变色数组，需要转换为CGColor颜色

    gradientLayer.colors = @[(id)color1.CGColor,
                             
                             (id)color2.CGColor];

    //  设置颜色变化点，取值范围 0.0~1.0

    //  gradientLayer.locations = @[@0 ,@1];

    //  设置渐变颜色方向，左上点为(0,0), 右下点为(1,1)

    gradientLayer.startPoint = CGPointMake(0.5, 1);

    gradientLayer.endPoint = CGPointMake(0.5, 0);

    //  添加渐变色到创建的 UIView 上去
    //这里不用 add 用插入
    if (isInsert == YES) {
        [aView.layer insertSublayer:gradientLayer atIndex:0 ];
    }else {
        [aView.layer addSublayer:gradientLayer];
    }
    
}

+(void)xhh_AddblurColor:(UIView *)aView :(float)alpha :(UIBlurEffectStyle)style {
    
    // blur(毛玻璃)效果
    UIVisualEffectView *visual = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:style]];
    visual.frame = aView.bounds;
    visual.alpha = alpha;
    [ aView addSubview:visual];
}
@end
