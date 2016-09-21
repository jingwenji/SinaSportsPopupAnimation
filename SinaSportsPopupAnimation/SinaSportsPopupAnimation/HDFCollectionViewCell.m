//
//  HDFCollectionViewCell.m
//  SinaSportsPopupAnimation
//
//  Created by HDF on 16/9/20.
//  Copyright © 2016年 HDF. All rights reserved.
//

#import "HDFCollectionViewCell.h"

@implementation HDFCollectionViewCell
- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.medalImageView = [[UIImageView alloc] init];
        self.medalImageView.frame = CGRectMake(0, 0, CountWidth(180), CountWidth(180));
        self.medalImageView.backgroundColor = [UIColor whiteColor];
        self.medalImageView.layer.cornerRadius = CountWidth(180)/2;
        self.medalImageView.contentMode = UIViewContentModeScaleToFill;
//        [self.medalImageView.layer setShadowPath:[UIBezierPath bezierPathWithRoundedRect:self.medalImageView.bounds cornerRadius:CountWidth(180)/2].CGPath];
//        self.medalImageView.layer.shadowOffset = CGSizeMake(0, 1);
//        self.medalImageView.layer.shadowColor = [UIColor colorWithRed:4.0/255.0 green:0.0 blue:0.0 alpha:1].CGColor;
//        self.medalImageView.layer.shadowRadius = 1;
//        self.medalImageView.layer.shadowOpacity = 0.75;
        [self.contentView addSubview:self.medalImageView];
        
        
        
        self.medalNameLabel = [[UILabel alloc] init];
        self.medalNameLabel.frame = CGRectMake((self.frame.size.width-CountWidth(134))/2, self.frame.size.width+CountHeight(10), CountWidth(134), CountHeight(40));
        self.medalNameLabel.layer.cornerRadius = CountHeight(40)/2;
        self.medalNameLabel.layer.masksToBounds = YES;
        self.medalNameLabel.backgroundColor = NormalGreenColor;
        self.medalNameLabel.textAlignment = NSTextAlignmentCenter;
        self.medalNameLabel.textColor = [UIColor whiteColor];
        self.medalNameLabel.font = [UIFont boldSystemFontOfSize:11.0];
        [self.contentView addSubview:self.medalNameLabel];
    }
    return self;
}
@end
