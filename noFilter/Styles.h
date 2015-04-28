//
//  Style.h
//  
//
//  Created by Ryan Dougherty on 4/26/15.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Styles : NSObject

// Colors
+(UIColor*)backgroundColor;
+(UIColor*)buttonColor;
+(UIColor*)postColor;
+(UIColor*)buttonFontColor;
+(UIColor*)loginBackgroundColor;
+(UIColor*)postTextBackgroundColor;
+(UIColor*)postContentBackgroundColor;
+(UIColor*)contentBackgroundColor;
+(UIColor*)mainColor;
+(UIColor*)bannerTextColor;
// Dimentions
+(void)setScreenWidth:(int)width;
+(void)setScreenHeight:(int)height;

+(int)buttonWidth;
+(int)buttonHeight;

+(int)headerHeight;

+(float)feedWidth;

+(float)postWidth;
+(float)postElementWidth;

+(float)contentMaxWidth;

+(float)userButtonSize;

+(float)AppHeight;
+(float)AppWidth;

+(float)thumbnailSize;
+(float)postMakerHeight;
+(float)thumbnailPreviewOffset;
+(float)textInputWidth;
+(float)textInputHeight;

+(float)profilePicOffsetX;
+(float)profilePicOffsetY;
+(float)profilePicWidth;
+(float)profilePicHeight;

+(float)loginFormHeight;

// Padding
+(float)loginContentOffset;
+(float)loginFormPadding;
+(float)loginFormOffset;
+(int)postSpacing;
+(int)contentSpacing;
+(float)postElementSpacing;
+(float)buttonPadding;

// Rounding
+(float)buttonRound;
+(float)textRound;

// Points
+(CGPoint)loginFieldsPt;
+(CGPoint)loginButtonsPt;
+(CGPoint)signUpButtonPt;
@end
