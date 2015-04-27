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

// Padding
+(int)postSpacing;
+(int)contentSpacing;
+(float)postElementSpacing;


@end
