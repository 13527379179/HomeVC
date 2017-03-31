//
//  XHHHomeViewController.m
//  LionBuilding
//
//  Created by mac on 2017/2/26.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "XHHHomeViewController.h"

#import "XHHChild3ViewController.h"
#import "XHHChild1ViewController.h"
#import "XHHChild2ViewController.h"
#import "UIBarButtonItem+XHHExtension.h"
#define TopViewH 44

@interface XHHHomeViewController ()<UIScrollViewDelegate>


/** 记录当前选中的button */
@property (nonatomic, strong)  UIButton *selectedBtn;

/** 用个数组记录标题button */
@property (nonatomic, strong)  NSMutableArray<UIButton *> *btnArray;

/** 滚动视图 (这里用weak是因为,添加之后才用指针指向)*/
@property (nonatomic, weak)   UIScrollView *scrollView;

/** 顶部指示下标 */
@property (nonatomic, weak) UIView *indicatorView;


/** 顶部菜单栏 */
@property (nonatomic, strong)  UIView *topView;
/** 遮罩View */
@property (nonatomic, strong)  UIView *coverView;

/** 标题栏 */
@property (nonatomic, strong) NSArray *titles;
@end

@implementation XHHHomeViewController




- (void)viewDidLoad
{
    [super viewDidLoad];
    //标题
    self.titles = @[@"第一页面",@"第二页面",@"第三页面"];
    self.view.backgroundColor = XHHWhite;
    
    //导航栏
    [self setupNavbar];
    //添加子控制器
    [self setupChildVCs];
    //添加滚动背景
    [self setupScrollView];
    //设置标题栏
    [self setupTopView];
    
    //选中第一个控制器
    [self buttonClick:self.btnArray[0]];
    
    
    
}


#pragma mark --
#pragma mark - 添加子控制器
-(void)setupChildVCs
{
    //创建三个个页面
    XHHChild1ViewController *VC1 = [[XHHChild1ViewController alloc]init];
    XHHChild2ViewController *VC2 = [[XHHChild2ViewController alloc]init];
    XHHChild3ViewController *VC3 = [[XHHChild3ViewController alloc]init];
    
    //给自己添加三个子控制器
    
    [self addChildViewController:VC1];
    [self addChildViewController:VC2];
    [self addChildViewController:VC3];
    
}

#pragma mark --
#pragma mark - 设置导航栏
-(void)setupNavbar
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbg"] forBarMetrics:UIBarMetricsDefault];
    self.navigationItem.title = @"小灰灰通用首页";
}

#pragma mark --
#pragma mark - 设置顶部View
-(void)setupTopView
{
    
    
    //设置n个button到一个View上,再设置成为nav的titleView
    UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, XHHScreenW, TopViewH)];
    titleView.backgroundColor = XHHCharles;
    
    CGFloat buttonW = self.view.xhh_width/self.childViewControllers.count;
    CGFloat buttonH = TopViewH;
    //循环添加button
    for (int i = 0; i < self.titles.count ; i++ ) {
        
        CGFloat buttonX = i *buttonW;
        CGFloat buttonY = 0;
        

        //button的相关设置
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(buttonX, buttonY,buttonW, buttonH)] ;
        button.tag = i;
        
        //选中的title加粗
        
        NSAttributedString *attrNormaltitle = [[NSAttributedString alloc]initWithString:self.titles[i] attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:XHHBlack}];
        
        NSAttributedString *attrSelectedtitle = [[NSAttributedString alloc]initWithString:self.titles[i] attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:15],NSForegroundColorAttributeName:XHHBlack}];
        [button setAttributedTitle:attrSelectedtitle forState:UIControlStateSelected];
        [button setAttributedTitle:attrNormaltitle forState:UIControlStateNormal];
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        button.userInteractionEnabled = YES;
        
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [titleView addSubview:button];
        [self.btnArray addObject:button];
        
        //在添加好以后就直接选中button
        
    }
    
    [self.view addSubview:titleView];
    self.topView = titleView;
    
    
    //底部的指示器
    UIView *indicatorView = [[UIView alloc]init];
    indicatorView.backgroundColor = XHHCharles3;
    indicatorView.xhh_height = 2;
    indicatorView.xhh_y = titleView.xhh_height - 2;
    [titleView addSubview:indicatorView];
    self.indicatorView = indicatorView;
    UIButton *firstButton =  self.btnArray[0];
    
#pragma mark - 这个sizeToFit必须要写 就是立即计算titleLabel的宽度  不写就没有宽度
    [firstButton.titleLabel sizeToFit];
    
    //NSLog(@"%f",firstButton.titleLabel.xhh_width);
    indicatorView.xhh_width = firstButton.titleLabel.xhh_width;
    indicatorView.xhh_centerX = firstButton.xhh_centerX;
    [indicatorView layoutIfNeeded];

 
    
}


#pragma mark -
#pragma mark - 懒加载
-(NSMutableArray<UIButton *> *)btnArray
{
    
    if (!_btnArray) {
        _btnArray = [NSMutableArray array];
    }
    return _btnArray;
}






#pragma mark --
#pragma mark - button的点击事件
//搜索按钮
-(void)searchClick
{
    NSLog(@"搜索");
}


//有空应该封装到block里面,这样代码聚合性好些
-(void)buttonClick:(UIButton *)button
{
    
    
    NSInteger index = button.tag;
    //记录的button取消选中状态
    self.selectedBtn.selected = NO;
    
    //当前选中
    button.selected = YES;
    
    
    
    
    
    //选中之后动态跳转到另一个view中去(添加子控制器View)
    [UIView animateWithDuration:0.4 animations:^{
        
        self.scrollView.contentOffset = CGPointMake(index * self.view.xhh_width, 0);
        
    }];
    //滚动完了之后再添加自控制器,因为添加自控制器的时候用到了scrollView的bounds
    [self addChildViews:index];
    //继续记录
    self.selectedBtn = button;
    
}


-(void)addChildViews:(NSUInteger) index
{
    
    
    UIViewController *ChildVC = self.childViewControllers[index];
    
    if (ChildVC.viewLoaded) {
        return;
    }
    ChildVC.view.frame = self.scrollView.bounds;
    
    [self.scrollView addSubview:ChildVC.view];
    
}


#pragma mark --
#pragma mark - 设置scrollView
-(void)setupScrollView
{
    
    //几个子控制器,就计算几个contentSize的宽度(缺点是:设置滚动必须在设置子控制器之后)
    NSUInteger numVC = self.childViewControllers.count;
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    scrollView.backgroundColor = XHHRandomColor;
    //不允许设置自动适应内边距
    self.automaticallyAdjustsScrollViewInsets = NO;
    scrollView.bounces = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    scrollView.backgroundColor = XHHWhite;
    scrollView.contentSize = CGSizeMake(XHHScreenW * numVC, 0);
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    
    
}


#pragma mark --
#pragma mark - ScrollView代理
//根据滚动偏移量动态的添加view,这样不会导致打开程序的长时间加载
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    //计算停止滚动后的控制器是哪个
    NSInteger index = scrollView.contentOffset.x / self.view.xhh_width;
    
    //用数组记录button,根据index点击
    [self buttonClick:self.btnArray[index]];
    
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    self.indicatorView.xhh_centerX = scrollView.contentOffset.x * ((XHHScreenW / self.titles.count) / XHHScreenW) + (XHHScreenW / self.titles.count)/2 ;
    
}


-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
