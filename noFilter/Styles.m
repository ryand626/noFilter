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
    return [UIColor blackColor];
}
+(UIColor*)postColor{
    return [UIColor brownColor];
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
    return screenHeight * .20;
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


// Padding
+(int)postSpacing{
    return 10;
}
+(int)contentSpacing{
    return 10;
}
+(float)postElementSpacing{
    return 10;
}


+ (id)alloc {
    [NSException raise:@"Cannot be instantiated!" format:@"Static class 'ClassName' cannot be instantiated!"];
    return nil;
}

@end
