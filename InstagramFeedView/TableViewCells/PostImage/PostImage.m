//
//  PostImage.m
//  Traweller
//
//  Created by Sagar Shirbhate on 8/9/16.
//  Copyright © 2016 Sagar Shirbhate. All rights reserved.
//

#import "PostImage.h"

#define iPAD ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad)
#define iPhone4s  ([[UIScreen mainScreen] bounds].size.height == 480)?TRUE:FALSE
#define iPhone5or5s  ([[UIScreen mainScreen] bounds].size.height == 568)?TRUE:FALSE
#define iPhone6plus  ([[UIScreen mainScreen] bounds].size.height == 736)?TRUE:FALSE
#define iPhone6  ([[UIScreen mainScreen] bounds].size.height == 667)?TRUE:FALSE

@implementation PostImage

- (void)awakeFromNib {
    [super awakeFromNib];
    
    if (iPAD) {
        [_postImage addConstraint:[NSLayoutConstraint constraintWithItem:_postImage
                                                               attribute:NSLayoutAttributeHeight
                                                               relatedBy:NSLayoutRelationLessThanOrEqual
                                                                  toItem:nil
                                                               attribute: NSLayoutAttributeNotAnAttribute
                                                              multiplier:1
                                                                constant:600]];
    }else{
        if (iPhone6plus) {
            [_postImage addConstraint:[NSLayoutConstraint constraintWithItem:_postImage
                                                                   attribute:NSLayoutAttributeHeight
                                                                   relatedBy:NSLayoutRelationLessThanOrEqual
                                                                      toItem:nil
                                                                   attribute: NSLayoutAttributeNotAnAttribute
                                                                  multiplier:1
                                                                    constant:360]];
        }else  if (iPhone6) {
            [_postImage addConstraint:[NSLayoutConstraint constraintWithItem:_postImage
                                                                   attribute:NSLayoutAttributeHeight
                                                                   relatedBy:NSLayoutRelationLessThanOrEqual
                                                                      toItem:nil
                                                                   attribute: NSLayoutAttributeNotAnAttribute
                                                                  multiplier:1
                                                                    constant:320]];
        }else{
            [_postImage addConstraint:[NSLayoutConstraint constraintWithItem:_postImage
                                                                   attribute:NSLayoutAttributeHeight
                                                                   relatedBy:NSLayoutRelationLessThanOrEqual
                                                                      toItem:nil
                                                                   attribute: NSLayoutAttributeNotAnAttribute
                                                                  multiplier:1
                                                                    constant:280]];
       }
}
    

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}



@end
