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
#import "SectionHeadercell.h"
#import "SectionHeadercell.h"
#import "PostImage.h"
#import "PostDescription.h"
#import "DetailText.h"
#import "Buttons.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerCells];
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
                cell.titleLabel.text=@"Sagar Shirbhate is eating 🍕at Dominoz , Kothrud.";
            return cell;
            
        } else  if ([[arr objectAtIndex:indexPath.row]isEqualToString:@"PostImage"]) {
            
                PostImage *cell = [self.tableview dequeueReusableCellWithIdentifier:@"PostImage" forIndexPath:indexPath];
                cell.postImage.image=[UIImage imageNamed:@""];
            
                return cell;
        }else if ([[arr objectAtIndex:indexPath.row]isEqualToString:@"Postdescription"]) {
            
            DetailText *cell = [self.tableview dequeueReusableCellWithIdentifier:@"DetailText" forIndexPath:indexPath];
        cell.titleLabel.text =@"Cool Place Good Taste.Hangout Awsome....";
            
            return cell;
            
        }else if ([[arr objectAtIndex:indexPath.row]isEqualToString:@"LikeComment"]) {
            
            TotalLikes_Comments *cell = [self.tableview dequeueReusableCellWithIdentifier:@"TotalLikes_Comments" forIndexPath:indexPath];
            
            __block  BOOL liked;
            int isLikedByYou=[[dataDict valueForKey:@"is_like"]intValue];
            if (isLikedByYou==1) {
                liked=YES;
                [cell.totalLikesButton setBackgroundImage:[UIImage imageNamed:@"LikeFilled"] forState:UIControlStateNormal];
            }else{
                liked=NO;
                [cell.totalLikesButton setBackgroundImage:[UIImage imageNamed:@"Like"] forState:UIControlStateNormal];
            }
            int like =[[dataDict valueForKey:@"total_like"]intValue];
            if (like==0) {
                [cell.openLikes setTitle:[NSString stringWithFormat:@"0"] forState:UIControlStateNormal];
            }else if(like==1){
                [cell.openLikes setTitle:[NSString stringWithFormat:@"%d",like] forState:UIControlStateNormal];
            }else{
                [cell.openLikes setTitle:[NSString stringWithFormat:@"%d",like] forState:UIControlStateNormal];
            }
            
            int isCommentByYou=[[dataDict valueForKey:@"is_my"]intValue];
            int coments =[[dataDict valueForKey:@"total_comments"]intValue];
            if (isCommentByYou==1) {
                [cell.totalCommentsButon setImage:[UIImage imageNamed:@"Comment"] forState:UIControlStateNormal];
            }else{
                [cell.totalCommentsButon setImage:[UIImage imageNamed:@"Comment"] forState:UIControlStateNormal];
            }
            if (coments==0) {
                [cell.totalCommentsButon setTitle:[NSString stringWithFormat:@"0"] forState:UIControlStateNormal];
            }else if(coments==1){
                [cell.totalCommentsButon setTitle:[NSString stringWithFormat:@"%d",coments] forState:UIControlStateNormal];
            }else{
                [cell.totalCommentsButon setTitle:[NSString stringWithFormat:@"%d",coments] forState:UIControlStateNormal];
            }
            
            cell.LikeButtonTapAction = ^(TotalLikes_Comments *aCell){
                int like =[[dataDict valueForKey:@"total_like"]intValue];
                
                if (liked==YES) {
                    [aCell.totalLikesButton setBackgroundImage:[UIImage imageNamed:@"Like"] forState:UIControlStateNormal];
                    like--;
                    if (like<0) {
                        like=0;
                    }
                    liked=NO;
                    [dataDict setObject:@"0" forKey:@"is_like"];
                }else{
                    [aCell.totalLikesButton setBackgroundImage:[UIImage imageNamed:@"LikeFilled"] forState:UIControlStateNormal];
                    like++;
                    [dataDict setObject:@"1" forKey:@"is_like"];
                    liked=YES;
                }
                
                if (like==0) {
                    [aCell.openLikes setTitle:[NSString stringWithFormat:@"0"] forState:UIControlStateNormal];
                }else if(like==1){
                    [aCell.openLikes setTitle:[NSString stringWithFormat:@"%d",like] forState:UIControlStateNormal];
                }else{
                    [aCell.openLikes setTitle:[NSString stringWithFormat:@"%d",like] forState:UIControlStateNormal];
                }
                
                
                [dataDict setObject:[NSString stringWithFormat:@"%d",like] forKey:@"total_like"];
                [feedDataArray replaceObjectAtIndex:indexPath.section-1 withObject:dataDict];
    
            };
            
            cell.CommentButtonTapAction = ^(TotalLikes_Comments *aCell){
                
                };
            
         
            
            cell.openLikesTapAction = ^(TotalLikes_Comments * aCell){
                
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
        __block  NSMutableDictionary * dataDict =[feedDataArray objectAtIndex:section-1];
        
        //
        NSString *userName;
        NSString *cityName;
        NSString * userID;
        NSString * locId;
        NSString * imageUrl;
        NSArray *refertitle =[dataDict valueForKey:@"refertitle"];
        if (refertitle!=nil) {
            userName=[[refertitle objectAtIndex:0]valueForKey:@"name"];
            cityName=[[refertitle objectAtIndex:1]valueForKey:@"name"];
            userID =[dataDict valueForKey:@"posted_by"];
            locId =[[refertitle objectAtIndex:1]valueForKey:@"id"];
            imageUrl =[[refertitle objectAtIndex:1]valueForKey:@"image"];
        }
        headerView.titleLabel.text=userName;
        NSString * urlStringForProfileImage =[dataDict valueForKey:@"userImage"];
        if (![urlStringForProfileImage isKindOfClass:[NSNull class]]) {
            NSURL * profileUrl =[NSURL URLWithString:urlStringForProfileImage];
            [headerView.profileImage sd_setImageWithURL:profileUrl placeholderImage:[UIImage imageNamed:@"no_user"]options:SDWebImageRefreshCached];
        }
        
        headerView.menuButtonclick = ^(SectionHeaderOfPost *aCell){
            
            UIAlertController * view=   [UIAlertController
                                         alertControllerWithTitle:@"traWellers"
                                         message:nil
                                         preferredStyle:UIAlertControllerStyleActionSheet];
            
            NSMutableAttributedString *attribStr = [[NSMutableAttributedString alloc] initWithString:@"traWellers"];
            [attribStr addAttribute:NSFontAttributeName
                              value:[UIFont fontWithName:@"MarkerFelt-Thin" size:19]
                              range:NSMakeRange(0,10)];
            [view setValue:attribStr forKey:@"attributedTitle"];
            
            
            UIAlertAction* ok = [UIAlertAction
                                 actionWithTitle:@"Cancel"
                                 style:UIAlertActionStyleCancel
                                 handler:^(UIAlertAction * action)
                                 {
                                     
                                 }];
            UIAlertAction* edit = [UIAlertAction
                                   actionWithTitle:@"Edit Post"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action)
                                   {
                                       
                                       NSDictionary * dict =@{
                                                              @"city" : cityName,
                                                              @"state" : @"Not Specified",
                                                              @"country": @"Not Specified",
                                                              @"image":imageUrl,
                                                              @"id":locId
                                                              };
                                       
                                       
                                       UIStoryboard * userStorybord =[UIStoryboard storyboardWithName:@"CityUserActions" bundle:nil];
                                       PlaceVisitedVC * VC =[userStorybord instantiateViewControllerWithIdentifier:@"PlaceVisitedVC"];
                                       VC.postId=[dataDict valueForKey:@"id"];
                                       VC.cityDict=dict;
                                       NSDictionary * dict1 =@{
                                                               @"Key":cityName,
                                                               @"Value":@""
                                                               };
                                       VC.locationArray =  [[NSMutableArray alloc]initWithObjects:dict1,nil];
                                       
                                       NSString * str =[NSString stringWithFormat:@"%@",[dataDict valueForKey:@"activity_description"]];
                                       str = [str stringByReplacingOccurrencesOfString:@"   " withString:@" "];
                                       VC.descriptionText = [str stringByReplacingOccurrencesOfString:@"\n\n"withString:@""];
                                       
                                       UIImageView * tempImageView =[UIImageView new];
                                       NSString * urlStringForPostImage =[[[dataDict valueForKey:@"image"]lastObject]valueForKey:@"image"];
                                       if (![urlStringForPostImage isKindOfClass:[NSNull class]]) {
                                           NSURL * profileUrl =[NSURL URLWithString:urlStringForPostImage];
                                           
                                           [tempImageView sd_setImageWithURL:profileUrl placeholderImage:[UIImage imageNamed:@"PlaceHolder"]];
                                       }
                                       VC.FromFeedMenu=@"Yes";
                                       UIImage * img = tempImageView.image;
                                       if (img==nil) {
                                           img=[UIImage imageNamed:@"postPlaceholder"];
                                       }
                                       NSMutableArray * selected =[[NSMutableArray alloc]initWithObjects:img,nil];
                                       VC.selectedImagesArray = selected;
                                       VC.checkedArray=[[NSMutableArray alloc]initWithObjects:@"Yes",@"No",@"No",@"No", nil];
                                       
                                       VC.didDismiss = ^(NSDictionary *data) {
                                           
                                           [dataDict setObject:[data valueForKey:@"description"] forKey:@"activity_description"];
                                           [feedDataArray replaceObjectAtIndex:section-1 withObject:dataDict];
                                           
                                           CGPoint contentoff=self.tableview.contentOffset;
                                           [_tableview reloadData];
                                           [_tableview layoutIfNeeded];
                                           [_tableview setContentOffset:contentoff];
                                           
                                       };
                                       UINavigationController * nav =[[UINavigationController alloc]initWithRootViewController:VC];
                                       [self presentViewController:nav animated:YES completion:nil];
                                       
                                       
                                       
                                   }];
            UIAlertAction* delete = [UIAlertAction
                                     actionWithTitle:@"Delete Post"
                                     style:UIAlertActionStyleDestructive
                                     handler:^(UIAlertAction * action)
                                     {
                                         
                                         NSString * taskID =[dataDict valueForKey:@"id"];
                                         NSString * type = @"activity";
                                         NSString * apiURL=[NSString stringWithFormat:@"%@action=%@&userId=%@&taskId=%@&type=%@",URL_CONST,ACTION_FEED_DELETE,[UserData getUserID],taskID,type];
                                         
                                         [[WebHandlerManager sharedHandler] getDataWithGetRequest:apiURL completionHandler:^(NSDictionary *dic, NSError *error) {
                                             if (dic==nil) {
                                                 dispatch_async(dispatch_get_main_queue(), ^{
                                                     [Utils showWaringAlertWithTitle:nil Message:@"Internet Connection failure."];
                                                     [self.view hideLoader];
                                                 });
                                             }else{
                                                 dispatch_async(dispatch_get_main_queue(), ^{
                                                     [self.view hideLoader];
                                                 });
                                             }
                                         }];
                                         
                                         dispatch_async(dispatch_get_main_queue(), ^{
                                             NSArray * arr =[dataDict valueForKey:@"dataToshow"];
                                             [dataDict setObject:[NSArray new] forKey:@"dataToshow"];
                                             [feedDataArray replaceObjectAtIndex:section-1 withObject:dataDict];
                                             NSMutableArray *ip =[NSMutableArray new];
                                             
                                             for (int i=0; i<arr.count; i++) {
                                                 NSIndexPath * index =[NSIndexPath indexPathForRow:i inSection:section];
                                                 [ip addObject:index];
                                             }
                                             [tableView beginUpdates];
                                             [tableView deleteRowsAtIndexPaths:ip withRowAnimation:UITableViewRowAnimationLeft];
                                             [tableView endUpdates];
                                             
                                             [feedDataArray removeObjectAtIndex:section-1];
                                             
                                             [tableView beginUpdates];
                                             [tableView deleteSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationLeft];
                                             [tableView endUpdates];
                                             
                                             CGPoint contentoff=self.tableview.contentOffset;
                                             [_tableview reloadData];
                                             [_tableview layoutIfNeeded];
                                             [_tableview setContentOffset:contentoff];
                                         });
                                         
                                     }];
            UIAlertAction* share =    [UIAlertAction
                                       actionWithTitle:@"Share Post"
                                       style:UIAlertActionStyleDefault
                                       handler:^(UIAlertAction * action)
                                       {
                                           //Checked for post Image
                                           UIImageView * tempImageView =[UIImageView new];
                                           NSString * urlStringForPostImage =[[[dataDict valueForKey:@"image"]lastObject]valueForKey:@"image"];
                                           if (![urlStringForPostImage isKindOfClass:[NSNull class]]) {
                                               NSURL * profileUrl =[NSURL URLWithString:urlStringForPostImage];
                                               
                                               [tempImageView sd_setImageWithURL:profileUrl placeholderImage:[UIImage imageNamed:@"PlaceHolder"]];
                                           }
                                           
                                           NSString * mainTitleStr =[NSString stringWithFormat:@"%@",[dataDict valueForKey:@"activity_title"]];
                                           
                                           mainTitleStr =  [mainTitleStr stringByReplacingOccurrencesOfString:@"eat"
                                                                                                   withString:@"eat 🍕"];
                                           mainTitleStr =  [mainTitleStr stringByReplacingOccurrencesOfString:@"was at"
                                                                                                   withString:@"was at 🌄"];
                                           mainTitleStr =  [mainTitleStr stringByReplacingOccurrencesOfString:@"shopping"
                                                                                                   withString:@"shopping 👗"];
                                           mainTitleStr =  [mainTitleStr stringByReplacingOccurrencesOfString:@"stay"
                                                                                                   withString:@"stay 🏠"];
                                           mainTitleStr =  [mainTitleStr stringByReplacingOccurrencesOfString:@"travelling to"
                                                                                                   withString:@"travelling to ✈️ "];
                                           
                                           
                                           
                                           
                                           
                                           
                                           NSString* text=[NSString stringWithFormat: @"%@ - sent from traWeller.",mainTitleStr ];
                                           NSURL * myWebsite =[NSURL URLWithString:@"https://itunes.apple.com/us/app/traweller/id1104206830?ls=1&mt=8"];
                                           UIImage * myImage =tempImageView.image;
                                           NSArray* sharedObjects=@[text,myImage,myWebsite];
                                           UIActivityViewController * activityViewController=[[UIActivityViewController alloc]initWithActivityItems:sharedObjects applicationActivities:nil];
                                           
                                           activityViewController.popoverPresentationController.sourceView = self.view;
                                           [self presentViewController:activityViewController animated:YES completion:nil];
                                           
                                       }];
            UIAlertAction* remove = [UIAlertAction
                                     
                                     actionWithTitle:@"Report & Remove Feed"
                                     style:UIAlertActionStyleDestructive
                                     handler:^(UIAlertAction * action)
                                     {
                                         
                                         NSString * taskID =[dataDict valueForKey:@"id"];
                                         NSString * apiURL=[NSString stringWithFormat:@"%@action=blockpost&userId=%@&activity_id=%@",URL_CONST,[UserData getUserID],taskID];
                                         [[WebHandlerManager sharedHandler] getDataWithGetRequest:apiURL completionHandler:^(NSDictionary *dic, NSError *error) {
                                             if (dic==nil) {
                                                 dispatch_async(dispatch_get_main_queue(), ^{
                                                     [Utils showWaringAlertWithTitle:nil Message:@"Internet Connection failure."];
                                                     [self.view hideLoader];
                                                 });
                                             }else{
                                                 dispatch_async(dispatch_get_main_queue(), ^{
                                                     [self.view hideLoader];
                                                 });
                                             }
                                         }];
                                         
                                         dispatch_async(dispatch_get_main_queue(), ^{
                                             NSArray * arr =[dataDict valueForKey:@"dataToshow"];
                                             [dataDict setObject:[NSArray new] forKey:@"dataToshow"];
                                             [feedDataArray replaceObjectAtIndex:section-1 withObject:dataDict];
                                             NSMutableArray *ip =[NSMutableArray new];
                                             for (int i=0; i<arr.count; i++) {
                                                 NSIndexPath * index =[NSIndexPath indexPathForRow:i inSection:section];
                                                 [ip addObject:index];
                                             }
                                             [tableView beginUpdates];
                                             [tableView deleteRowsAtIndexPaths:ip withRowAnimation:UITableViewRowAnimationLeft];
                                             [tableView endUpdates];
                                             
                                             [feedDataArray removeObjectAtIndex:section-1];
                                             
                                             [tableView beginUpdates];
                                             [tableView deleteSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationLeft];
                                             [tableView endUpdates];
                                             
                                             CGPoint contentoff=self.tableview.contentOffset;
                                             [_tableview reloadData];
                                             [_tableview layoutIfNeeded];
                                             [_tableview setContentOffset:contentoff];
                                         });
                                         
                                     }];
            
            NSString * userID;
            
            userID =[dataDict valueForKey:@"posted_by"];
            
            [view addAction:ok];
            if ([userID isEqualToString:[UserData getUserID]]) {
                [view addAction:edit];
                [view addAction:delete];
            }else{
                [view addAction:remove];
            }
            [view addAction:share];
            
            
            CGPoint windowPoint = [aCell convertPoint:aCell.menuBtn.bounds.origin toView:self.view.window];
            view.popoverPresentationController.sourceView = self.view;
            view.popoverPresentationController.sourceRect = CGRectMake(aCell.menuBtn.frame.origin.x, windowPoint.y+15, aCell.menuBtn.frame.size.width, aCell.menuBtn.frame.size.height);;
            [self presentViewController: view animated:YES completion:nil];
        };
        
        headerView.clickedOnname = ^(SectionHeaderOfPost *aCell){
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                OtherProfileViewVC * VC =[self.storyboard instantiateViewControllerWithIdentifier:@"OtherProfileViewVC"];
                VC.title=userName;
                VC.userIdOfSelectedUser=userID;
                VC.hidesBottomBarWhenPushed=YES;
                if (![userID isEqualToString:[UserData getUserID]]) {
                    [self.navigationController pushViewController:VC animated:YES];
                }else{
                    //                self.tabBarController.selectedIndex=4;
                    //                for (UINavigationController *controller in self.tabBarController.viewControllers)
                    //                {
                    //                    if ([controller isKindOfClass:[ProfileVC class]])
                    //                    {
                    //                        [self.tabBarController setSelectedViewController:controller];
                    //                        break;
                    //                    }
                    //                }
                }
            });
            
            
            
        };
        
        
    }
    
    //headerView.layer.borderWidth=0.5;
    headerView.layer.borderColor= [UIColor colorWithRed: 204.0/255.0 green: 204.0/255.0 blue: 204.0/255.0 alpha:1.0].CGColor;
    
    UIView *view = [[UIView alloc] initWithFrame:[headerView frame]];
    headerView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [view addSubview:headerView];
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return UITableViewAutomaticDimension;
    }else{
        
        NSMutableDictionary * dataDict =[[NSMutableDictionary alloc]initWithDictionary:[feedDataArray objectAtIndex:indexPath.section-1]];
        NSArray * arr =[dataDict valueForKey:@"dataToshow"];
        
        if ([[arr objectAtIndex:indexPath.row]isEqualToString:@"PostImage"]) {
            
            NSArray * postImageArr =[[NSArray alloc]initWithArray:[dataDict valueForKey:@"image"]];
            if (postImageArr.count>1) {
                if (iPAD) {
                    return  600;
                }else{
                    if (iPhone6plus) {
                        return  360;
                    }else  if (iPhone6) {
                        return  320;
                    }else{
                        return  280;
                    }
                }
            }
            
            
            
        }else{
            return UITableViewAutomaticDimension;
        }
        
    }
    return UITableViewAutomaticDimension;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (section==0) {
        return CGFLOAT_MIN;
    }else{
        return 60.0f;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    NSURLCache * const urlCache = [NSURLCache sharedURLCache];
    const NSUInteger memoryCapacity = urlCache.memoryCapacity;
    urlCache.memoryCapacity = 0;
    urlCache.memoryCapacity = memoryCapacity;
    
}


