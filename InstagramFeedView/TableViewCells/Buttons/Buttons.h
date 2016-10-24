//
//  Buttons.h
//  Traweller
//
//  Created by Sagar Shirbhate on 8/9/16.
//  Copyright © 2016 Sagar Shirbhate. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Buttons : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *likeButton;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;

@property (nonatomic, copy) void (^LikeButtonTapAction)(Buttons *aCell);
@property (nonatomic, copy) void (^CommentButtonTapAction)(Buttons *aCell);
@property (nonatomic, copy) void (^ShareButtonTapAction)(Buttons *aCell);

- (IBAction)likeClick:(id)sender;
- (IBAction)shareclick:(id)sender;
- (IBAction)commentClick:(id)sender;
@end
