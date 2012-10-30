//
//  ELUtils.m
//  ELPlayer
//
//  Created by Steven Jobs on 12-2-25.
//  Copyright (c) 2012年 www.ffsdk.com. All rights reserved.
//

#import "ELUtils.h"

@implementation ELUtils

+(NSString *) documentsPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [paths objectAtIndex:0];
    
    return documentPath;
}

@end
