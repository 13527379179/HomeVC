//
//
//    Howie  2017.
//
//
//
/*********************************************************
 
 ✞ 工具类作用:创建uibarbuttonItem的封装
 
 *********************************************************/



#import <UIKit/UIKit.h>

@interface UIBarButtonItem (XHHExtension)

//__kindof iOS9 以后新特性泛型,在调用的时候可以看到提示中显示返回的类型,提高阅读性
+(__kindof UIBarButtonItem *)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;



@end
