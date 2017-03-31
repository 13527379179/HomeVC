//
//
//    Howie  2017.
//
//
//
//

#import "NSString+XHHFileSize.h"

@implementation NSString (XHHFileSize)

- (unsigned long long)fileSize {
    
    unsigned long long size = 0;
    NSFileManager *manager = [NSFileManager defaultManager];
    //是否为文件夹
    
    BOOL isDirectory = NO;
    //路径是否存在
    BOOL exists = [manager fileExistsAtPath:self isDirectory:&isDirectory];
    if (!exists) {
        return size;
        
    }
    //如果是文件夹,就遍历文件夹中的文件
    if (isDirectory) {
        //目录遍历器
        NSDirectoryEnumerator *enumerator = [manager enumeratorAtPath:self];
        for (NSString *subPath in enumerator) {
            NSString *fullPath = [self stringByAppendingPathComponent:subPath];
            
            size += [manager attributesOfItemAtPath:fullPath error:nil].fileSize;
            
            
        }
    } else {
        //不是文件夹就是文件
        size = [manager attributesOfItemAtPath:self error:nil].fileSize;
    }
    
    
    return size;
    
}



@end
