//
//  ParentRootViewController.m
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/29/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import "ParentRootViewController.h"
#import "ParentRootViewFlowLayout.h"
#import "Constants.h"

@implementation ParentRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // watch the order!
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpListenCollectionView];
    [self setUpViewTitleLabel];
}

- (void)setUpViewTitleLabel
{
    _viewTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(TitleLabelXOffset, TitleLabelYOffset, TitleLabelWidth, TitleLabelHeight)];
    _viewTitleLabel.numberOfLines = 0;
    _viewTitleLabel.textAlignment = NSTextAlignmentCenter;
    _viewTitleLabel.textColor = txtColor;
    _viewTitleLabel.font = [UIFont systemFontOfSize:TitleLabelFontPercentWidth * WIDTH];
    [self.view addSubview:_viewTitleLabel];
}

- (void)setUpListenCollectionView
{
    //calendarLayout
    ParentRootViewFlowLayout *calendarLayout = [[ParentRootViewFlowLayout alloc] init];
    
    calendarLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    calendarLayout.itemSize = CGSizeMake(ItemWidth, ItemHeight);
    calendarLayout.sectionInset = UIEdgeInsetsMake(SectionInsetTop, SectionInsetLeft, SectionInsetBottom, SectionInsetRight);
    calendarLayout.minimumLineSpacing = MinimumLineSpacing;
    
    _categoryCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, CollectionViewYUpperOffset, CollectionViewWidth, CollectionViewHeight) collectionViewLayout:calendarLayout];
    _categoryCollectionView.dataSource = self;
    ((UIScrollView *)_categoryCollectionView).delegate = self;
    
    [_categoryCollectionView registerClass:[ParentRootCollectionViewCell class] forCellWithReuseIdentifier:@"ListenCell"];
    
    [self.view addSubview:_categoryCollectionView];
    _categoryCollectionView.backgroundColor = bgColor;
}

#pragma mark - UICollectionView Data Source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _catogoriesArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ParentRootCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ListenCell" forIndexPath:indexPath];
    
    cell.contentLabel.text = _catogoriesArray[indexPath.row];
    [cell.selectButton addTarget:self action:@selector(selectConfirmed:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

#pragma mark - UIScrollView Delegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int index = fabs(scrollView.contentOffset.x)/(ItemWidth + MinimumLineSpacing);
    _selectedCellIndex = index;
}

@end