#pragma mark - UICollectionViewDataSource Methods

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return suggestedData.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SuggestedPeopleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionViewCellIdentifier forIndexPath:indexPath];
    
    NSDictionary * dataDict =[suggestedData objectAtIndex:indexPath.row];
    
    NSString * city =[dataDict valueForKey:@"city"];
    NSString * name =[dataDict valueForKey:@"name"];
    NSString * image =[dataDict valueForKey:@"image"];
    
    [cell.profileImage sd_setImageWithURL:[NSURL URLWithString:image] placeholderImage:[UIImage imageNamed:@"no_user"]];
    cell.titleLabel.text=name;
    cell.subTitleLabel.text = city;
    
    int  follow =[[dataDict valueForKey:@"follow"]intValue];
    if (follow==1) {
        cell.FollowButton.layer.borderColor=greenButtonColor.CGColor;
        [cell.FollowButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [cell.FollowButton setBackgroundColor:greenButtonColor];
        [cell.FollowButton setTitle:@"Following" forState:UIControlStateNormal];
        cell.FollowButton.layer.borderColor=greenButtonColor.CGColor;
    }else{
        cell.FollowButton.layer.borderColor=blueButtonColor.CGColor;
        [cell.FollowButton setTitleColor:blueButtonColor  forState:UIControlStateNormal];
        [cell.FollowButton setBackgroundColor:[UIColor whiteColor]];
        [cell.FollowButton setTitle:@"+ Follow" forState:UIControlStateNormal];
        cell.FollowButton.layer.borderColor=blueButtonColor.CGColor;
    }
    
    cell.followButtonClick=^(SuggestedPeopleCollectionViewCell *aCell){
        int  follow =[[dataDict valueForKey:@"follow"]intValue];
        if (follow==0) {
            aCell.FollowButton.layer.borderColor=greenButtonColor.CGColor;
            [aCell.FollowButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [aCell.FollowButton setBackgroundColor:greenButtonColor];
            [aCell.FollowButton setTitle:@"Following" forState:UIControlStateNormal];
            aCell.FollowButton.layer.borderColor=greenButtonColor.CGColor;
            [UserData incrementFollowingCount];
            minFollowPeopleCount++;
            if (minFollowPeopleCount==2) {
                [[[[self.tabBarController tabBar]items]objectAtIndex:1]setEnabled:YES];
                [[[[self.tabBarController tabBar]items]objectAtIndex:2]setEnabled:YES];
                [[[[self.tabBarController tabBar]items]objectAtIndex:3]setEnabled:YES];
                [[[[self.tabBarController tabBar]items]objectAtIndex:4]setEnabled:YES];
                
                indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
                indicator.center = self.view.center;
                [indicator startAnimating];
                [self.view addSubview:indicator];
                
                
                minimumFollowLabel.hidden=YES;
                appLogoPlaceHolder.hidden=YES;
                Page =1 ;
                
                feedDataArray=[NSMutableArray new];
                suggestedData=[NSMutableArray new];
                
                [self getFeedData];
                
            }
        }else{
            aCell.FollowButton.layer.borderColor=blueButtonColor.CGColor;
            [aCell.FollowButton setTitleColor:blueButtonColor  forState:UIControlStateNormal];
            [aCell.FollowButton setBackgroundColor:[UIColor whiteColor]];
            [aCell.FollowButton setTitle:@"Follow" forState:UIControlStateNormal];
            aCell.FollowButton.layer.borderColor=blueButtonColor.CGColor;
            [UserData decrementFollowingCount];
            minFollowPeopleCount--;
        }
        
        NSString * publicId =[dataDict valueForKey:@"id"];
        NSString * userID =[UserData getUserID];
        NSString *apiURL =  [NSString stringWithFormat:@"%@action=%@&userId=%@&publicId=%@",URL_CONST,ACTION_ADD_FOLLOWER, userID,publicId];
        [[WebHandlerManager sharedHandler] getDataWithGetRequest:apiURL completionHandler:^(NSDictionary *dic, NSError *error) {
            if (dic==nil) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [Utils showWaringAlertWithTitle:nil Message:@"Internet Connection failure."];
                    [self.view hideLoader];
                    
                });
            }else{
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.view hideLoader];
                    //                    [collectionView performBatchUpdates:^{
                    //                        
                    //                        [suggestedData removeObjectAtIndex:indexPath.row];
                    //                        [collectionView deleteItemsAtIndexPaths:[NSArray arrayWithObject:indexPath]];
                    //                        
                    //                    } completion:^(BOOL finished) {
                    //                        [collectionView reloadItemsAtIndexPaths:[collectionView indexPathsForVisibleItems]];
                    //                    }];
                });
            }
        }];
    };
    
    
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
