//
//
//    Howie  2017.
//
//
//
#import <UIKit/UIKit.h>
#import "XHHAlertManager.h"
#import "XHHColor.h"


@implementation XHHAlertManager

+(void)showAlertVC {
    
    //读取存储在配置文件中的版本信息,如果跟当前的版本号相同,就直接返回
    NSString *myVersion = [[NSUserDefaults standardUserDefaults]objectForKey:@"xhh_currentVersion"];
    
    //判断当前版本号
    NSDictionary *infoDic = [[NSBundle mainBundle]infoDictionary];
    NSString *currentVersion = [infoDic objectForKey:@"CFBundleShortVersionString"];
    NSLog(@"%@", currentVersion);
    
    //看是否相同
    if ([myVersion isEqualToString:currentVersion]) {
        return;
    }
    
    //遮罩View
    UIView *coverView = [[UIView alloc]initWithFrame:[UIApplication sharedApplication].keyWindow.bounds];
    coverView.backgroundColor = XHHBlack;
    coverView.alpha = 0.3;

    //不同或者是第一次下载APP,就创建弹框窗口,并且弹框
    
    //创建控制器
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"喵呜~用的怎么样?如果还行,点个赞吧,我们需要您的五星好评!" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    //添加行为
    UIAlertAction *act1 = [UIAlertAction actionWithTitle:@"五星好评" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
        //跳转APP Store
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"www.baidu.com"]];
        
        //如果是好评了以后才将版本号储存到个人偏好中,其他选项不储存,以后还会弹框
        [[NSUserDefaults standardUserDefaults]setObject:currentVersion forKey:@"xhh_currentVersion"];
    }];
    
    
    UIAlertAction *act3 = [UIAlertAction actionWithTitle:@"有空再说" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        //推出弹窗
    }];
    
    //利用KVC个性化定制action的标题颜色,给用户心理暗示
    
    [act3 setValue:[UIColor grayColor] forKey:@"_titleTextColor"];
    
    //添加行为到弹窗控制器
    [alertVC addAction:act1];
    [alertVC addAction:act3];
    
    //获取window的根控制器
   UIViewController *VC = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    //程序启动后一分钟弹出窗口
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [[UIApplication sharedApplication].keyWindow.rootViewController.view insertSubview:coverView atIndex:1];

        [VC presentViewController:alertVC animated:YES completion:nil];
        
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [coverView removeFromSuperview];
        
    });

}

@end
