//
//  SuggestedPeopleCollectionViewCell.m
//  Traweller
//
//  Created by Sagar Shirbhate on 8/11/16.
//  Copyright © 2016 Sagar Shirbhate. All rights reserved.
//

#import "SuggestedPeopleCollectionViewCell.h"


@implementation SuggestedPeopleCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _profileImage.layer.cornerRadius=35;
    _profileImage.clipsToBounds=YES;
    _profileImage.layer.borderWidth=0.5;
    _profileImage.layer.borderColor=[UIColor colorWithRed: 204.0/255.0 green: 204.0/255.0 blue: 204.0/255.0 alpha:1.0].CGColor;
    
    _FollowButton.layer.cornerRadius=3;
    _FollowButton.clipsToBounds=YES;
    _FollowButton.layer.borderWidth=0.5;
    
    _closeButton.layer.cornerRadius=7.5;
    _closeButton.clipsToBounds=YES;
  //  _closeButton.hidden=YES;
    
    _profileImage.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapRecognizerq = [[UITapGestureRecognizer alloc] init];
    [tapRecognizerq addTarget:self action:@selector(clickedmage:)];
    [_profileImage addGestureRecognizer:tapRecognizerq];
}

- (IBAction)followButtonClick:(id)sender {
    if (self.followButtonClick) {
        self.followButtonClick(self);
    }
}

- (IBAction)closeBtnclick:(id)sender {
    if (self.closeBtnclick) {
        self.closeBtnclick(self);
    }
}

-(void)clickedmage:(UITapGestureRecognizer *)sender {
    
}


@end
