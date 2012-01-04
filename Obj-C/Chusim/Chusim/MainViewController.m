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
    line1.text = [[self pickFromArray:line1array]uppercaseString];
    line1.textColor = [UIColor cyanColor];
    
    line2.text = [[NSString stringWithFormat:@"%d,000,000,000 %@", rand() %1000,[self pickFromArray:line2array]]uppercaseString];
    line2.textColor = [UIColor whiteColor];
    
    line3.text = [[NSString stringWithFormat:@"%@ %@", [self chuism], [self pickFromArray:line3array]]uppercaseString];
    line3.textColor = [UIColor greenColor];
    
    

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
        

    [self buildLines];
        

/*  NSArray *lines = [NSArray arrayWithObjects:line1array,line2array,line3array,line4array,line5array,line6array,line7array,nil];
*/
                          
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
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
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
}

- (IBAction)showInfo:(id)sender
{    
    FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideViewController" bundle:nil];
    controller.delegate = self;
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:controller animated:YES];
}

@end
