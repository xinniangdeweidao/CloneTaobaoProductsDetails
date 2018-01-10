//
//  ViewController.m
//  仿淘宝商品详情页
//
//  Created by 李真 on 2018/1/9.
//  Copyright © 2018年 李真. All rights reserved.
//

#import "ViewController.h"
#import "LZProductDetails.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    LZProductDetails * detailsV = [[LZProductDetails alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    [self.view addSubview:detailsV];
    detailsV.scrollOptBlock = ^(NSInteger index) {
        NSLog(@"第%d页",(int)index);
    };
    detailsV.PlayVideoOptBlock = ^(BOOL isOK) {
        NSLog(@"点击播放");
    };
    [detailsV updateUIWithImageAndVideoArray:@[@"djasj",@"klasljdklja",@"dwedjj",@"223424"]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

