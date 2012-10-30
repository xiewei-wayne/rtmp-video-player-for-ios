//
//  Created by xiewei.max@gmail.com on 11-10-01.
//  Copyright (c) 2012年 www.e-linkway.com. All rights reserved.
//

#import <UIKit/UIKit.h>

#ifndef IELMeidaPlayer_H
#define IELMeidaPlayer_H

typedef enum ELScreenType_e
{
    ELScreenType_ASPECT_FULL_SCR = 0,
    ELScreenType_FULL_SCR,    
    ELScreenType_ORIGINAL_SCR    
}ELScreenType_e;


@protocol ELPlayerMessageProtocol;

@protocol IELMediaPlayer <NSObject>

@property (nonatomic, assign) BOOL shouldUpdateVideoPicture;    // default: YES

-(void) setDelegate:(id<ELPlayerMessageProtocol>)delegate;

- (void)setVideoContainerView:(UIView *)containerView;
- (void)setPlayerScreenType:(ELScreenType_e ) screenType;
- (void)refreshViewFrame;

- (void)setAutoPlayAfterOpen:(BOOL) autoPlay; 

- (BOOL)openMedia:(NSString *)path;
- (BOOL)openMedia:(NSString *)path seekTo:(size_t)time;

- (BOOL)closeMedia;

- (void)startPlay;
- (void)stopPlay;

- (void)pausePlay;
- (void)resumePlay;

- (size_t)seekTo:(size_t)pos;

@end

@protocol ELPlayerMessageProtocol <NSObject>

@optional

- (void)openOk;
- (void)openFailed;

- (void)bufferingStart;
- (void)bufferPercent:(int)percentage;

- (void)readyToPlay;

- (void)mediaDuration:(size_t)duration;
- (void)mediaPosition:(size_t)position;
- (void)mediaWidth: (size_t) width height: (size_t) height;

- (void)playToEnd;

@end

#endif

