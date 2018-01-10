//
//  LZProductDetails.h
//  仿淘宝商品详情页
//
//  Created by 李真 on 2018/1/9.
//  Copyright © 2018年 李真. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZProductDetails : UIView<UIScrollViewDelegate>
@property (nonatomic, strong) void (^PlayVideoOptBlock)(BOOL isOK);
@property (nonatomic, strong) void (^scrollOptBlock)(NSInteger index);
@property (nonatomic,strong) UIScrollView * scrolV;
@property (nonatomic,strong) UIImageView *  videoCoverImgV;//视频封面
@property (nonatomic,strong) UILabel *  indexLab;//当前播放页数
@property (nonatomic,strong) UIButton *  playBtn;//播放按钮
@property (nonatomic,strong) UIButton *  ToVideoBtn;//切换到视频
@property (nonatomic,strong) UIButton *  ToPictureBtn;//切换到图片
@property (nonatomic,copy) NSArray * productDetailsArr;//包含图片或视频URL的数组
- (void)updateUIWithImageAndVideoArray:(NSArray *)detailsArr;
@end
