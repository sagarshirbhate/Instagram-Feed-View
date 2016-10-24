//
//  PostImage.m
//  Traweller
//
//  Created by Sagar Shirbhate on 8/9/16.
//  Copyright © 2016 Sagar Shirbhate. All rights reserved.
//

#import "PostImage.h"


@implementation PostImage

- (void)awakeFromNib {
    [super awakeFromNib];
//    
//    if (iPAD) {
//        [_postImage addConstraint:[NSLayoutConstraint constraintWithItem:_postImage
//                                                               attribute:NSLayoutAttributeHeight
//                                                               relatedBy:NSLayoutRelationLessThanOrEqual
//                                                                  toItem:nil
//                                                               attribute: NSLayoutAttributeNotAnAttribute
//                                                              multiplier:1
//                                                                constant:600]];
//    }else{
//        if (iPhone6plus) {
//            [_postImage addConstraint:[NSLayoutConstraint constraintWithItem:_postImage
//                                                                   attribute:NSLayoutAttributeHeight
//                                                                   relatedBy:NSLayoutRelationLessThanOrEqual
//                                                                      toItem:nil
//                                                                   attribute: NSLayoutAttributeNotAnAttribute
//                                                                  multiplier:1
//                                                                    constant:360]];
//        }else  if (iPhone6) {
//            [_postImage addConstraint:[NSLayoutConstraint constraintWithItem:_postImage
//                                                                   attribute:NSLayoutAttributeHeight
//                                                                   relatedBy:NSLayoutRelationLessThanOrEqual
//                                                                      toItem:nil
//                                                                   attribute: NSLayoutAttributeNotAnAttribute
//                                                                  multiplier:1
//                                                                    constant:320]];
//        }else{
            [_postImage addConstraint:[NSLayoutConstraint constraintWithItem:_postImage
                                                                   attribute:NSLayoutAttributeHeight
                                                                   relatedBy:NSLayoutRelationLessThanOrEqual
                                                                      toItem:nil
                                                                   attribute: NSLayoutAttributeNotAnAttribute
                                                                  multiplier:1
                                                                    constant:280]];
//        }
   // }
    

//    [_postImage addShaddow];
//    _postImage.userInteractionEnabled=YES;
//    UITapGestureRecognizer *tapRecognizerq = [[UITapGestureRecognizer alloc] init];
//    [tapRecognizerq addTarget:self action:@selector(clickedmage:)];
//    [_postImage addGestureRecognizer:tapRecognizerq];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)clickedmage:(UITapGestureRecognizer *)sender {
}



@end
