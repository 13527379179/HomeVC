//
//
//    Howie  2017.
//
//
//
//


//#import "XHHRefreshHeader.h"
//#import "UIImage+XHHExtension.h"
//@interface XHHRefreshHeader ()
////logo
//@property (nonatomic,weak)UIImageView *logoImageView;
//
//
//@end
//
//@implementation XHHRefreshHeader
//
//
////初始化
//-(void)prepare {
//    [super prepare];
//    //上面的view有透明效果  而且根据下拉的情况实时变化
//    self.automaticallyChangeAlpha = YES;
////    self.lastUpdatedTimeLabel.textColor = [UIColor darkGrayColor];
////    
////    self.stateLabel.textColor = [UIColor darkGrayColor];
////    [self setTitle:@"正在加载数据..." forState:MJRefreshStateRefreshing];
////    [self setTitle:@"松开进行刷新" forState:MJRefreshStatePulling];
////    [self setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
////    [self.lastUpdatedTimeLabel setValue:@"最后刷新的时间" forKey:@"text"];
//
//      UIImageView *logo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"liked"]];
//    //logo.layer.cornerRadius = logo.xhh_width/2;
//    BmobUser *user = [BmobUser currentUser];
//    if (user) {
//        
//        [logo setHeader:[user objectForKey:@"profileImage"]];
//        //logo.xhh_width  = logo.xhh_width*0.8;
//        
//        
//    }else {
//        logo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"liked"]];
//    }
//    
//    
//    self.logoImageView = logo;
//    
//    [self addSubview:logo];
//    
//    
//    
//    
//}
//-(void)placeSubviews {
//    
//    [super placeSubviews];
//    self.logoImageView.xhh_width = self.xhh_width*0.18;
//    self.logoImageView.xhh_height = self.xhh_height;
//    //self.logoImageView.xhh_x = 0;
//    self.logoImageView.xhh_y = -50;
//    self.logoImageView.xhh_centerX = self.xhh_centerX;
//    
//}
//
//
//@end
