//
//  SectionHeaderOfPost.h
//  Traweller
//
//  Created by Sagar Shirbhate on 8/9/16.
//  Copyright © 2016 Sagar Shirbhate. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SectionHeaderOfPost : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIButton *menuBtn;


@property (nonatomic, copy) void (^menuButtonclick)(SectionHeaderOfPost *aCell);
@property (nonatomic, copy) void (^clickedOnname)(SectionHeaderOfPost *aCell);

- (IBAction)menuButtonclick:(id)sender;
- (IBAction)clickedOnname:(id)sender;
@end
