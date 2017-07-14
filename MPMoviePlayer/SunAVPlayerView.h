//
//  SunAVPlayerView.h
//  MPMoviePlayer
//
//  Created by 聚艺互动 on 2017/5/16.
//  Copyright © 2017年 聚艺互动. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SunAVPlayerView : UIView

-(id)initWithFrame:(CGRect)frame url:(NSString *)url;
- (void)play;
- (void)pause;

@end
