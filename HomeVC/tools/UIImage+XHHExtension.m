//
//
//    Howie  2017.
//
//
//
#import "UIImage+XHHExtension.h"

@implementation UIImage (XHHExtension)
//- (instancetype)circleImage
//{
//    // 开启图形上下文
//    UIGraphicsBeginImageContext(self.size);
//    
//    // 上下文
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    
//    // 添加一个圆
//    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
//    CGContextAddEllipseInRect(ctx, rect);
//    
//    // 裁剪
//    CGContextClip(ctx);
//    
//    // 绘制图片
//    [self drawInRect:rect];
//    
//    // 获得图片
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    
//    // 关闭图形上下文
//    UIGraphicsEndImageContext();
//    
//    return image;
//}


-(instancetype)circleImage {
    
    //开启一个图片的图形上下文
    UIGraphicsBeginImageContext(self.size);
    
    //得到当前上下文
    //CGFontRef ctx = UIGraphicsGetCurrentContext();
    
    //用路径画一个圆形出来
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    
    //把路径设置为裁剪区域,超出区域外会自动裁减掉
    [path addClip];
    
    //把图片绘制到上下文中
    [self drawAtPoint:CGPointZero];
    
    //从上下文中生成一张图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭图形上下文
    UIGraphicsEndImageContext();
    
    //返回图片
    return newImage;
    
    
}




+ (instancetype)circleImage:(NSString *)name
{
    return [[self imageNamed:name] circleImage];
}

@end
