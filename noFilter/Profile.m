//
//  Profile.m
//  noFilter
//
//  Created by Ryan Dougherty on 4/28/15.
//  Copyright (c) 2015 team17. All rights reserved.
//

#import "Profile.h"

@interface Profile ()

@end

@implementation Profile

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg.jpg"]];
    background.contentMode = UIViewContentModeScaleAspectFill;
    background.frame = self.view.frame;
    
    [self.view addSubview:background];
    [self.view sendSubviewToBack:background];
    
    // Create Banner
    banner = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, [Styles AppWidth], [Styles headerHeight])];
    [banner setTitle:@"~noFilter" forState:UIControlStateNormal];
    banner.titleLabel.textAlignment = NSTextAlignmentCenter;
    banner.titleLabel.font = [UIFont systemFontOfSize:16];
    banner.backgroundColor = [Styles mainColor];
    [banner addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:banner];
    
    
    profilePicture = [[UIImageView alloc]initWithImage: [UIImage imageNamed:@"Fallout.jpg"]];
    profilePicture.frame = CGRectMake([Styles profilePicOffsetX], [Styles profilePicOffsetY], [Styles profilePicWidth], [Styles profilePicHeight]);
    profilePicture.contentMode = UIViewContentModeScaleAspectFill;
    profilePicture.layer.cornerRadius=[Styles profilePicWidth]/2;
    profilePicture.clipsToBounds = YES;

    
    userName = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    userName.text = @"Alexandria's Profile";
    [userName setTextColor:[UIColor whiteColor]];
    [userName sizeToFit];
    CGRect frame = userName.frame;
    frame.origin.x = [Styles AppWidth]/2 - userName.frame.size.width/2;
    frame.origin.y = [Styles profilePicOffsetY] + [Styles profilePicHeight];
    userName.frame = frame;

    
    
    
    
    // MANUALLY CREATING POST
    Post* post1 = [[Post alloc]initWithFrame:CGRectZero];
    [post1 setText:@"hi there one I am going to keep on talking and talking and talkin and talking wfasoidfjaksl;kfnsjlghjkl;s opiasdf;lkajsdf las;kjd fasl;dk fjaslkjdfk a;rghpvniljsbfdncviu;ilha nflvjneaej;dfh n"];
    [post1 setUser:1];
    [post1 addContent:[UIImage imageNamed:@"Fallout.jpg"]];
    [post1 addContent:[UIImage imageNamed:@"Fallout.jpg"]];
    [post1 addContent:[UIImage imageNamed:@"Fallout.jpg"]];
    
    Post* post2 = [[Post alloc]initWithFrame:CGRectZero];
    [post2 setText:@"hi there two"];
    [post2 setUser:2];
    
    
    Post* post3 = [[Post alloc]initWithFrame:CGRectZero];
    [post3 setText:@"hi there three"];
    [post3 setUser:3];
    
    posts = [NSMutableArray arrayWithObjects:post1,post2,post3, nil];
    // END OF MANUAL CREATION OF POSTS
    
    [self createButtons]; // Create the input buttons
    
    PostTable = [[UIScrollView alloc] initWithFrame: CGRectMake(0, [Styles headerHeight], [Styles feedWidth], [Styles AppHeight]-[Styles headerHeight])];
    [self.view addSubview:PostTable];
    
 
    [self populateFeed]; // Fill in the Feed
    
    
    // Set the background color
    [self.view setBackgroundColor:[Styles backgroundColor]];
    [PostTable addSubview:profilePicture];
    [PostTable addSubview:userName];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)populateFeed{
    float offset = [Styles postSpacing] + userName.frame.origin.y + userName.frame.size.height;
    
    for (int i = 0; i < posts.count;i++) {
        [posts[i] offsetBy:offset];
        if (![[PostTable subviews] containsObject:posts[i]]) {
            [PostTable addSubview:posts[i]];
        }
        offset += [posts[i] frame].size.height + [Styles postSpacing];
    }
    
    PostTable.contentSize=CGSizeMake(PostTable.frame.size.width,offset + [Styles postSpacing]);
}

-(void)addPostToFeed:(Post*)newPost{
    float offset = PostTable.contentSize.height;
    [newPost offsetBy:offset];
    [PostTable addSubview:newPost];
    offset += newPost.frame.size.height;
    PostTable.contentSize = CGSizeMake(PostTable.frame.size.width, offset+[Styles postSpacing] * 2);
}

-(void)createButtons{
    // Log out button
    logout = [[UIButton alloc]initWithFrame:CGRectMake([Styles AppWidth]-[Styles buttonWidth], [Styles headerHeight]-[Styles buttonHeight], [Styles buttonWidth], [Styles buttonHeight])];
    [logout addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [logout setBackgroundColor:[Styles buttonColor]];
    [self.view addSubview:logout];
}

-(void) buttonClicked:(UIButton*)sender{
    // Switch view to login page
    if (sender == logout){
        UIViewController * vc = [[LogIn alloc] init];
        [self presentViewController:vc animated:YES completion:nil];
    }
    // Switch view to the Feed page
    if (sender == banner){
        UIViewController * vc = [[Feed alloc] init];
        [self presentViewController:vc animated:YES completion:nil];
    }
}

@end
