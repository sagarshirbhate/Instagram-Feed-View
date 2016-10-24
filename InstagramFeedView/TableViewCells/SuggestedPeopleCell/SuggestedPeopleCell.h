//
//  SuggestedPeopleCell.h
//  Traweller
//
//  Created by Sagar Shirbhate on 8/11/16.
//  Copyright © 2016 Sagar Shirbhate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SuggestedPeopleCollectionViewCell.h"

@interface CollectionView : UICollectionView

@property (nonatomic, strong) NSIndexPath *indexPath;

@end

static NSString *CollectionViewCellIdentifier = @"SuggestedPeopleCollectionViewCell";


@interface SuggestedPeopleCell : UITableViewCell

@property (nonatomic, strong) CollectionView *collectionView;

- (void)setCollectionViewDataSourceDelegate:(id<UICollectionViewDataSource, UICollectionViewDelegate>)dataSourceDelegate indexPath:(NSIndexPath *)indexPath;

@end
