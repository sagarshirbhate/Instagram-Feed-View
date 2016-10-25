//
//  Buttons.m
//  Traweller
//
//  Created by Sagar Shirbhate on 8/9/16.
//  Copyright © 2016 Sagar Shirbhate. All rights reserved.
//

#import "Buttons.h"

@implementation Buttons

- (void)awakeFromNib {
    [super awakeFromNib];
  
//    CGFloat separatorInset; // Separator x position
//    CGFloat separatorHeight;
//    CGFloat separatorWidth;
//    CGFloat separatorY;
//    UIImageView *separator;
//    UIColor *separatorBGColor;
//    
//    separatorY      = self.frame.size.height;
//    separatorHeight = (1.0 / [UIScreen mainScreen].scale);  // This assures you to have a 1px line height whatever the screen resolution
//    separatorWidth  = self.frame.size.width;
//    separatorInset  = 15.0f;
//    separatorBGColor  = [UIColor colorWithRed: 204.0/255.0 green: 204.0/255.0 blue: 204.0/255.0 alpha:1.0];
//    
//    separator = [[UIImageView alloc] initWithFrame:CGRectMake(separatorInset, separatorY, separatorWidth,separatorHeight)];
//    separator.backgroundColor = separatorBGColor;
//    [self addSubview:separator];
//    
//    separator = [[UIImageView alloc] initWithFrame:CGRectMake(separatorInset, 0, separatorWidth,separatorHeight)];
//    separator.backgroundColor = separatorBGColor;
//    //[self addSubview:separator];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)likeClick:(id)sender {
    if (self.LikeButtonTapAction) {
        self.LikeButtonTapAction(self);
    }
}

- (IBAction)shareclick:(id)sender {
    if (self.ShareButtonTapAction) {
        self.ShareButtonTapAction(self);
    }
}

- (IBAction)commentClick:(id)sender {
    if (self.CommentButtonTapAction) {
        self.CommentButtonTapAction(self);
    }
}
@end
