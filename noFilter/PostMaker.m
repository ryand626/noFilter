//
//  PostMaker.m
//  noFilter
//
//  Created by Ryan Dougherty on 4/27/15.
//  Copyright (c) 2015 team17. All rights reserved.
//

#import "PostMaker.h"

@interface PostMaker ()

@end

@implementation PostMaker

- (void)viewDidLoad {
    [super viewDidLoad];
     
    inputImages = [[NSMutableArray alloc]initWithObjects: nil];
    
    newPost = nil;
    
    previewImages = [[UIScrollView alloc]initWithFrame:CGRectMake(0, [Styles thumbnailPreviewOffset]+[Styles textInputHeight], [Styles postWidth], [Styles thumbnailSize])];
    [self.view addSubview:previewImages];
    
    inputField = [[UITextField alloc]initWithFrame:CGRectMake([Styles postWidth]/2-[Styles textInputWidth]/2, [Styles thumbnailPreviewOffset], [Styles textInputWidth], [Styles textInputHeight])];
    [inputField setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:inputField];
    
    [self createButtons];
    
    // Upload from camera direclty? Do we want this?
    // Alert the user if they don't have camera capabilities
    //    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
    //
    //        UIAlertView *myAlertView = [[UIAlertView alloc]
    //            initWithTitle:@"Error"
    //                  message:@"Device has no camera"
    //                 delegate:nil
    //        cancelButtonTitle:@"OK"
    //        otherButtonTitles: nil];
    //
    //        [myAlertView show];
    //    }
}

-(void)createButtons{
    // Button for adding a new image
    addImage = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, [Styles buttonWidth], [Styles buttonHeight])];
    [addImage addTarget:self action:@selector(selectPhoto:) forControlEvents:UIControlEventTouchUpInside];
    [addImage setBackgroundColor:[Styles buttonColor]];
    [self.view addSubview:addImage];
    // Button for making a post
    makePost = [[UIButton alloc]initWithFrame:CGRectMake([Styles postWidth]-[Styles buttonWidth], [Styles postMakerHeight]-[Styles buttonHeight],[Styles buttonWidth],[Styles buttonHeight])];
    [makePost addTarget:self action:@selector(post:) forControlEvents:UIControlEventTouchUpInside];
    [makePost setBackgroundColor:[Styles buttonColor]];
    [self.view addSubview:makePost];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)post:(id)sender{
    // If the post is valid, generate a new post object
    if (inputField.text.length != 0 || [inputImages count] > 0) {
        newPost = [[Post alloc]initWithFrame:CGRectZero];
        [newPost setText:inputField.text];
        [newPost setUser:1];
        for (UIImage* image in inputImages) {
            [newPost addContent:image];
        }
        [posts insertObject:newPost atIndex:0];
    }
    // Clean up the fields
    inputField.text = nil;
    [inputImages removeAllObjects];
    for (UIView* view in [previewImages subviews]) {
        [view removeFromSuperview];
    }
}

// FOR ADDING IMAGES
- (IBAction)selectPhoto:(UIButton *)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    
    // Add the image to the preview
    [inputImages addObject:chosenImage];
    UIImageView* newImage = [[UIImageView alloc]initWithFrame:CGRectMake([Styles thumbnailSize]*([inputImages count]-1), 0, [Styles thumbnailSize], [Styles thumbnailSize])];
    [newImage setImage:chosenImage];
    previewImages.contentSize = CGSizeMake([Styles thumbnailSize]*[inputImages count], [Styles thumbnailSize]);
    [previewImages addSubview:newImage];
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

@end
