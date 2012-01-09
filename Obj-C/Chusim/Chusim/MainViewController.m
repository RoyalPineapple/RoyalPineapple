//
//  MainViewController.m
//  Chusim
//
//  Created by Alex Odawa on 1/3/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController
@synthesize line1;
@synthesize line2;
@synthesize line3;
@synthesize line4;
@synthesize line5;
@synthesize line6;
@synthesize line7;


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - Chu Code



- (NSString *)chuism{
    NSArray *prefix = [NSArray arrayWithObjects: @"ves", @"whu", @"add", @"psy", @"ces", @"shax", @"kex", @"jre", @"za", @"jux", @"guts", @"xox", @"kas", @"tha", @"wis", @"kis", @"gus", nil];
    NSArray *fix = [NSArray arrayWithObjects: @"for", @"tro", @"cro", @"jro", @"to", @"go", @"ta", @"pro", @"phro", @"tro", @"gro", nil];
    NSArray *midfix = [NSArray arrayWithObjects: @"dren", @"gren", @"ken", @"zen", @"jn", @"stren", @"gron", @"sen", @"xen", @"not", @"cen", @"ven" @"bren", nil];
    NSArray *suffix  = [NSArray arrayWithObjects: @"ikul", @"ical", @"icul", @"ikol", @"ikel", @"etul", @"ikal", nil];
  
    return [NSString stringWithFormat:@"%@%@%@%@",[self pickFromArray:prefix],[self pickFromArray:fix],[self pickFromArray:midfix],[self pickFromArray:suffix]];
}

- (id)pickFromArray:(NSArray *)array{
    NSUInteger row = arc4random() % ([array count]);
    return [array objectAtIndex:row];
}


- (void)buildLines{
//1
    line1.text = [[self pickFromArray:line1array]uppercaseString];
    line1.textColor = [UIColor cyanColor];
//1    
    line2.text = [[NSString stringWithFormat:@"%d,000,000,000 %@", rand() %1000,[self pickFromArray:line2array]]uppercaseString];
    line2.textColor = [UIColor whiteColor];

//3    
    line3.text = [[NSString stringWithFormat:@"%@ %@", [self chuism], [self pickFromArray:line3array]]uppercaseString];
    line3.textColor = [UIColor greenColor];

//4    
    line4.text = [[NSString stringWithFormat:@"%@ : %@ %@",[self pickFromArray:line4array],[self chuism], [self pickFromArray:line4brray]]uppercaseString];
    int line4color = arc4random() % 3;
    if(line4color == 0)line4.textColor = [UIColor redColor]; 
    if(line4color == 1)line4.textColor = [UIColor cyanColor]; 
    if(line4color == 2)line4.textColor = [UIColor magentaColor]; 

//5
    line5.text = [[self chuism]uppercaseString];
    line5.textColor = [UIColor whiteColor];

//6 
    int line6display = arc4random() % 3;
    int line6color = arc4random() % 3;
    if(line6display == 0){
    line6.text = [[NSString stringWithFormat:@"%@ %@",
                  [self pickFromArray:line6array], [self pickFromArray:line6brray]]uppercaseString];
    }
    if(line6display == 1){
        line6.text = [[NSString stringWithFormat:@"%@ %@",
                       [self pickFromArray:line6brray], [self pickFromArray:line6array]]uppercaseString];
    }
    if(line6display == 2){
        line6.text = [[self pickFromArray:line6array]uppercaseString];   
    }
    if(line6color == 0)line6.textColor = [UIColor redColor]; 
    if(line6color == 1)line6.textColor = [UIColor blueColor]; 
    if(line6color == 2)line6.textColor = [UIColor greenColor];

//7
    line7.text = [[self pickFromArray:line7array]uppercaseString];
    line7.textColor = [UIColor whiteColor];
    
   


}
#pragma Animations
- (void)centerLabel:(UILabel *)sender{
    CGFloat from = sender.center.x;
    sender.center = CGPointMake(from, sender.center.y);
}


