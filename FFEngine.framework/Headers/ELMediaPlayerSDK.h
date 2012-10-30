//
//  Created by xiewei.max@gmail.com on 11-10-01.
//  Copyright (c) 2012年 www.e-linkway.com. All rights reserved.
//

#import "IELMediaPlayer.h"

@protocol IELMediaPlayer;

// 注册lib库,在调用任何其他操作前调用 : 0: 成功; 1:注册码错误; 
int registerLib(char * registerCode);

// 获取MediaPlayer接口
id<IELMediaPlayer> loadELMediaPlayer();

// 释放mediaPlayer, 调用loadELMediaPlayer之后释放
void releaseELMediaPlayer();
