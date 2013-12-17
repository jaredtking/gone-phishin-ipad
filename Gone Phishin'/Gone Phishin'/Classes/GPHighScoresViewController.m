//
//  GPHighScoresViewController.m
//  Gone Phishing
//
//  Created by wolverine on 12/7/13.
//  Copyright (c) 2013 wolverine. All rights reserved.
//

#import "GPHighScoresViewController.h"

@implementation GPHighScoresViewController

@synthesize scoresLabel;
@synthesize scoresTableView;
@synthesize goHomeButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:BACKGROUND_COLOR];
    
    // grab core data context
    NSManagedObjectContext *context = [(GPAppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    
    // load scores
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Scores"
                                                  inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"score" ascending:NO];
    [request setSortDescriptors:[NSArray arrayWithObject:sort]];
    NSError *error;
    scores = [context executeFetchRequest:request error:&error];
    
    // instantiate UI elements here
    scoresLabel = [[UILabel alloc] init];
    scoresLabel.text = @"High Scores";
    scoresLabel.font = [UIFont fontWithName:MARKER_FONT size:30.0];
    scoresLabel.textColor = [UIColor whiteColor];
    scoresLabel.backgroundColor = [UIColor clearColor];
    scoresLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:scoresLabel];
    
    // scores table
    scoresTableView = [[UITableView alloc] init];
    scoresTableView.dataSource = self;
    scoresTableView.delegate = self;
    scoresTableView.backgroundView = nil;
    scoresTableView.backgroundColor = [UIColor clearColor];
    scoresTableView.separatorColor = [UIColor clearColor];
    [self.view addSubview:scoresTableView];
    
    // go home button
    goHomeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [goHomeButton setTitle:@"Return to Home" forState:UIControlStateNormal];
    goHomeButton.titleLabel.font =[UIFont fontWithName:DEFAULT_FONT size:24.0];
    [goHomeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [goHomeButton setBackgroundImage:BLUE_BUTTON_IMAGE forState:UIControlStateNormal];
    [goHomeButton addTarget:self action:@selector(goHomeButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goHomeButton];
}

- (void)viewDidUnload
{
    scoresLabel = nil;
    scoresTableView = nil;
    goHomeButton = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    // hide navigation bar
    [self.navigationController setNavigationBarHidden:YES animated:YES];

#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
#else
#endif
}

- (void)viewWillLayoutSubviews
{
    // position UI elements here
    scoresLabel.frame = CGRectMake((1024-300)/2, 150, 300, 44);
    scoresTableView.frame = CGRectMake((1024-500)/2, 200, 500, 300);
    goHomeButton.frame = CGRectMake((1024-500)/2, 600, 500, 44);
}

- (void)goHomeButtonPressed:(id)sender
{
    GPLandingViewController *landingVC = [[GPLandingViewController alloc] init];

    // push new view onto navigation stack
    [self.navigationController pushViewController:landingVC animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [scores count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        
        // style
        cell.backgroundColor = [UIColor clearColor];
        cell.userInteractionEnabled = NO;
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.textLabel.font = [UIFont fontWithName:DEFAULT_FONT size:17.0];
        cell.textLabel.enabled = YES;
        cell.detailTextLabel.textColor = BLUETEXT_COLOR;
        cell.detailTextLabel.font = [UIFont fontWithName:DEFAULT_FONT size:17.0];
        cell.detailTextLabel.enabled = YES;
    }
    

    NSManagedObject *score = [scores objectAtIndex:[indexPath row]];

    // name
    cell.textLabel.text = [score valueForKey:@"name"];
    
    // score
    NSNumber *score2 = [NSNumber numberWithDouble:[(NSNumber *)[score valueForKey:@"score"] doubleValue] * 100];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    formatter.maximumFractionDigits = 0;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@%@", [formatter stringFromNumber:score2], @"%"];
    
    return cell;
}

#pragma mark -
#pragma mark Table view delegate

@end
