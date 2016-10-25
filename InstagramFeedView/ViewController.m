//
//  ViewController.m
//  InstagramFeedView
//
//  Created by Sagar Shirbhate on 10/24/16.
//  Copyright © 2016 Sagar Shirbhate. All rights reserved.
//

#import "ViewController.h"

#import "UploadedOn.h"
#import "TotalLikes_Comments.h"
#import "SuggestedPeopleCell.h"
#import "PostImage.h"
#import "PostDescription.h"
#import "DetailText.h"
#import "Buttons.h"
#import "SectionHeaderOfPost.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self registerCells];
    
    _tableview.estimatedRowHeight=10;
    _tableview.rowHeight=UITableViewAutomaticDimension;
    
    // Feed data array set add one extra array for which cell should be shown as per your json I have used six cells
    
    feedDataArray=[NSMutableArray new];
    for (int i=0; i<10; i++) {
        NSArray * data = @[@"date",@"description",@"PostImage",@"Postdescription",@"Buttons",@"LikeComment"];
        NSDictionary * dict =@{
                               @"dataToshow":data
                               };
        [feedDataArray addObject:dict];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/**
 *  @author Sagar Shirbhate, 16-10-25 12:10:52
 *
 *  Register Xib of cells with storybord. You can use this anywhere in your project
 */
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

#pragma mark === Tableview DataSources=======
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return feedDataArray.count+1;
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        
        return 1; // If wanna to show suggested people then 1 otherwise 0
        
    }else{
        
        // No of things you wanna to show into a feed View.
        NSArray * arr =[[feedDataArray objectAtIndex:section-1]valueForKey:@"dataToshow"];
        return arr.count;
        
    }
    return 0;
}



/**
 *  @author Sagar Shirbhate, 16-10-14 18:10:17
 *
 *  WHILE DISPLAYING THE SPECIFIC CELL THIS METHOD WILL INVOKE BUT WE INVOKE THIS FOR SUGGESTING PEOPLE TO SET THE DATASOURCE AND DELEGATES FOR UICOLLECTION VIEW
 *
 *  @param tableView TABLEVIEW WHICH IS USED
 *  @param cell      THE CELL WHICH IS SHOWN
 *  @param indexPath INDEXPATH OF THE CELL
 */
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            SuggestedPeopleCell * cell1 =(SuggestedPeopleCell *)cell;
            [cell1 setCollectionViewDataSourceDelegate:self indexPath:indexPath];
            NSInteger index = cell1.collectionView.tag;
            CGFloat horizontalOffset = [self.contentOffsetDictionary[[@(index) stringValue]] floatValue];
            [cell1.collectionView setContentOffset:CGPointMake(horizontalOffset, 0)];
        }
    }
}


/**
 *  @author Sagar Shirbhate, 16-10-14 18:10:36
 *
 *  THIS IS THE HEART OF VIEW IN WHICH ALL THE BASIC THINGS ARE DONE IN THIS METHOD
 IN WHICH THE CELLS ARE NOT ARRANGED AS PER THE INDEXPATH. CELLS ARE ARRAGED AS PER THE DATATYPE WHICH THE DATA ARRAY TOOK E.G. IF TEXTFILED THEN CELL RETURNS TEXTFIELD CELL OR IN THE CELL TYPE IS IMAGE THEN IMAGE TYPE CELL IS RETURNEDD.
 ALL THE ACTIONS WHICH ARE INVOKED INTO THE BUTTONS OF THE CELL ARE MAINTAINED INTO THE BLOCK BY EHICH NO UI DISTURBENCE WILL BE DONE AND ALL THE WEBSERIVICE METHODS ARE INVOKED INTO THE BACKGROUND QUEUE.
 *
 *  @param aTableView AN USED TABLEVIEW
 *  @param indexPath  INDEXPATH OF PARTICULAR CELL
 *
 *  @return RETURNS A UITABLEVIEWCELL OBJECT
 */
- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell ;
    
    if (indexPath.section==0) {
        
        if (indexPath.row==0) {
            SuggestedPeopleCell *cell = [self.tableview dequeueReusableCellWithIdentifier:@"SuggestedPeopleCell" forIndexPath:indexPath];
            return cell;
        }
    }else{
        
        __block  NSMutableDictionary * dataDict =[[NSMutableDictionary alloc]initWithDictionary:[feedDataArray objectAtIndex:indexPath.section-1]];
        NSArray * arr =[dataDict valueForKey:@"dataToshow"];
        
        if ([[arr objectAtIndex:indexPath.row]isEqualToString:@"date"]) {
           
            UploadedOn *cell = [self.tableview dequeueReusableCellWithIdentifier:@"UploadedOn" forIndexPath:indexPath];
            cell.titleLabel.text=@"Uploaded 10 Min Ago.";
            return cell;
            
       }else if ([[arr objectAtIndex:indexPath.row]isEqualToString:@"description"]) {
            
            PostDescription *cell = [self.tableview dequeueReusableCellWithIdentifier:@"PostDescription" forIndexPath:indexPath];
                cell.titleLabel.text=@"Major Details Of Post";
            return cell;
            
        } else  if ([[arr objectAtIndex:indexPath.row]isEqualToString:@"PostImage"]) {
            
                PostImage *cell = [self.tableview dequeueReusableCellWithIdentifier:@"PostImage" forIndexPath:indexPath];
               // cell.postImage.image=[UIImage imageNamed:@""];
            
                return cell;
        }else if ([[arr objectAtIndex:indexPath.row]isEqualToString:@"Postdescription"]) {
            
            DetailText *cell = [self.tableview dequeueReusableCellWithIdentifier:@"DetailText" forIndexPath:indexPath];
        cell.titleLabel.text =@"Minor details of Post \n You can Hide this too.";
            
            return cell;
            
        }else if ([[arr objectAtIndex:indexPath.row]isEqualToString:@"LikeComment"]) {
            
            TotalLikes_Comments *cell = [self.tableview dequeueReusableCellWithIdentifier:@"TotalLikes_Comments" forIndexPath:indexPath];
            
            
            cell.LikeButtonTapAction = ^(TotalLikes_Comments *aCell){
                NSLog(@"Like ButtonClicked");
            };
            
            cell.CommentButtonTapAction = ^(TotalLikes_Comments *aCell){
                NSLog(@"Comment ButtonClicked");
                };
            
            cell.openLikesTapAction = ^(TotalLikes_Comments * aCell){
                NSLog(@"Open Likes ButtonClicked");
            };
            return cell;
            
        }else if ([[arr objectAtIndex:indexPath.row]isEqualToString:@"Buttons"]) {
            
            Buttons *cell = [self.tableview dequeueReusableCellWithIdentifier:@"Buttons" forIndexPath:indexPath];
            
            
            cell.LikeButtonTapAction = ^(Buttons *aCell){
                NSLog(@"Likes ButtonClicked");
            };
            
            cell.CommentButtonTapAction = ^(Buttons *aCell){
                NSLog(@" Comments ButtonClicked");
            };
            
            cell.ShareButtonTapAction = ^(Buttons * aCell){
                NSLog(@" Share ButtonClicked");
            };
            return cell;
            
        }
    }
    return cell;
}


