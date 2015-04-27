//
//  LogIn.m
//  noFilter
//
//  Created by Ryan Dougherty on 4/26/15.
//  Copyright (c) 2015 team17. All rights reserved.
//

#import "LogIn.h"
#import "feed.h"

@interface LogIn ()

@end

@implementation LogIn

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[Styles backgroundColor]];
    [self createButtons];
    if ([Styles AppHeight] == 0) {
        [Styles setScreenHeight:[self.view bounds].size.height];
    }
    if ([Styles AppWidth] == 0) {
        [Styles setScreenWidth:[self.view bounds].size.width];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadResources{
    
}

-(void)createButtons{
    login = [[UIButton alloc]initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width/2, [[UIScreen mainScreen] bounds].size.height/2, [Styles buttonHeight], [Styles buttonWidth])];
    [login addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [login setBackgroundColor:[Styles buttonColor]];
    [self.view addSubview:login];
    
}

-(void) buttonClicked:(UIButton*)sender
{
    // Switch views
    if (sender == login){
        UIViewController * vc = [[Feed alloc] init];
        [self presentViewController:vc animated:YES completion:nil];
    }
}
@end
