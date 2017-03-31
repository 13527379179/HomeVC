//
//
//    Howie  2017.
//
//
//
#import "XHHButton.h"

@interface XHHButton ()

@property (nonatomic, copy)  buttonClickBlock Myblock;

@end
@implementation XHHButton

//添加button
-(instancetype)initWithView:(UIView *)superView Title:(NSString *)title titleColor:(UIColor *)color titleFont:(CGFloat)font frame:(CGRect)frame BGimageNor:(NSString *)BGimageNor BGimageSel:(NSString *)BGimageSel cornerRadius:(CGFloat)cornerRadius  buttonClickBlock:(buttonClickBlock)buttonClickBlock{
    
    
    if (self = [super initWithFrame:frame]) {
        

        self.frame = frame;
        self.titleLabel.font = [UIFont systemFontOfSize:font];
        self.layer.cornerRadius = cornerRadius;
        self.clipsToBounds = YES;
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:color forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageNamed:BGimageNor] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageNamed:BGimageSel] forState:UIControlStateSelected];
        self.Myblock = buttonClickBlock;
        [self addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [superView addSubview:self];

    }
    
    
    return self;
}

-(void)click:(UIButton *)button {
    
    self.Myblock(button);
}

+(instancetype)xhhButtonWithView:(UIView *)superView Title:(NSString *)title titleColor:(UIColor *)color titleFont:(CGFloat)font frame:(CGRect)frame BGimageNor:(NSString *)BGimageNor BGimageSel:(NSString *)BGimageSel cornerRadius:(CGFloat)cornerRadius buttonClickBlock:(buttonClickBlock)buttonClickBlock {
    
    return [[self alloc]initWithView:superView Title:title titleColor:color titleFont:font frame:frame BGimageNor:BGimageNor BGimageSel:BGimageSel cornerRadius:cornerRadius buttonClickBlock:buttonClickBlock];
}

@end
