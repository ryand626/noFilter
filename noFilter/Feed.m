//
//  Feed.m
//  noFilter
//
//  Created by Ryan Dougherty on 4/26/15.
//  Copyright (c) 2015 team17. All rights reserved.
//

#import "Feed.h"
#import "LogIn.h"
#import "Post.h"

@interface Feed ()

@end

@implementation Feed

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg.jpg"]];
    background.contentMode = UIViewContentModeScaleAspectFill;
    background.frame = self.view.frame;
    
    [self.view addSubview:background];
    [self.view sendSubviewToBack:background];
    
    
    // Create Banner
    banner = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, [Styles AppWidth], [Styles headerHeight])];
    [banner setText:@"~noFilter"];
    [banner setTextColor:[Styles bannerTextColor]];
    banner.textAlignment = NSTextAlignmentCenter;
    banner.font = [UIFont systemFontOfSize:16];
    banner.backgroundColor = [Styles mainColor];
    [self.view addSubview:banner];
    

    
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

    postCreator = [[UIView alloc]initWithFrame:CGRectMake([Styles AppWidth]/2-[Styles postWidth]/2, [Styles postSpacing], [Styles postWidth], [Styles postMakerHeight])];
    postCreator.layer.cornerRadius=[Styles textRound];
    postCreator.clipsToBounds = YES;
    [postCreator setBackgroundColor:[Styles mainColor]];
    [PostTable addSubview:postCreator];
    
    [self populateFeed]; // Fill in the Feed
    

    // Set the background color
    [self.view setBackgroundColor:[Styles backgroundColor]];
    [self attachSubController];
}

-(void)attachSubController{
    UIPostMaker = [[PostMaker  alloc] init];
    [self addChildViewController:UIPostMaker];
    [UIPostMaker didMoveToParentViewController:self];
    [postCreator addSubview:UIPostMaker.view];
    UIPostMaker->posts = posts;
    [UIPostMaker->makePost addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)populateFeed{
    float offset = [Styles postSpacing] * 2 + [Styles postMakerHeight];
    
    for (int i = 0; i < posts.count;i++) {
        Post* post = posts[i];
        [posts[i] offsetBy:offset];
        if (![[PostTable subviews] containsObject:posts[i]]) {
            [PostTable addSubview:posts[i]];
            [post->userImage addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
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
    [logout setTitle:@"Log Out" forState:UIControlStateNormal];
    [logout sizeToFit];
    [logout setFrame:CGRectMake([Styles AppWidth]-logout.frame.size.width, [Styles headerHeight]-logout.frame.size.height, logout.frame.size.width, logout.frame.size.height)];
    [self.view addSubview:logout];
}

-(void) buttonClicked:(UIButton*)sender{
    // Switch views
    if (sender == logout){
        UIViewController * vc = [[LogIn alloc] init];
        [self presentViewController:vc animated:YES completion:nil];
    }
    if(sender == UIPostMaker->makePost){
        if(UIPostMaker->newPost != nil){
            [self populateFeed];
            UIPostMaker->newPost = nil;
        }
    }else{
        UIViewController * vc = [[Profile alloc] init];
        [self presentViewController:vc animated:YES completion:nil];
    }
}


@end
