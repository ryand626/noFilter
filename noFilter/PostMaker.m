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
    
    previewImages = [[UIScrollView alloc]initWithFrame:CGRectMake([Styles postWidth]/2-[Styles textInputWidth]/2, [Styles postMakerHeight]/2-[Styles thumbnailSize]/2, [Styles textInputWidth], [Styles thumbnailSize])];
    [self.view addSubview:previewImages];
    
    inputField = [[UITextField alloc]initWithFrame:CGRectMake([Styles postWidth]/2-[Styles textInputWidth]/2, [Styles postSpacing], [Styles textInputWidth], [Styles textInputHeight])];
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
    addImage = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 0, [Styles buttonHeight])];
    [addImage setTitle:@"Add Image" forState:UIControlStateNormal];
    [addImage sizeToFit];
    [addImage addTarget:self action:@selector(selectPhoto:) forControlEvents:UIControlEventTouchUpInside];
    [addImage setBackgroundColor:[Styles buttonColor]];
    [addImage setFrame: CGRectMake([Styles postSpacing], [Styles postMakerHeight]-addImage.frame.size.height-[Styles postSpacing], addImage.frame.size.width, addImage.frame.size.height)];
    addImage.layer.cornerRadius=[Styles buttonRound];
    addImage.clipsToBounds = YES;
    [self.view addSubview:addImage];
    
    // Button for making a post
    makePost = [[UIButton alloc] init];
    [makePost setTitle:@"~noFilter" forState:UIControlStateNormal];
    [makePost sizeToFit];
    [makePost addTarget:self action:@selector(post:) forControlEvents:UIControlEventTouchUpInside];
    [makePost setBackgroundColor:[Styles buttonColor]];
    [makePost setFrame: CGRectMake([Styles postWidth]-makePost.frame.size.width-[Styles postSpacing], [Styles postMakerHeight]-makePost.frame.size.height-[Styles postSpacing],makePost.frame.size.width,makePost.frame.size.height)];
    makePost.layer.cornerRadius=[Styles buttonRound];
    makePost.clipsToBounds = YES;
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
    UIImageView* newImage = [[UIImageView alloc]initWithFrame:CGRectMake([Styles thumbnailSize]*([inputImages count]-1)+2*([inputImages count]-1), 0, [Styles thumbnailSize], [Styles thumbnailSize])];
    [newImage setImage:chosenImage];
    
    newImage.layer.cornerRadius = newImage.bounds.size.width/2;
    newImage.clipsToBounds = YES;
    newImage.contentMode = UIViewContentModeScaleAspectFill;
    previewImages.contentSize = CGSizeMake([Styles thumbnailSize]*[inputImages count]+2*([inputImages count]-1), [Styles thumbnailSize]);
    [previewImages addSubview:newImage];
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

@end