//Shakes the text field saying no
- (void)shakeLabel:(UILabel *)sender
         forLength:(double)length {
    UIView *senderView = (UIView*)sender;
    CABasicAnimation *shakeyAnimation =[CABasicAnimation animationWithKeyPath:@"position"];
    CFTimeInterval time = length;
    shakeyAnimation.duration = time;
    shakeyAnimation.repeatCount = 2;
    shakeyAnimation.autoreverses = YES;
    CGFloat from = sender.center.x;
    CGFloat to = from;
    from = from - 10;
    to = to + 10;
    shakeyAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(from, sender.center.y)];
    shakeyAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(to, sender.center.y)];
    shakeyAnimation.delegate = self;
    
    [senderView.layer addAnimation:shakeyAnimation forKey:@"animateLayer"];
    
}


#pragma mark - Shaking Support
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    if (event.subtype == UIEventSubtypeMotionShake){
        for(UILabel *line in lines){
            [self shakeLabel:line forLength:0.05];
        }
        [self buildLines];
    }
    
    if ([super respondsToSelector:@selector(motionEnded:withEvent:)]) {
        [super motionEnded:motion withEvent:event];
    }
}

- (BOOL)canBecomeFirstResponder{
    return YES;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //setup the word banks
    line1array = [NSArray arrayWithObjects:@"phillips", @"crawley", @"williamsburg", @"plymouth", @"hilgendorf", @"telford", @"dudley", @"cameron", @"cleverley", @"harrington", @"elmsford", @"waldman", nil];
    
    line2array = [NSArray arrayWithObjects:@"galaxies",@"populations",@"galaxies", nil];
    
    line3array = [NSArray arrayWithObjects: @"incarnations", @"octogenarian", @"adversity", @"dissensions", @"ergonomics", @"obsessions", @"forclosures", @"exhibitions", nil];
    
    line4array = [NSArray arrayWithObjects: @"BBC", @"ABC", @"CNN", @"NBC", @"CBS", @"PBS", @"20/20", @"FOX", @"global", nil];
    line4brray = [NSArray arrayWithObjects: @"podcasts", @"coverage", @"netcasts", @"broadcasts", @"content", @"spaceports", @"civilians", @"", nil];
    
    line5array = [NSArray arrayWithObject:@""];
    
    line6array = [NSArray arrayWithObjects:@"apertures",  @"lucritive", @"miniscule", @"epitomized", @"statutory", @"nascent", @"parochial", nil];
    line6brray = [NSArray arrayWithObjects:@"ultracompacts", @"partisans", @"admonishments", @"incentives", @"syncing",@"reticence", @"astro-physicists", @"libertarians", nil];
    
    line7array = [NSArray arrayWithObjects: @"awetrocenial", @"moratoriums", @"stratospherical",  @"agrithenical", @"tetrafluoride", @"apologetics", @"astrocenial", @"pedophiles", @"biostatisticians", @"epitomes", nil];
    
    lines = [NSArray arrayWithObjects:line1, line2, line3, line4, line5, line6, line7, nil];
    
    //shake everything really quickly to get it lined up pretty
    for(UILabel *line in lines){
        [self shakeLabel:line forLength:.0001];
    }
    
    [self buildLines];
}



- (void)viewDidUnload
{
    [self setLine1:nil];
    [self setLine2:nil];
    [self setLine3:nil];
    [self setLine4:nil];
    [self setLine5:nil];
    [self setLine6:nil];
  
    
    [self setLine7:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self becomeFirstResponder];
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self resignFirstResponder];
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    [self dismissModalViewControllerAnimated:YES];
    //[self buildLines];
}

- (IBAction)showInfo:(id)sender
{    
    FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideViewController" bundle:nil];
    controller.delegate = self;
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:controller animated:YES];
}

@end
