//
//  MainViewController.h
//  Chusim
//
//  Created by Alex Odawa on 1/3/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "FlipsideViewController.h"
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


@interface MainViewController : UIViewController <FlipsideViewControllerDelegate> {
    UILabel *line1;
    UILabel *line2;
    UILabel *line3;
    UILabel *line4;
    UILabel *line5;
    UILabel *line6;
    UILabel *line7;
    
    NSArray *line1array;
    NSArray *line2array;
    NSArray *line3array;
    NSArray *line4array;
    NSArray *line4brray;
    NSArray *line5array;
    NSArray *line6array;
    NSArray *line6brray;
    NSArray *line7array;
    NSArray *lines;


}


- (IBAction)showInfo:(id)sender;
@property (nonatomic, strong) IBOutlet UILabel *line1;
@property (nonatomic, strong) IBOutlet UILabel *line2;
@property (nonatomic, strong) IBOutlet UILabel *line3;
@property (nonatomic, strong) IBOutlet UILabel *line4;
@property (nonatomic, strong) IBOutlet UILabel *line5;
@property (nonatomic, strong) IBOutlet UILabel *line6;
@property (nonatomic, strong) IBOutlet UILabel *line7;

- (NSString *)chuism;
- (id)pickFromArray:(NSArray *)array;
- (void)buildLines;
- (void)shakeLabel:(UILabel *)sender
         forLength:(double)length;
- (void)centerLabel:(UILabel *)sender;
@end
