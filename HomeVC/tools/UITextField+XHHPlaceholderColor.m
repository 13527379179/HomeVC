//
//
//    Howie  2017.
//
//
//

#import "UITextField+XHHPlaceholderColor.h"
#import "XHHColor.h"
@implementation UITextField (XHHPlaceholderColor)


-(void)setPlaceholderColor:(UIColor *)placeholderColor {
    BOOL change = NO;
    
    // 保证有占位文字,不然后面的设置占位文字会崩溃 设置后再还原成nil即可
    if (self.placeholder == nil) {
        self.placeholder = @" ";
        change = YES;
    }
    
    // 利用KVC设置占位文字颜色
    [self setValue:placeholderColor forKeyPath:@"placeholderLabel.textColor"];
    
    // 恢复原状
    if (change) {
        self.placeholder = nil;
    }
    
    
    
}
-(UIColor *)placeholderColor {
    
    return [self valueForKeyPath:@"placeholderLabel.textColor"];
    
    
    
}
+(instancetype)xhh_textFieldWithView:(UIView *)superView placeholderText:(NSString *)placeholderText placeholderColor:(UIColor *)placeholderColor Font:(CGFloat)font  TintColor:(UIColor *)tintColor textAlignment:(NSTextAlignment)textAlignment {
    
    UITextField *textField = [[UITextField alloc]init];
    textField.placeholder = placeholderText;
    [textField setPlaceholderColor:placeholderColor];
    textField.font = [UIFont systemFontOfSize:font];
    textField.tintColor = tintColor;
    textField.textAlignment = textAlignment;
    textField.backgroundColor = XHHWhite;
    [superView addSubview:textField];
    return textField;
}

@end
