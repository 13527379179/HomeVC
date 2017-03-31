//
//
//    Howie  2017.
//
//
//
#import "UIView+Frame.h"

@implementation UIView (Frame)

+ (instancetype)viewFromXib
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}



-(CGFloat)xhh_right {
    return CGRectGetMaxX(self.frame);
}
-(CGFloat)xhh_bottom {
    
    return CGRectGetMaxY(self.frame);
    
}
-(void)setXhh_bottom:(CGFloat)xhh_bottom {
    //设置这个值一般是为了求y得坐标
    self.xhh_y = xhh_bottom -self.xhh_height;
    
}
-(void)setXhh_right:(CGFloat)xhh_right {
    //设置这个值,一般是为了求x得坐标
    self.xhh_x = xhh_right - self.xhh_width;
    
}

-(CGSize)xhh_size {
    
    return self.frame.size;
    
}

-(void)setXhh_size:(CGSize)xhh_size {
    
    CGRect frame = self.frame;
    
    frame.size = xhh_size;
    
    self.frame = frame;
    
    
}

-(CGFloat)xhh_width {
    
    return self.frame.size.width;
}
-(void)setXhh_width:(CGFloat)xhh_width {
    
    CGRect frame = self.frame;
    frame.size.width = xhh_width;
    self.frame = frame;
}
-(CGFloat)xhh_height {
    
    return self.frame.size.height;
}
-(void)setXhh_height:(CGFloat)xhh_height {
    
    CGRect frame = self.frame;
    frame.size.height = xhh_height;
    self.frame = frame;
}

-(CGFloat)xhh_x {
    
    return self.frame.origin.x;
    
    
}

-(void)setXhh_x:(CGFloat)xhh_x {
    
    CGRect frame = self.frame;
    frame.origin.x = xhh_x;
    self.frame = frame;
    
}

-(CGFloat)xhh_y {
    
    return self.frame.origin.y;
    
}
-(void)setXhh_y:(CGFloat)xhh_y {
    
    CGRect frame = self.frame;
    frame.origin.y = xhh_y;
    self.frame = frame;
    
    
}

-(CGFloat)xhh_centerX {
    
    return self.center.x;
    
    
    
}
-(void)setXhh_centerX:(CGFloat)xhh_centerX {
    
    CGPoint center = self.center;
    center.x = xhh_centerX;
    self.center = center;
    
}

-(CGFloat)xhh_centerY {
    
    return self.center.y;
    
    
    
}
-(void)setXhh_centerY:(CGFloat)xhh_centerY {
    
    CGPoint center = self.center;
    center.y = xhh_centerY;
    self.center = center;
    
    
    
}




@end
