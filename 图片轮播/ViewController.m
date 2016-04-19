//
//  ViewController.m
//  图片轮播
//
//  Created by 左忠飞 on 16/4/19.
//  Copyright © 2016年 zzf.con. All rights reserved.
//

#import "ViewController.h"
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height
@interface ViewController () <UIScrollViewDelegate>
//实例化scrollview
- (void)createScrollView;
//scrollView添加子视图
- (void)addChildViewAboutMyScroll;
//展示
@property (nonatomic,strong) UIScrollView *myScroll;
@end
@implementation ViewController {
    
    /**总页数*/
    NSInteger _wholePages;
    /**当前页*/
    NSInteger _currentPage;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**实例化scrollview*/
    [self createScrollView];
    
    /**scrollview添加子视图*/
    [self addChildViewAboutMyScroll];
}
//实例化scrollview
- (void)createScrollView {
    self.myScroll = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    /**打开按页滚动*/
    self.myScroll.pagingEnabled = YES;
    /**设置代理*/
    self.myScroll.delegate = self;
    /**初始化总页数与当前显示页*/
    _wholePages = 6;
    _currentPage = 1;
    /**设置起始显示点*/
    self.myScroll.contentOffset = CGPointMake(_currentPage * SCREEN_WIDTH, 0);
    /**设置可滚动的最大大小*/
    self.myScroll.contentSize = CGSizeMake(6 * SCREEN_WIDTH, 0);
    /**添加到view上*/
    //关闭弹簧效果
    self.myScroll.bounces = NO;
    //关闭分页效果
    self.myScroll.showsHorizontalScrollIndicator = NO;
    self.myScroll.showsVerticalScrollIndicator = NO;
    
    [self.view addSubview:self.myScroll];
}
//scrollView添加子视图
- (void)addChildViewAboutMyScroll {
    for (int i = 0; i < 6; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i*SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        imageView.backgroundColor =  [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0];
        
        
        [self.myScroll addSubview:imageView];
    }
}



@end
