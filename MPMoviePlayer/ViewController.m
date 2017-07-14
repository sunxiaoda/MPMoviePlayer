//
//  ViewController.m
//  MPMoviePlayer
//
//  Created by 聚艺互动 on 2017/5/16.
//  Copyright © 2017年 聚艺互动. All rights reserved.
//

#import "ViewController.h"
#import <UIKit/UIKit.h>
#import "UIView+Extension.h"
#import "SunAVPlayerView.h"
#import "SunAVController.h"

#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

#define KSCREENW [UIScreen mainScreen].bounds.size.width
#define KSCREENH [UIScreen mainScreen].bounds.size.height

#define VideoUrl @"https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"

@interface ViewController ()

@property (nonatomic, strong)AVPlayerViewController  *avPlayer;

@property (nonatomic, strong)SunAVPlayerView  *playerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"播放视频";
    self.view.backgroundColor = [UIColor whiteColor];
    
    //初始化视频播放器
    CGFloat palerViewW = KSCREENW - 40;
    _playerView = [[SunAVPlayerView alloc]initWithFrame:CGRectMake(20, 100,palerViewW, palerViewW * 9 / 16) url:VideoUrl];
    [self.view addSubview:_playerView];
//    _playerView.backgroundColor = [UIColor blackColor];

    UIButton *palyBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, CGRectGetMaxY(_playerView.frame) + 44, 150, 44)] ;
    palyBtn.centerX = KSCREENW * 0.5;
    [palyBtn setTitle:@"play" forState:UIControlStateNormal];
    [self.view addSubview:palyBtn];
    [palyBtn addTarget:self action:@selector(palyBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [palyBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];

    UIButton *palyBtn2 = [[UIButton alloc]initWithFrame:CGRectMake(100, CGRectGetMaxY(palyBtn.frame) + 44, 150, 44)] ;
    palyBtn2.centerX = palyBtn.centerX;
    [palyBtn2 setTitle:@"Go in Player" forState:UIControlStateNormal];
    [self.view addSubview:palyBtn2];
    [palyBtn2 addTarget:self action:@selector(palyBtn2Clicked) forControlEvents:UIControlEventTouchUpInside];
    [palyBtn2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    NSLog(@"test");
    NSLog(@"123213");
    NSLog(@"dffs ");

    
}


//1:AVPlayer

- (void)palyBtnClicked:(UIButton *)btn
{
    btn.selected = !btn.selected;
    
    if (btn.selected) {
        [btn setTitle:@"pause" forState:UIControlStateSelected];
        [_playerView play];
    }else
    {
        [btn setTitle:@"play" forState:UIControlStateNormal];
        [_playerView pause];
    }
    
}


//AVPlayerViewController

- (void)palyBtn2Clicked
{
    
    SunAVController *av = [[SunAVController alloc]initWithUrl:VideoUrl];
    [self presentViewController:av animated:YES completion:nil];
}



@end
