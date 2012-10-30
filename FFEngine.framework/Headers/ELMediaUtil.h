//
//  ELMediaUtil.h
//  ELMediaLib
//
//  Created by Wei Xie on 12-7-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

// Advanced Version
@interface ELMediaUtil : NSObject // <IELMediaUtil>

+(NSDictionary *) getMediaDescription: (NSString *) mediaPath;

+(NSData *) thumbnailPNGDataWithVideoPath: (NSString *) videoPath;

@end
