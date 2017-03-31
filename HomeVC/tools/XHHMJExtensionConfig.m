//
//
//    Howie  2017.
//
//
//
#import "XHHMJExtensionConfig.h"
//这里暂时注释,如果有用到MJExtension 再打开
//#import <MJExtension/MJExtension.h>


@implementation XHHMJExtensionConfig
#pragma mark -
#pragma mark -专门抽成一个文件 防止模型被污染
/*
//第一种情况  直接替换
//当这个类加载到内存里面的时候就会调用这个方法
+(void)load {
    
    [XHHTopicsModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        
        
        return @{@"ID":@"id",
                 @"desc" : @"description",
                 //这种是两个属性 二选其一的情况 按顺序来选择
                 @"name111":@[@"screenName",@"hahaName"],
                 //这种是一个数组就装了一个字典 转成模型比较浪费
                 @"haha":@"other.xixi[1].abc"
                 
                 };
        
    }];
    
    [XHHTopicsModel mj_setupObjectClassInArray:^NSDictionary *{
        //在数组里的字典转为模型
        return @{
                        @"dogs" : @"XMGDog",
                        @"books" : @"XMGBook"
                        };

        
    }];
    
    //下划线转驼峰
//    [XHHTopicsModel mj_setupReplacedKeyFromPropertyName121:^NSString *(NSString *propertyName) {
//        // if ([propertyName isEqualToString:@"ID"]) return @"id";
//        return [propertyName mj_underlineFromCamel];
//    }];
    
    
}

*/



@end
