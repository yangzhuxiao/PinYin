//
//  SecondViewController.m
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/23/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import "PracticeRootViewController.h"
#import "ListenViewFlowLayout.h"
#import "ListenCollectionViewCell.h"
#import "PracticeOneViewController.h"
#import "PracticeTwoViewController.h"
#import "PracticeThreeViewController.h"
#import "Constants.h"

@interface PracticeRootViewController () < UICollectionViewDataSource, UIActionSheetDelegate >

@property (strong, nonatomic) UICollectionView *categoryCollectionView;
@property (strong, nonatomic) UILabel *viewTitleLabel;
@property (nonatomic, copy) NSArray *catogoriesArray;

@end

@implementation PracticeRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _catogoriesArray = @[@"Select the right tones according to recording and Pinyin", @"Write down the right Pinyin according to recording and the tones", @"Write down the right Pinyin and tones according to the recording"];
    
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
    ListenViewFlowLayout *calendarLayout = [[ListenViewFlowLayout alloc] init];
    
    calendarLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    calendarLayout.itemSize = CGSizeMake(ItemWidth, ItemHeight);
    calendarLayout.sectionInset = UIEdgeInsetsMake(SectionInsetTop, SectionInsetLeft, SectionInsetBottom, SectionInsetRight);
    calendarLayout.minimumLineSpacing = MinimumLineSpacing;
    
    _categoryCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, CollectionViewYUpperOffset, CollectionViewWidth, CollectionViewHeight) collectionViewLayout:calendarLayout];
    _categoryCollectionView.dataSource = self;
    
    [_categoryCollectionView registerClass:[ListenCollectionViewCell class] forCellWithReuseIdentifier:@"ListenCell"];
    
    [self.view addSubview:_categoryCollectionView];
    _categoryCollectionView.backgroundColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:0.1];
    
    //    self.view.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0 alpha:1];
    
}

- (void)selectConfirmed:(id)sender
{
    
    ListenCollectionViewCell *selectedCell;
    id superView1 = [sender superview];
    if ([superView1 isKindOfClass:[ListenCollectionViewCell class]]) {
        selectedCell = (ListenCollectionViewCell *)superView1;
    } else {
        id superView2 = [superView1 superview];
        if ([superView2 isKindOfClass:[ListenCollectionViewCell class]]) {
            selectedCell = (ListenCollectionViewCell *)superView2;
        } else {
            id superView3 = [superView2 superview];
            if ([superView3 isKindOfClass:[ListenCollectionViewCell class]]) {
                selectedCell = (ListenCollectionViewCell *)superView3;
            } else return;
        }
    }
    
    if (selectedCell.tag == 0) {
        PracticeOneViewController *oneController = [[PracticeOneViewController alloc] init];
        [self presentViewController:oneController animated:YES completion:nil];
    } else if (selectedCell.tag == 1) {
        PracticeTwoViewController *twoController = [[PracticeTwoViewController alloc] init];
        [self presentViewController:twoController animated:YES completion:nil];
    } else if (selectedCell.tag == 2) {
        PracticeThreeViewController *threeController = [[PracticeThreeViewController alloc] init];
        [self presentViewController:threeController animated:YES completion:nil];
    }
}

#pragma mark - UICollectionView Data Source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _catogoriesArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ListenCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ListenCell" forIndexPath: indexPath];
    
    cell.contentLabel.text = _catogoriesArray[indexPath.row];
    [cell.selectButton addTarget:self action:@selector(selectConfirmed:) forControlEvents:UIControlEventTouchUpInside];
    cell.tag = indexPath.row;
    return cell;
}

@end






