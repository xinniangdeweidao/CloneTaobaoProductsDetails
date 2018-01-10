//
//  LZProductDetails.m
//  仿淘宝商品详情页
//
//  Created by 李真 on 2018/1/9.
//  Copyright © 2018年 李真. All rights reserved.
//

#import "LZProductDetails.h"

@implementation LZProductDetails
- (NSArray *)productDetailsArr{
    if (!_productDetailsArr) {
        _productDetailsArr = [NSArray array];
        
    }
    return _productDetailsArr;
}
- (UIButton *)playBtn{
    if (!_playBtn) {
        _playBtn = [[UIButton alloc]init];
        _playBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [_playBtn setImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
    }
    return _playBtn;
}
- (UILabel *)indexLab{
    if (!_indexLab) {
        _indexLab = [[UILabel alloc]init];
        _indexLab.textColor = [UIColor whiteColor];
        _indexLab.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.3];
        _indexLab.font = [UIFont systemFontOfSize:11];
        _indexLab.textAlignment = 1;
        _indexLab.layer.cornerRadius = 13;
        _indexLab.layer.masksToBounds = YES;
    }
    return _indexLab;
}
- (UIButton *)ToVideoBtn{
    if (!_ToVideoBtn) {
        _ToVideoBtn = [[UIButton alloc]init];
        [_ToVideoBtn setTitle:@"视频" forState:UIControlStateNormal];
        [_ToVideoBtn setTitle:@"视频" forState:UIControlStateSelected];
        [_ToVideoBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [_ToVideoBtn setBackgroundColor:[UIColor orangeColor]];
        _ToVideoBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [_ToVideoBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _ToVideoBtn.layer.cornerRadius = 13;
        _ToVideoBtn.layer.masksToBounds = YES;
    }
    return _ToVideoBtn;
}
- (UIButton *)ToPictureBtn{
    if (!_ToPictureBtn) {
        _ToPictureBtn = [[UIButton alloc]init];
        [_ToPictureBtn setTitle:@"图片" forState:UIControlStateNormal];
        [_ToPictureBtn setTitle:@"图片" forState:UIControlStateSelected];
        [_ToPictureBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
         [_ToPictureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        _ToPictureBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        _ToPictureBtn.backgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:0.5];
        _ToPictureBtn.layer.cornerRadius = 13;
        _ToPictureBtn.layer.masksToBounds = YES;
    }
    return _ToPictureBtn;
}

- (UIScrollView *)scrolV{
    if (!_scrolV) {
        _scrolV = [[UIScrollView alloc]init];
        _scrolV.pagingEnabled  = YES;
        _scrolV.showsVerticalScrollIndicator = NO;
        _scrolV.showsHorizontalScrollIndicator = NO;
    }
    return _scrolV;
}
- (UIImageView *)videoCoverImgV{
    if (!_videoCoverImgV) {
        _videoCoverImgV = [[UIImageView alloc]init];
          _videoCoverImgV.contentMode = UIViewContentModeScaleAspectFill;
         _videoCoverImgV.userInteractionEnabled = YES;
    }
    return _videoCoverImgV;
}
- (void)updateUIWithImageAndVideoArray:(NSArray *)detailsArr{
    self.productDetailsArr = detailsArr;
    self.scrolV.frame = CGRectMake(0, 0, self.frame.size.width, 300);
    self.scrolV.contentSize = CGSizeMake(detailsArr.count*self.frame.size.width, self.frame.size.height);
    self.scrolV.delegate  = self;
    self.scrolV.contentOffset = CGPointMake(0, 0);
    [self addSubview:self.scrolV];
    for (int i = 0; i < detailsArr.count; i ++) {
        
        if (i == 0) {
            self.videoCoverImgV.frame = CGRectMake(i*self.frame.size.width, 0, self.frame.size.width, self.frame.size.height);
            self.playBtn.frame = CGRectMake((self.frame.size.width - 60)/2.0, (self.frame.size.height - 60)/2.0, 60, 60);
            [self.playBtn addTarget:self action:@selector(playClick) forControlEvents:UIControlEventTouchUpInside];
            [self.videoCoverImgV addSubview:self.playBtn];
            self.videoCoverImgV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.JPG",i]];
            [self.scrolV addSubview:self.videoCoverImgV];
        }
        else{
            UIImageView * imgV = [[UIImageView alloc]initWithFrame:CGRectMake(i*self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)];
            imgV.contentMode = UIViewContentModeScaleAspectFill;
            imgV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.JPG",i]];
            [self.scrolV addSubview:imgV];
        }

   }
    if (detailsArr.count > 1) {
        //            添加“视频”、“图片”
        self.indexLab.frame = CGRectMake(self.frame.size.width - 40 - 20, self.frame.size.height - 25 - 20, 40, 25);
        self.indexLab.text = [NSString stringWithFormat:@"%d/%d",1,(int)detailsArr.count - 1];
        [self addSubview:self.indexLab];
        self.indexLab.hidden = YES;
        self.ToVideoBtn.frame = CGRectMake(self.center.x - 60-10, self.frame.size.height - 25 - 20, 60, 25);
        [self addSubview:self.ToVideoBtn];
        self.ToVideoBtn.selected = YES;
        self.ToPictureBtn.frame = CGRectMake(self.center.x + 10, self.frame.size.height - 25 - 20, 60, 25);
        [self addSubview:self.ToPictureBtn];
         self.ToPictureBtn.selected = NO;
        self.ToVideoBtn.tag = 10;
         self.ToPictureBtn.tag = 11;
        [self.ToVideoBtn addTarget:self action:@selector(changeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.ToPictureBtn addTarget:self action:@selector(changeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}
- (void)changeBtnClick:(UIButton *)btn{
    if (btn.tag == 10) {
//        视频
        self.ToVideoBtn.selected = YES;
        self.ToPictureBtn.selected = NO;
        self.ToVideoBtn.backgroundColor = [UIColor orangeColor];
        self.ToPictureBtn.backgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:0.5];
        NSLog(@"点击视频");
       
         if ([self.scrolV.delegate respondsToSelector:@selector(scrollViewDidEndDecelerating:)]) {
             
             [self.scrolV setContentOffset:CGPointMake(0, 0) animated:NO];
              [self scrollViewDidEndDecelerating:self.scrolV];
         }
        
    }
    else{
//        图片
        self.ToVideoBtn.selected = NO;
        self.ToPictureBtn.selected = YES;
        
        self.ToVideoBtn.backgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:0.5];
        self.ToPictureBtn.backgroundColor = [UIColor orangeColor];
         NSLog(@"点击图片");
        if (self.scrolV.contentOffset.x < self.frame.size.width) {
            if ([self.scrolV.delegate respondsToSelector:@selector(scrollViewDidEndDecelerating:)]) {
                [self.scrolV setContentOffset:CGPointMake(self.frame.size.width, 0) animated:NO];
                [self scrollViewDidEndDecelerating:self.scrolV];
            }
        }
       
    }
    return;
}
#pragma mark - scrollView的代理方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger index = scrollView.contentOffset.x/self.bounds.size.width;
    self.scrolV.contentOffset = CGPointMake(index*self.bounds.size.width, 0);
    if (self.scrolV.contentOffset.x < self.frame.size.width) {
        self.indexLab.hidden = YES;
        [self.scrolV setContentOffset:CGPointMake(0, 0) animated:NO];
        
    }
    else{
        self.indexLab.hidden = NO;
        self.scrolV.contentOffset = CGPointMake(scrollView.contentOffset.x/self.frame.size.width*self.frame.size.width, 0);
    }
     self.indexLab.text = [NSString stringWithFormat:@"%d/%d",(int)index,(int)self.productDetailsArr.count - 1];
    if (self.scrollOptBlock) {
        self.scrollOptBlock(index);
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.scrolV.contentOffset.x < self.frame.size.width) {
        //        处理“视频”按钮
        self.ToVideoBtn.selected = YES;
        self.ToPictureBtn.selected = NO;
        self.ToVideoBtn.backgroundColor = [UIColor orangeColor];
        self.ToPictureBtn.backgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:0.5];
    }
    else{
        
        //        处理“图片”按钮
        self.ToVideoBtn.selected = NO;
        self.ToPictureBtn.selected = YES;
        self.ToVideoBtn.backgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:0.5];
        self.ToPictureBtn.backgroundColor = [UIColor orangeColor];
        
    }
    
}
- (void)playClick{
    if (self.PlayVideoOptBlock) {
        self.PlayVideoOptBlock(YES);
    }
}
@end
