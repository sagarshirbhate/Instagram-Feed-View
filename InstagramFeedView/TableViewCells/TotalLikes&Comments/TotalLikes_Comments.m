//
//  TotalLikes&Comments.m
//  Traweller
//
//  Created by Sagar Shirbhate on 8/9/16.
//  Copyright © 2016 Sagar Shirbhate. All rights reserved.
//

#import "TotalLikes_Comments.h"

@implementation TotalLikes_Comments

- (void)awakeFromNib {
    [super awakeFromNib];
    CGFloat separatorInset; // Separator x position
    CGFloat separatorHeight;
    CGFloat separatorWidth;
    CGFloat separatorY;
    UIImageView *separator;
    UIColor *separatorBGColor;
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    
    separatorY      = self.frame.size.height;
    separatorHeight = (1.0 / [UIScreen mainScreen].scale);  // This assures you to have a 1px line height whatever the screen resolution
    separatorWidth  = screenWidth-25;
    separatorInset  = 15.0f;
    separatorBGColor  = [UIColor colorWithRed: 204.0/255.0 green: 204.0/255.0 blue: 204.0/255.0 alpha:1.0];
    
    separator = [[UIImageView alloc] initWithFrame:CGRectMake(separatorInset, 0, separatorWidth,separatorHeight)];
    separator.backgroundColor = separatorBGColor;
    [self addSubview:separator];
    
    separator = [[UIImageView alloc] initWithFrame:CGRectMake(separatorInset,separatorY-1, separatorWidth,separatorHeight)];
    separator.backgroundColor = separatorBGColor;
 //   [self addSubview:separator];
    
    
    [[[_totalLikesButton titleLabel] layer]removeAllAnimations];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)openLikesClick:(id)sender {
    if (self.openLikesTapAction) {
        self.openLikesTapAction(self);
    }
}

- (IBAction)totalLikesclick:(id)sender {
    if (self.LikeButtonTapAction) {
        self.LikeButtonTapAction(self);
    }
}

- (IBAction)totalCommentsclick:(id)sender {
    if (self.CommentButtonTapAction) {
        self.CommentButtonTapAction(self);
    }
}
@end
