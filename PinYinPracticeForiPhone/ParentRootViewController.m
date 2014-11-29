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
    [self setUpListenCollectionView];
    [self setUpViewTitleLabel];
}

- (void)setUpViewTitleLabel
{
    _viewTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(TitleLabelXOffset, TitleLabelYOffset, TitleLabelWidth, TitleLabelHeight)];
    _viewTitleLabel.numberOfLines = 0;
    _viewTitleLabel.text = @"Pick the test";
    _viewTitleLabel.textAlignment = NSTextAlignmentCenter;
    _viewTitleLabel.textColor = [UIColor blackColor];
    _viewTitleLabel.font = [UIFont systemFontOfSize:TitleLabelFontPercentWidth * WIDTH];
    _viewTitleLabel.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.2];
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
    
    [_categoryCollectionView registerClass:[ParentRootCollectionViewCell class] forCellWithReuseIdentifier:@"ListenCell"];
    
    [self.view addSubview:_categoryCollectionView];
    _categoryCollectionView.backgroundColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:0.1];
    
    //    self.view.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0 alpha:1];
    
}

//- (void)selectConfirmed:(id)sender
//{
//    id superView1 = [sender superview];
//    if ([superView1 isKindOfClass:[ParentRootCollectionViewCell class]]) {
//        _selectedCell = (ParentRootCollectionViewCell *)superView1;
//    } else {
//        id superView2 = [superView1 superview];
//        if ([superView2 isKindOfClass:[ParentRootCollectionViewCell class]]) {
//            _selectedCell = (ParentRootCollectionViewCell *)superView2;
//        } else {
//            id superView3 = [superView2 superview];
//            if ([superView3 isKindOfClass:[ParentRootCollectionViewCell class]]) {
//                _selectedCell = (ParentRootCollectionViewCell *)superView3;
//            } else return;
//        }
//    }
//}

#pragma mark - UICollectionView Data Source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _catogoriesArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ParentRootCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ListenCell" forIndexPath: indexPath];
    
    cell.contentLabel.text = _catogoriesArray[indexPath.row];
    [cell.selectButton addTarget:self action:@selector(selectConfirmed:) forControlEvents:UIControlEventTouchUpInside];
    cell.tag = indexPath.row;
    return cell;
}

@end
