//
//
//    Howie  2017.
//
//
//
//

#import "XHHSquareMeButton.h"
#import "UIView+Frame.h"
//#import <UIButton+WebCache.h>
@implementation XHHSquareMeButton

-(instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        
       // self.backgroundColor = XHHRandomColor;
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //[self setBackgroundImage:[UIImage imageNamed:@"mainCellBackground"] forState:UIControlStateNormal];
         
    }
    return self;
    
}


-(void)layoutSubviews {
    //等button创建完了之后(button创建的顺序是 先进入initwithframe然后 进到外面设置frame的代码 以及设置数据  完了之后就完成创建)  之后 会对内部子空间进行排列 就会来到这里 
    [super layoutSubviews];
    
    
    
    
    self.imageView.xhh_y = self.xhh_height * 0.15;
    self.imageView.xhh_height = self.xhh_height *0.5;
    self.imageView.xhh_width = self.imageView.xhh_height;
    self.imageView.xhh_centerX = self.xhh_width /2;
    self.titleLabel.xhh_x = 0;
    //NSLog(@"%@,%@",self.titleLabel.text,self);
    self.titleLabel.xhh_y = self.imageView.xhh_bottom;
    self.titleLabel.xhh_width = self.xhh_width;
    self.titleLabel.xhh_height = self.xhh_height - self.imageView.xhh_bottom;

    
}
//这里是绑定square和button 让他变成button的属性 在外部把模型传进来,这里进行对button的各个控件属性的赋值
-(void)setSquare:(XHHMeSquare *)square {
    _square = square;
    
    //用SDWebImage框架设置button的图片
//    [self setTitle:square.name forState:UIControlStateNormal];
//    [self sd_setImageWithURL:[NSURL URLWithString:square.icon] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"setup-head-default"]];

    
    
}
@end