-(UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    static NSString *CellIdentifier = @"SectionHeaderOfPost";
    SectionHeaderOfPost *headerView = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (headerView == nil){
        [NSException raise:@"headerView == nil.." format:@"No cells with matching CellIdentifier loaded from your storyboard"];
    }
   
    
    if (section!=0) {
        
     headerView.titleLabel.text=@"Post Uploaded by User";
        headerView.menuButtonclick = ^(SectionHeaderOfPost *aCell){
            
            UIAlertController * view=   [UIAlertController
                                         alertControllerWithTitle:@"Instagram-Feed"
                                         message:nil
                                         preferredStyle:UIAlertControllerStyleActionSheet];
            
            UIAlertAction* ok = [UIAlertAction
                                 actionWithTitle:@"Cancel"
                                 style:UIAlertActionStyleCancel
                                 handler:^(UIAlertAction * action)
                                 {
                                     NSLog(@" Cancel ButtonClicked");
                                 }];
            UIAlertAction* edit = [UIAlertAction
                                   actionWithTitle:@"Edit Post"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action)
                                   {
                                       NSLog(@" Edit ButtonClicked");
                                   }];
            UIAlertAction* delete = [UIAlertAction
                                     actionWithTitle:@"Delete Post"
                                     style:UIAlertActionStyleDestructive
                                     handler:^(UIAlertAction * action)
                                     {
                                         NSLog(@" Delete ButtonClicked");
                                     }];
            UIAlertAction* share =    [UIAlertAction
                                       actionWithTitle:@"Share Post"
                                       style:UIAlertActionStyleDefault
                                       handler:^(UIAlertAction * action)
                                       {
                                           NSLog(@" Share ButtonClicked");
                                       }];
            UIAlertAction* remove = [UIAlertAction
                                     
                                     actionWithTitle:@"Report & Remove Feed"
                                     style:UIAlertActionStyleDestructive
                                     handler:^(UIAlertAction * action)
                                     {
                                         NSLog(@" report Remove ButtonClicked");
                                    }];
            

                [view addAction:ok];
                [view addAction:edit];
                [view addAction:delete];
                [view addAction:remove];
                [view addAction:share];
            
            
            CGPoint windowPoint = [aCell convertPoint:aCell.menuBtn.bounds.origin toView:self.view.window];
            view.popoverPresentationController.sourceView = self.view;
            view.popoverPresentationController.sourceRect = CGRectMake(aCell.menuBtn.frame.origin.x, windowPoint.y+15, aCell.menuBtn.frame.size.width, aCell.menuBtn.frame.size.height);;
            [self presentViewController: view animated:YES completion:nil];
        };
        
        headerView.clickedOnname = ^(SectionHeaderOfPost *aCell){
        };
        
        
    }
    
    headerView.layer.borderWidth=0.5;
    headerView.layer.borderColor= [UIColor lightGrayColor].CGColor;
    
    UIView *view = [[UIView alloc] initWithFrame:[headerView frame]];
    headerView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [view addSubview:headerView];
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section==0) {
        return CGFLOAT_MIN;
    }else{
        return 44.0f;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}


#pragma mark - UICollectionViewDataSource Methods

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 15;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SuggestedPeopleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionViewCellIdentifier forIndexPath:indexPath];
    //cell.titleLabel.text=@"Name";
   // cell.subTitleLabel.text = @"Detail Text";
    cell.layer.cornerRadius=4;
    cell.layer.borderColor=[UIColor lightGrayColor].CGColor;
    cell.layer.borderWidth=0.5;
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(140, 150);
}

#pragma mark - UIScrollViewDelegate Methods

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (![scrollView isKindOfClass:[UICollectionView class]]) return;
    
    CGFloat horizontalOffset = scrollView.contentOffset.x;
    
    UICollectionView *collectionView = (UICollectionView *)scrollView;
    NSInteger index = collectionView.tag;
    self.contentOffsetDictionary[[@(index) stringValue]] = @(horizontalOffset);
}



@end
