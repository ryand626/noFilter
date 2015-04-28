//
//  Profile.h
//  noFilter
//
//  Created by Ryan Dougherty on 4/28/15.
//  Copyright (c) 2015 team17. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Styles.h"
#import "Post.h"
#import "LogIn.h"

@interface Profile : UIViewController{
    UIButton* logout;
    UIButton* banner;
    UIScrollView* PostTable;
    NSMutableArray* posts;
    
    UIImageView* profilePicture;
    UILabel* userName;
}

@end
