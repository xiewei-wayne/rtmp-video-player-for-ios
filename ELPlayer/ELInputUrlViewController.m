//
//  ELInputUrlViewController.m
//  rtmp_player
//
//  Created by 谢 伟 on 12-10-16.
//
//

#import "ELInputUrlViewController.h"
#import "ELStreamingViewController.h"

@interface ELInputUrlViewController ()

@end

@implementation ELInputUrlViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) playRTMP
{
    ELStreamingViewController *streamingViewController = [[[ELStreamingViewController alloc] init] autorelease];

    NSString *urlString = self.urlTextField.text;
    
    if (urlString.length <= 0)
    {
        urlString = self.urlTextField.placeholder;
    }

    streamingViewController.videoUrl = urlString;

    [self presentModalViewController: streamingViewController animated: YES];
}

-(IBAction) playAction:(id)sender
{
    if (_urlTextField.text.length <= 0)
    {
        UIAlertView *alertView = [[[UIAlertView alloc] initWithTitle: nil
                                                            message: @"Please input RTMP video streaming url! Will play with demo url."
                                                           delegate: self
                                                  cancelButtonTitle: @"OK"
                                                  otherButtonTitles: nil] autorelease];
        
        [alertView show];
    }
    else
    {
        [self playRTMP];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self playRTMP];
}

-(IBAction) gotoUrlAction:(id)sender
{
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString: @"http://www.ffsdk.com"]];
}

-(IBAction) resignKeyboard:(id)sender
{
    [self.urlTextField resignFirstResponder];
}

@end
