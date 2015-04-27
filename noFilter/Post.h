//
//  Post.h
//  noFilter
//
//  Created by Ryan Dougherty on 4/27/15.
//  Copyright (c) 2015 team17. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Post : UIView{
    int user;
    UIImage* profilePicture;
    NSString* text;
    NSMutableArray* content;

    UILabel* postText;         // to show the text
    UIScrollView* contentView; // to show the content
    UIButton* userImage;       // to show the user profile
}

-(void)setUser:(int)userID;
-(void)setText:(NSString*)newText;
-(void)addContent:(UIImage*)image;


-(void)offsetBy:(float)offset;
@end
