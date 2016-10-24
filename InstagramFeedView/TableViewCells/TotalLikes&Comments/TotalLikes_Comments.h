//
//  TotalLikes&Comments.h
//  Traweller
//
//  Created by Sagar Shirbhate on 8/9/16.
//  Copyright © 2016 Sagar Shirbhate. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TotalLikes_Comments : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *totalLikesButton;
@property (weak, nonatomic) IBOutlet UIButton *totalCommentsButon;
@property (weak, nonatomic) IBOutlet UIButton *openLikes;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalRatedPeople;

@property (nonatomic, copy) void (^LikeButtonTapAction)(TotalLikes_Comments *aCell);
@property (nonatomic, copy) void (^CommentButtonTapAction)(TotalLikes_Comments *aCell);
@property (nonatomic, copy) void (^openLikesTapAction)(TotalLikes_Comments *aCell);

- (IBAction)openLikesClick:(id)sender;
- (IBAction)totalLikesclick:(id)sender;
- (IBAction)totalCommentsclick:(id)sender;
@end
