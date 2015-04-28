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
    newPost = nil;
    previewImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, [Styles thumbnailPreviewOffset], [Styles thumbnailSize], [Styles thumbnailSize])];
    [self.view addSubview:previewImage];
    
    
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
    // Add image button
    addImage = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, [Styles buttonWidth], [Styles buttonHeight])];
    [addImage addTarget:self action:@selector(selectPhoto:) forControlEvents:UIControlEventTouchUpInside];
    [addImage setBackgroundColor:[Styles buttonColor]];
    [self.view addSubview:addImage];
    
    makePost = [[UIButton alloc]initWithFrame:CGRectMake([Styles postWidth]-[Styles buttonWidth], [Styles postMakerHeight]-[Styles buttonHeight],[Styles buttonWidth],[Styles buttonHeight])];
    [makePost addTarget:self action:@selector(post:) forControlEvents:UIControlEventTouchUpInside];
    [makePost setBackgroundColor:[Styles buttonColor]];
    [self.view addSubview:makePost];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(IBAction)post:(id)sender{
    if (inputField.text != nil || inputImage != nil) {
        newPost = [[Post alloc]initWithFrame:CGRectZero];
        [newPost setText:inputField.text];
        [newPost setUser:1];
        [newPost addContent:inputImage];
        [posts insertObject:newPost atIndex:0];
        
    }
    inputField.text = nil;
    inputImage = nil;
    previewImage.image = nil;
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
    inputImage = chosenImage;
    [previewImage setImage:chosenImage];
    
    // previewImage.frame = CGRectMake(0, 0, [Styles AppWidth], [Styles AppHeight]);
    [previewImage setBackgroundColor:[UIColor redColor]];
    //    [self.view addSubview:previewImage];
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

@end
