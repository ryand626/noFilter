//
//  Feed.h
//  noFilter
//
//  Created by Ryan Dougherty on 4/26/15.
//  Copyright (c) 2015 team17. All rights reserved.
//

#import "Styles.h"

@interface Feed : UIViewController{
    UILabel* banner;
    UIButton* logout;
    UIScrollView* PostTable;
    NSMutableArray *posts;
}
@end
