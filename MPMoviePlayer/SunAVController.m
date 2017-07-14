//
//  SunAVController.m
//  MPMoviePlayer
//
//  Created by 聚艺互动 on 2017/5/16.
//  Copyright © 2017年 聚艺互动. All rights reserved.
//

#import "SunAVController.h"

#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>


@interface SunAVController () <AVPlayerViewControllerDelegate>


@end

@implementation SunAVController
{
    AVPlayerViewController      *_playerController;
    NSString     *_urlString;
    AVAudioSession              *_session;

}

- (id)initWithUrl:(NSString *)url
{
    self = [super init];
    if (self) {
        _urlString = url;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    _session = [AVAudioSession sharedInstance];
    [_session setCategory:AVAudioSessionCategoryPlayback error:nil];

    // 1.获取URL(远程/本地)
    _playerController = [[AVPlayerViewController alloc]init];
    _playerController.player = [[AVPlayer alloc]initWithURL:[NSURL URLWithString:_urlString]];
    _playerController.videoGravity = AVLayerVideoGravityResizeAspect;
    _playerController.delegate = self;
    _playerController.allowsPictureInPicturePlayback = true;    //画中画，iPad可用
    _playerController.showsPlaybackControls = true;
    
    [self addChildViewController:_playerController];
    _playerController.view.frame = self.view.bounds;
    [self.view addSubview:_playerController.view];

    [_playerController.player play];  //自动播放
}


#pragma mark - AVPlayerViewControllerDelegate
- (void)playerViewControllerWillStartPictureInPicture:(AVPlayerViewController *)playerViewController {
    NSLog(@"%s", __FUNCTION__);
}

- (void)playerViewControllerDidStartPictureInPicture:(AVPlayerViewController *)playerViewController {
    NSLog(@"%s", __FUNCTION__);
}

- (void)playerViewController:(AVPlayerViewController *)playerViewController failedToStartPictureInPictureWithError:(NSError *)error {
    NSLog(@"%s", __FUNCTION__);
}

- (void)playerViewControllerWillStopPictureInPicture:(AVPlayerViewController *)playerViewController {
    NSLog(@"%s", __FUNCTION__);
}

- (void)playerViewControllerDidStopPictureInPicture:(AVPlayerViewController *)playerViewController {
    NSLog(@"%s", __FUNCTION__);
}

- (BOOL)playerViewControllerShouldAutomaticallyDismissAtPictureInPictureStart:(AVPlayerViewController *)playerViewController {
    NSLog(@"%s", __FUNCTION__);
    return true;
}

- (void)playerViewController:(AVPlayerViewController *)playerViewController restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(void (^)(BOOL))completionHandler {
    NSLog(@"%s", __FUNCTION__);
}

 


@end
