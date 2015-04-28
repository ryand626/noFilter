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
    
    if ([Styles AppHeight] == 0) {
        [Styles setScreenHeight:[self.view bounds].size.height];
    }
    if ([Styles AppWidth] == 0) {
        [Styles setScreenWidth:[self.view bounds].size.width];
    }
    UIView* backgroundView = [[UIView alloc]initWithFrame:CGRectMake([Styles AppWidth]*.1, [Styles AppHeight]*.1, [Styles AppWidth]*.8, [Styles AppHeight]*.8)];
    [backgroundView setBackgroundColor:[Styles loginBackgroundColor]];
    [self.view addSubview:backgroundView];

    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg.jpg"]];
    background.contentMode = UIViewContentModeScaleAspectFill;
    background.frame = self.view.frame;
    
    [self.view addSubview:background];
    [self.view sendSubviewToBack:background];
    
    nameLabel = [[UILabel alloc]initWithFrame:CGRectMake([Styles AppWidth]*[Styles loginContentOffset], [Styles AppHeight]*[Styles loginContentOffset], [Styles AppWidth]*.8, [Styles loginFormHeight])];
    nameLabel.text = @"Username";
    passwordLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:nameLabel];
 
    userName = [[UITextField alloc]initWithFrame:CGRectMake([Styles AppWidth]*[Styles loginContentOffset], [Styles AppHeight]*[Styles loginContentOffset]+[Styles loginFormHeight], [Styles AppWidth]*.6, [Styles loginFormHeight])];
    [userName setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:userName];
    
    passwordLabel = [[UILabel alloc]initWithFrame:CGRectMake([Styles AppWidth]*[Styles loginContentOffset], [Styles AppHeight]*[Styles loginContentOffset]+[Styles loginFormHeight]*2, [Styles AppWidth]*.8, [Styles loginFormHeight])];
    passwordLabel.text = @"Password";
    passwordLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:passwordLabel];
    


    password = [[UITextField alloc]initWithFrame:CGRectMake([Styles AppWidth]*[Styles loginContentOffset], [Styles AppHeight]*[Styles loginContentOffset]+[Styles loginFormHeight]*3, [Styles AppWidth]*.6, [Styles loginFormHeight])];
    [password setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:password];
    
    login = [self createButton:login withTitle:@"Log In"];
    login.frame = CGRectMake(backgroundView.frame.origin.x+backgroundView.frame.size.width-login.frame.size.width-[Styles AppWidth]*[Styles loginContentOffset]/2, backgroundView.frame.origin.y+backgroundView.frame.size.height-login.frame.size.height-[Styles AppWidth]*[Styles loginContentOffset]/2, login.frame.size.width, login.frame.size.height);
    
    signup = [self createButton:signup withTitle:@"Sign Up"];
    signup.frame = CGRectMake(backgroundView.frame.origin.x+[Styles AppWidth]*[Styles loginContentOffset]/2, backgroundView.frame.origin.y+backgroundView.frame.size.height-signup.frame.size.height-[Styles AppWidth]*[Styles loginContentOffset]/2, signup.frame.size.width, signup.frame.size.height);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadResources{
    
}

-(UIButton*)createButton:(UIButton*)Button withTitle:(NSString*)title{
    // Log in Button

    Button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, [Styles buttonWidth], [Styles buttonHeight])];
    [Button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [Button setBackgroundColor:[Styles buttonColor]];
    [Button setTitle:title forState:UIControlStateNormal];
    [Button setTitleColor:[Styles buttonFontColor] forState:UIControlStateNormal];
    [Button sizeToFit];
    Button.layer.cornerRadius=[Styles buttonRound]/2;
    CGRect frame = Button.frame;
    frame.size.width = frame.size.width*[Styles buttonPadding];
    Button.frame = frame;
    Button.clipsToBounds = YES;
    [self.view addSubview:Button];

    NSLog(@"Button %@", Button);
    return Button;
}

-(void) buttonClicked:(UIButton*)sender
{
    NSLog(@"Sender: %@",sender);
    NSLog(@"login: %@",login);
    // Switch views
    if (sender == login){
        UIViewController * vc = [[Feed alloc] init];
        [self presentViewController:vc animated:YES completion:nil];
    }
}
@end
