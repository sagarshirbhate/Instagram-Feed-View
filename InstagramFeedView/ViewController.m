//
//  ViewController.m
//  InstagramFeedView
//
//  Created by Sagar Shirbhate on 10/24/16.
//  Copyright © 2016 Sagar Shirbhate. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)registerCells{
    
    UINib *nib = [UINib nibWithNibName:@"SectionHeaderOfPost" bundle:nil];
    [_tableview registerNib:nib forCellReuseIdentifier:@"SectionHeaderOfPost"];

    nib = [UINib nibWithNibName:@"UploadedOn" bundle:nil];
    [_tableview registerNib:nib forCellReuseIdentifier:@"UploadedOn"];
    
    nib = [UINib nibWithNibName:@"TotalLikes_Comments" bundle:nil];
    [_tableview registerNib:nib forCellReuseIdentifier:@"TotalLikes_Comments"];
    
    nib = [UINib nibWithNibName:@"PostImage" bundle:nil];
    [_tableview registerNib:nib forCellReuseIdentifier:@"PostImage"];
    
    nib = [UINib nibWithNibName:@"Buttons" bundle:nil];
    [_tableview registerNib:nib forCellReuseIdentifier:@"Buttons"];
    
    nib = [UINib nibWithNibName:@"DetailText" bundle:nil];
    [_tableview registerNib:nib forCellReuseIdentifier:@"DetailText"];
    
    nib = [UINib nibWithNibName:@"PostDescription" bundle:nil];
    [_tableview registerNib:nib forCellReuseIdentifier:@"PostDescription"];
    
    nib = [UINib nibWithNibName:@"SuggestedPeopleCell" bundle:nil];
    [_tableview registerNib:nib forCellReuseIdentifier:@"SuggestedPeopleCell"];
    
}


@end
