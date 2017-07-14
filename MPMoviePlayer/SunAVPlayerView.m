//
//  SunAVPlayerView.m
//  MPMoviePlayer
//
//  Created by 聚艺互动 on 2017/5/16.
//  Copyright © 2017年 聚艺互动. All rights reserved.
//

#import "SunAVPlayerView.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

@implementation SunAVPlayerView

{
    AVPlayer *_player;
    NSString     *_urlString;
    AVAudioSession              *_session;

}

-(id)initWithFrame:(CGRect)frame url:(NSString *)url
{
    self = [super initWithFrame:frame];
    
    _urlString = url;
    if (self) {
        
        _session = [AVAudioSession sharedInstance];
        [_session setCategory:AVAudioSessionCategoryPlayback error:nil];
        
        // 1.获取URL(远程/本地)
        NSURL *url = [NSURL URLWithString:_urlString];
        
        // 2.创建AVPlayerItem
        AVPlayerItem *item = [AVPlayerItem playerItemWithURL:url];
        
        // 3.创建AVPlayer
        AVPlayer *player = [AVPlayer playerWithPlayerItem:item];
        
        // 4.添加AVPlayerLayer
        AVPlayerLayer *layer = [AVPlayerLayer playerLayerWithPlayer:player];
        layer.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        [self.layer addSublayer:layer];

    }
    
    return self;
}

- (void)play {
    
    [_player play];
 }

- (void)pause
{
    [_player pause];
}
@end
