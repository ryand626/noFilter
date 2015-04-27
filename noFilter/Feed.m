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
    banner = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, [Styles AppWidth], [Styles headerHeight])];
    [banner setText:@"~noFilter"];
    banner.textAlignment = NSTextAlignmentCenter;
    banner.font = [UIFont systemFontOfSize:16];
    banner.backgroundColor = [UIColor blueColor];
    [self.view addSubview:banner];
    
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
    
    [self.view setBackgroundColor:[Styles backgroundColor]];
    [self createButtons];
    [self populateFeed];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

-(void)createButtons{
    logout = [[UIButton alloc]initWithFrame:CGRectMake([Styles AppWidth]-[Styles buttonWidth], [Styles headerHeight]-[Styles buttonHeight], [Styles buttonWidth], [Styles buttonHeight])];
    [logout addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [logout setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:logout];
}

-(void)populateFeed{
    PostTable = [[UIScrollView alloc] initWithFrame: CGRectMake(0, [Styles headerHeight], [Styles feedWidth], [Styles AppHeight]-[Styles headerHeight])];
    
    float offset = [Styles postSpacing];
    
    for (int i = 0; i < posts.count;i++) {
        [posts[i] offsetBy:offset];
        [PostTable addSubview:posts[i]];
        offset += [posts[i] frame].size.height + [Styles postSpacing];
    }

    [PostTable setBackgroundColor:[UIColor magentaColor]];
    PostTable.contentSize=CGSizeMake(PostTable.frame.size.width,offset + [Styles postSpacing]);
    [self.view addSubview:PostTable];
}

-(void) buttonClicked:(UIButton*)sender
{
    // Switch views
    if (sender == logout){
        UIViewController * vc = [[LogIn alloc] init];
        [self presentViewController:vc animated:YES completion:nil];
    }
}

@end
