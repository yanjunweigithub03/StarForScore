//
//  StarsForScoreView.m
//  美团
//
//  Created by lanou3g on 15/7/25.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "StarsForScoreView.h"

@interface StarsForScoreView ()

@property (nonatomic , strong) UIImageView *imageView_1;
@property (nonatomic , strong) UIImageView *imageView_2;
@property (nonatomic , strong) UIImageView *imageView_3;
@property (nonatomic , strong) UIImageView *imageView_4;
@property (nonatomic , strong) UIImageView *imageView_5;

@property (nonatomic , strong) NSMutableArray *imageArray;

@end

static StarsForScoreView *starView = nil;
@implementation StarsForScoreView

- (NSMutableArray *)imageArray
{
    if (!_imageArray) {
        _imageArray = [[NSMutableArray alloc] initWithObjects:_imageView_1,_imageView_2,_imageView_3,_imageView_4,_imageView_5, nil];
    }
    return _imageArray;
}

+ (instancetype)shareStarView
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        starView = [[StarsForScoreView alloc] init];
        [starView layoutView];
    });
    return starView;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self layoutView];
    }
    return self;
}

- (void)layoutView
{
    //CGFloat width = self.frame.size.height;
    for (int i = 0; i < 5; i ++) {
        self.imageArray[i] = [[UIImageView alloc] initWithFrame:CGRectMake(i * 15, 0, 15, 15)];
        [self addSubview:self.imageArray[i]];
    }
}

- (void)setupStarViewForScore:(float)score
{
    int num = (int)score;
    float L = score - num;
    
    if (L >= 0.3 && L <= 0.7) {
        
        for (int i = 0; i < num; i ++) {
            UIImageView *imageView = self.imageArray[i];
            imageView.image = [UIImage imageNamed:@"iconfont-xingxing"];
        }
        
        UIImageView *imageView = self.imageArray[num];
        imageView.image = [UIImage imageNamed:@"iconfont-pingfenxingxingbankesvg-1"];
        
        for (int i = num + 1; i < 5; i ++) {
            UIImageView *imageView = self.imageArray[i];
            imageView.image = [UIImage imageNamed:@"iconfont-xingxing-2"];
        }
       
    } else if (L < 0.3) {
        for (int i = 0; i < num; i ++) {
            UIImageView *imageView = self.imageArray[i];
            imageView.image = [UIImage imageNamed:@"iconfont-xingxing"];
        }
        
        for (int i = num; i < 5; i ++) {
            UIImageView *imageView = self.imageArray[i];
            imageView.image = [UIImage imageNamed:@"iconfont-xingxing-2"];
        }
    } else {
        for (int i = 0; i < num + 1; i ++) {
            UIImageView *imageView = self.imageArray[i];
            imageView.image = [UIImage imageNamed:@"iconfont-xingxing"];
        }
        
        for (int i = num + 1; i < 5; i ++) {
            UIImageView *imageView = self.imageArray[i];
            imageView.image = [UIImage imageNamed:@"iconfont-xingxing-2"];
        }
    }
   
}

@end
