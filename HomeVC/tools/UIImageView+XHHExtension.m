//
//
//    Howie  2017.
//
//
//
#import "UIImageView+XHHExtension.h"

@implementation UIImageView (XHHExtension)



#pragma mark -
#pragma mark - 用图层处理圆角图片()
-(void)circleImageUseLayer {
    
    //设置圆角
    self.layer.cornerRadius = MAX(self.bounds.size.width,self.bounds.size.height);
    self.clipsToBounds = YES;
    //self.layer.masksToBounds = YES;
}


#pragma mark --
#pragma mark - 用绘图的方式处理圆角图片
-(instancetype)circleImage:(NSString *)imageName {
    
    //获得这张图
    UIImage *image = [UIImage imageNamed:imageName];
    
    //开启一个与图片相同大小的图形上下文
    UIGraphicsBeginImageContext(image.size);
    
    //给这个上下文中添加路径
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    
    //剪裁超出这个路径的图形上下文
    [path addClip];
    
    //将图片绘制到上下文中
    [image drawAtPoint:CGPointZero];
    
    //获取图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //添加到imageVIew 中
    UIImageView *imageView = [[UIImageView alloc]initWithImage:newImage];
    
    //关闭图形上下文
    UIGraphicsEndImageContext();
    
    //返回ImageView
    return imageView;
 
}



+ (instancetype)circleImage:(NSString *)imageName {
    
    return [[[self alloc]init] circleImage:imageName];

}
//添加一张图片
+(instancetype)xhh_ImageViewWithView:(UIView *)superView imageName:(NSString *)imageName {
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
    imageView.userInteractionEnabled = YES;
    [superView addSubview:imageView];
    return imageView;
}


@end
