//
//  ViewController.h
//  InstagramFeedView
//
//  Created by Sagar Shirbhate on 10/24/16.
//  Copyright © 2016 Sagar Shirbhate. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    NSMutableArray * feedDataArray;
}
@property (nonatomic, weak) NSMutableDictionary *contentOffsetDictionary;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@end

