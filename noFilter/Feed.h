//
//  Feed.h
//  noFilter
//
//  Created by Ryan Dougherty on 4/26/15.
//  Copyright (c) 2015 team17. All rights reserved.
//

#import "Styles.h"
#import "PostMaker.h"
#import "Profile.h"

@interface Feed : UIViewController 
{
    // ==============User interface================
    UIButton* banner;
    
    UIButton* logout;
    
    UIScrollView* PostTable;

    UIView* postCreator;
    PostMaker* UIPostMaker;
    
    // =================Variables==================
    NSMutableArray *posts;
}
@end
