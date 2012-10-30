//
//  ELStreamingViewController.h
//  rtmp_player
//
//  Created by 谢 伟 on 12-10-16.
//
//

#import <UIKit/UIKit.h>
#import <FFEngine/FFEngine.h>

@interface ELStreamingViewController : UIViewController <ELPlayerMessageProtocol>

@property (nonatomic, retain) NSString *videoUrl;

@property (nonatomic, retain) IBOutlet UIView *playerAreaView;

@property (nonatomic, retain) IBOutlet UILabel *statusLabel;

@end
