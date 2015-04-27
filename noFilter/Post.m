//
//  Post.m
//  noFilter
//
//  Created by Ryan Dougherty on 4/27/15.
//  Copyright (c) 2015 team17. All rights reserved.
//

#import "Post.h"
#import "Styles.h"
#import <QuartzCore/QuartzCore.h>

@implementation Post
float offset;
float contentHeight;

- (void)commonInit
{
    offset = [Styles postElementSpacing];
    contentHeight = 0;

    // Add the user information
    userImage = [[UIButton alloc] initWithFrame:CGRectMake(([Styles postWidth]/2-[Styles userButtonSize]/2), offset, [Styles userButtonSize], [Styles userButtonSize])];
    [userImage setBackgroundImage:profilePicture forState:UIControlStateNormal];
    userImage.layer.cornerRadius=[Styles userButtonSize]/2;
    userImage.clipsToBounds = YES;
    [userImage setBackgroundColor:[UIColor redColor]];
    [self addSubview:userImage];
    offset += ([Styles userButtonSize] + [Styles postElementSpacing]);

    // Add The post Text
    postText = [[UILabel alloc]initWithFrame:CGRectMake(([Styles AppWidth]-[Styles postWidth])/2, offset, [Styles postElementWidth], 0)];
    postText.numberOfLines = 0;
    postText.lineBreakMode = NSLineBreakByWordWrapping;
    [self addSubview:postText];
    
    // Add the image content
    contentView = [[UIScrollView alloc]initWithFrame:CGRectMake(([Styles AppWidth]-[Styles postWidth])/2, 0, [Styles postElementWidth], 0)];
    [contentView setBackgroundColor:[UIColor greenColor]];
    contentView.contentSize = CGSizeMake([Styles postElementWidth], contentHeight);
    [self addSubview:contentView];
    
    
    // For Debug
    [postText setBackgroundColor:[UIColor yellowColor]];
    [self setBackgroundColor:[UIColor cyanColor]];
}

- (id)initWithFrame:(CGRect)aRect{
    if ((self = [super initWithFrame:aRect])) {
        [self commonInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder*)coder{
    if ((self = [super initWithCoder:coder])) {
        [self commonInit];
    }
    return self;
}

-(void)resizeToFitSubviews:(UIView*)view{
    float w = 0;
    float h = 0;
    
    float min_x = INFINITY;
    float min_y = INFINITY;
    
    // Reset content position
    CGRect frame = contentView.frame;
    frame.origin.y = postText.frame.size.height+postText.frame.origin.y+[Styles postElementSpacing];
    [contentView setFrame:frame];
    
    for (UIView *v in [view subviews]) {
        float fw = v.frame.origin.x + v.frame.size.width;
        float fh = v.frame.origin.y + v.frame.size.height;
        w = MAX(fw, w);
        h = MAX(fh, h);
        
        min_x =  MIN(min_x,v.frame.origin.x);
        min_y = MIN(min_y,v.frame.origin.y);
    }
    [view setFrame:CGRectMake(min_x, min_y, w, h)];
}

-(void)centerView:(UIView*)view withParent:(float)parentWidth{
    CGRect frame = [view frame];
    frame.origin.x = parentWidth/2 - frame.size.width/2;
    [view setFrame:frame];
}

-(void)setUser:(int)userID{
    user = userID;
    profilePicture = [UIImage imageNamed:@"Fallout.jpg"];
    [userImage setImage:profilePicture forState:UIControlStateNormal];
}
-(void)setText:(NSString*)newText{
    text = newText;
    [postText setText:text];
    [postText sizeToFit]; // Reset the frame of the label
    
    [self resizeToFitSubviews:self]; // Reset the frame of the post
    
    // Center the resized text
    CGRect frame = [self frame];
    frame.size.width = [Styles postWidth];
    frame.origin.x = [Styles AppWidth]/2 - frame.size.width/2;
    [self setFrame:frame];
    
    [self centerView:postText withParent:[self frame].size.width];
}

-(void)addContent:(UIImage*)image{
    [content addObject:image];
    if (contentView.frame.size.height == 0) {
        contentView.frame = CGRectMake(([Styles AppWidth]-[Styles postWidth])/2, 0, [Styles postElementWidth], [Styles contentMaxWidth] + [Styles contentSpacing] * 2);
    }
    contentHeight += [Styles contentSpacing];
    UIImageView* imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, contentHeight, [Styles contentMaxWidth], [Styles contentMaxWidth])];

    [self centerView:imageView withParent:contentView.frame.size.width];
    [imageView setBackgroundColor:[UIColor orangeColor]];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
//    imageView.clipsToBounds = YES;
    [imageView setImage:image];

    [contentView addSubview:imageView];
    contentHeight += imageView.frame.size.height;
    contentView.contentSize = CGSizeMake([Styles postElementWidth], contentHeight + [Styles contentSpacing]);

    [self resizeToFitSubviews:self];
    CGRect frame = [self frame];
    frame.size.width = [Styles postWidth];
    frame.origin.x = [Styles AppWidth]/2 - frame.size.width/2;
    frame.size.height += [Styles postElementSpacing];
    [self setFrame:frame];
}

-(void)offsetBy:(float)offset{
    CGRect frame = [self frame];
    frame.origin.y += offset;
    [self setFrame:frame];
}

@end
