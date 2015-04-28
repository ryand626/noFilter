//
//  Style.m
//  
//
//  Created by Ryan Dougherty on 4/26/15.
//
//

#import "Styles.h"

@implementation Styles

static float screenWidth = 0;
static float screenHeight = 0;

// Colors
+(UIColor*)backgroundColor{
    return [UIColor whiteColor];
}
+(UIColor*)buttonColor{
    return [UIColor brownColor];
}
+(UIColor*)postColor{
    return [UIColor brownColor];
}
+(UIColor*)buttonFontColor{
    return [UIColor whiteColor];
}
+(UIColor*)loginBackgroundColor{
    return [UIColor colorWithRed:1 green:1 blue:1 alpha:.5f];
}
+(UIColor*)postTextBackgroundColor{
    return [UIColor colorWithRed:1 green:1 blue:1 alpha:.5f];
}
+(UIColor*)postContentBackgroundColor{
    return [UIColor colorWithRed:0 green:0 blue:0 alpha:.9f];
}
+(UIColor*)contentBackgroundColor{
    return [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
}
+(UIColor*)mainColor{
    return [UIColor colorWithRed:.1f green:.2f blue:.9f alpha:1.0f];
}
+(UIColor*)bannerTextColor{
    return [UIColor whiteColor];
}



// Dimentions
+(int)buttonWidth{
    return 40;
}
+(int)buttonHeight{
    return 20;
}
+(int)headerHeight{
    return 80;
}

+(float)feedWidth{
    return screenWidth;
}
+(float)postWidth{
    return screenWidth * .80;
}
+(float)postElementWidth{
    return screenWidth * .60;
}

+(float)AppHeight{
    return screenHeight;
}
+(float)AppWidth{
    return screenWidth;
}

+(float)contentMaxWidth{
    return screenWidth*.5;
}

+(void)setScreenWidth:(int)width{
    screenWidth = width;
}
+(void)setScreenHeight:(int)height{
    screenHeight = height;
}

+(float)userButtonSize{
    return screenWidth * .1;
}

+(float)thumbnailSize{
    return screenWidth * .1;
}
+(float)postMakerHeight{
    return screenHeight * .30;
}
+(float)thumbnailPreviewOffset{
    return screenWidth * .1;
}
+(float)textInputWidth{
    return [self postWidth]*.9;
}
+(float)textInputHeight{
    return screenWidth*.1;
}

+(float)profilePicOffsetX{
    return screenWidth/2-[self profilePicWidth]/2;
}
+(float)profilePicOffsetY{
    return screenHeight*.05;
}
+(float)profilePicWidth{
    return screenWidth * (1.0/3);
}
+(float)profilePicHeight{
    return screenWidth * (1.0/3);
}
+(float)loginFormHeight{
    return screenHeight * .1;
}



// Padding
+(float)loginFormOffset{
    return .1;
}
+(float)loginContentOffset{
    return .2;
}
+(float)loginFormPadding{
    return .9;
}
+(int)postSpacing{
    return 10;
}
+(int)contentSpacing{
    return 10;
}
+(float)postElementSpacing{
    return 10;
}
+(float)buttonPadding{
    return 1.2;
}

// Rounding
+(float)buttonRound{
    return 5;
}
+(float)textRound{
    return 5;
}

// Points
+(CGPoint)loginFieldsPt{
    return CGPointMake(screenWidth/2, screenHeight*([self loginFormOffset]));
}

+(CGPoint)loginButtonsPt{
    return CGPointMake(screenWidth/2 + [self loginFormOffset]*screenWidth, [self loginFieldsPt].y+2*([self loginFormHeight]+screenHeight*[self loginFormOffset]));
}
+(CGPoint)signUpButtonPt{
    return CGPointMake([self loginFormOffset]*screenWidth, [self loginFieldsPt].y+2*([self loginFormHeight]+screenHeight*[self loginFormOffset]));
}


+ (id)alloc {
    [NSException raise:@"Cannot be instantiated!" format:@"Static class 'ClassName' cannot be instantiated!"];
    return nil;
}

@end
