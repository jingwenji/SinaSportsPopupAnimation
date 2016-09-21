//
//  NormalPattern.h
//  SinaSportsPopupAnimation
//
//  Created by HDF on 16/9/20.
//  Copyright © 2016年 HDF. All rights reserved.
//

//#ifndef NormalPattern_h
//#define NormalPattern_h
//
//#endif /* NormalPattern_h */


#define  SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define  SCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height

#define CountWidth(w)  (w/750.0)*SCREEN_WIDTH
#define CountHeight(h) ((h)/1334.0)*SCREEN_HEIGHT

#define LCRGBColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define LCRGBAColor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]


#define NormalGreenColor [UIColor colorWithRed:42.0/255.0 green:194.0/255.0 blue:107.0/255.0 alpha:1]
