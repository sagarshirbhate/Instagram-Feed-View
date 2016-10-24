//
//  SuggestedPeopleCollectionViewCell.h
//  Traweller
//
//  Created by Sagar Shirbhate on 8/11/16.
//  Copyright © 2016 Sagar Shirbhate. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SuggestedPeopleCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (weak, nonatomic) IBOutlet UIButton *FollowButton;
@property (weak, nonatomic) IBOutlet UIButton *closeButton;

@property (nonatomic, copy) void (^followButtonClick)(SuggestedPeopleCollectionViewCell *aCell);
@property (nonatomic, copy) void (^closeBtnclick)(SuggestedPeopleCollectionViewCell *aCell);


- (IBAction)followButtonClick:(id)sender;

- (IBAction)closeBtnclick:(id)sender;


@end
