//
//  SuggestedPeopleCell.m
//  Traweller
//
//  Created by Sagar Shirbhate on 8/11/16.
//  Copyright © 2016 Sagar Shirbhate. All rights reserved.
//

#import "SuggestedPeopleCell.h"

@implementation CollectionView

@end


@implementation SuggestedPeopleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(10, 10,-15, 10);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionView = [[CollectionView alloc] initWithFrame:CGRectMake(0, 150, self.contentView.frame.size.width, 130) collectionViewLayout:layout];
    [self.collectionView registerClass:[SuggestedPeopleCollectionViewCell class] forCellWithReuseIdentifier:CollectionViewCellIdentifier];
    
    UINib *cellNib = [UINib nibWithNibName:@"SuggestedPeopleCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"SuggestedPeopleCollectionViewCell"];
    
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.showsHorizontalScrollIndicator = NO;
    [self.contentView addSubview:self.collectionView];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.collectionView.frame = self.contentView.bounds;
}

- (void)setCollectionViewDataSourceDelegate:(id<UICollectionViewDataSource, UICollectionViewDelegate>)dataSourceDelegate indexPath:(NSIndexPath *)indexPath
{
    self.collectionView.dataSource = dataSourceDelegate;
    self.collectionView.delegate = dataSourceDelegate;
    self.collectionView.indexPath = indexPath;
    [self.collectionView reloadData];
}


@end
