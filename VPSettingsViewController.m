//
//  VPSettingsViewController.m
//  VPTipster
//
//  Created by Vishy Poosala on 10/8/14.
//  Copyright (c) 2014 Vi Po. All rights reserved.
//

#import "VPSettingsViewController.h"

@interface VPSettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipControl;

@end

@implementation VPSettingsViewController

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
    [self loadDefaultTip];
    // Do any additional setup after loading the view from its nib.
}

- (void) loadDefaultTip {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int defaultTipIndex = [defaults integerForKey:@"defaultTipIndex"];
    [self.defaultTipControl setSelectedSegmentIndex:defaultTipIndex];
}
-(void) viewDidAppear:(BOOL)animated {
    [self loadDefaultTip];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)saveDefaults:(id)sender {
    NSLog(@"Saving defaults %d", self.defaultTipControl.selectedSegmentIndex);
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.defaultTipControl.selectedSegmentIndex
                  forKey:@"defaultTipIndex"];
    [defaults synchronize];
}

@end
