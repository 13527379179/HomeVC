//
//
//
//    Howie  2017.
//
//
//
#import <UIKit/UIKit.h>

typedef void (^buttonClickBlock)(UIButton *);
@interface XHHButton : UIButton

-(instancetype)initWithView:(UIView *)superView Title:(NSString *)title titleColor:(UIColor *)color titleFont:(CGFloat)font frame:(CGRect)frame BGimageNor:(NSString *)BGimageNor BGimageSel:(NSString *)BGimageSel cornerRadius:(CGFloat)cornerRadius  buttonClickBlock:(buttonClickBlock)buttonClickBlock;

+(instancetype)xhhButtonWithView:(UIView *)superView Title:(NSString *)title titleColor:(UIColor *)color titleFont:(CGFloat)font frame:(CGRect)frame BGimageNor:(NSString *)BGimageNor BGimageSel:(NSString *)BGimageSel cornerRadius:(CGFloat)cornerRadius  buttonClickBlock:(buttonClickBlock)buttonClickBlock;
@end
