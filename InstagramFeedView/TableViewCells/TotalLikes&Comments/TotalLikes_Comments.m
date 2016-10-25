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
