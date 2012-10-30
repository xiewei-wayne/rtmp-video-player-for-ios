//
//  ELStreamingViewController.m
//  rtmp_player
//
//  Created by 谢 伟 on 12-10-16.
//
//

#import "ELStreamingViewController.h"
#import <FFEngine/FFEngine.h>

@interface ELStreamingViewController ()

@end

@implementation ELStreamingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(appBecomeActive)
                                                 name: UIApplicationDidBecomeActiveNotification object:nil];
    
    
	[[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(appResignActive)
                                                 name: UIApplicationWillResignActiveNotification object:nil];
    
    [self initSDK];
    [self startPlaying];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
}

//!----------------------------------------------------------------------------------

-(void)initSDK
{
    id<IELMediaPlayer> player = loadELMediaPlayer();
    
    [player setDelegate: self];
    [player setAutoPlayAfterOpen: YES];
    [player setVideoContainerView: self.playerAreaView];
    [player setPlayerScreenType:ELScreenType_ASPECT_FULL_SCR];
}

-(void) startPlaying
{
    id<IELMediaPlayer> player = loadELMediaPlayer();
    
    if( [player openMedia: self.videoUrl] )
    {
        self.statusLabel.text = @"Opening";
    }
}

-(void) stopPlaying
{
    id<IELMediaPlayer> player = loadELMediaPlayer();
    [player setDelegate: nil];
    [player stopPlay];
}

-(void) removeNotification
{
    [[NSNotificationCenter defaultCenter] removeObserver: self];
}

//!----------------------------------------------------------------------------------

- (void)openFailed
{
    UIAlertView *alertView = [[[UIAlertView alloc] initWithTitle: nil
                                                         message: @"Open Error!"
                                                        delegate: nil
                                               cancelButtonTitle: @"Close"
                                               otherButtonTitles: nil] autorelease];
    [alertView show];
}

- (void)readyToPlay
{
    NSLog(@"%s %d", __FUNCTION__, __LINE__);
    
    self.statusLabel.text = @"Ready";
}

// player -> UI
- (void)mediaWidth: (size_t) width height: (size_t) height
{
    NSLog(@"%s %d, width: %ld, height: %ld", __FUNCTION__, __LINE__, width, height);
}

// 本地缓冲很快,本地不送,网络送
- (void)bufferPercent:(int)percentage
{
    self.statusLabel.text = [NSString stringWithFormat: @"%d%%", percentage];
}

// 总长度
- (void)mediaDuration:(size_t)duration
{
    NSLog(@"%s %d", __FUNCTION__, __LINE__);
}

// player -> UI
// 当前进度
- (void)mediaPosition:(size_t)position
{
    self.statusLabel.text = [NSString stringWithFormat: @" %lu", position / 1000];
}

//!----------------------------------------------------------------------------------

-(IBAction) closeAction: (id) sender
{
    [self stopPlaying];

    [self removeNotification];

    [self dismissModalViewControllerAnimated: YES];
}

- (void)appBecomeActive
{
    [self closeAction: nil];
}

-(void)appResignActive
{
    [self stopPlaying];
}

//!----------------------------------------------------------------------------------

@end
