//
//  PostMaker.h
//  noFilter
//
//  Created by Ryan Dougherty on 4/27/15.
//  Copyright (c) 2015 team17. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Styles.h"
#import "Post.h"
@interface PostMaker : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>{
    // Post Generation
    UIButton* addImage;
    @public UIButton* makePost;
    UITextField* inputField;
    NSMutableArray* inputImages;
    UIImageView* previewImage;
    
    UIScrollView* previewImages;
    
    @public NSMutableArray* posts;
    @public Post* newPost;
}

@end
