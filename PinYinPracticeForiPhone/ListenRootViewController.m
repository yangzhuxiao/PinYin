//
//  FirstViewController.m
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/23/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import "ListenRootViewController.h"
#import "ListenCollectionViewCell.h"
#import "ListenViewFlowLayout.h"
#import "Constants.h"
#import "ListenItemViewController.h"


@interface ListenRootViewController () < UICollectionViewDataSource, UIActionSheetDelegate >

@property (strong, nonatomic) UICollectionView *categoryCollectionView;
@property (strong, nonatomic) UILabel *viewTitleLabel;
@property (nonatomic, copy) NSArray *catogoriesArray;

@end

@implementation ListenRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _catogoriesArray = @[@"Level Tone", @"Rising Tone", @"Falling-rising Tone", @"Falling Tone"];
    
    // watch the order!
    [self setUpListenCollectionView];
    [self setUpViewTitleLabel];
}

- (void)setUpViewTitleLabel
{
    _viewTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(TitleLabelXOffset, TitleLabelYOffset, TitleLabelWidth, TitleLabelHeight)];
    _viewTitleLabel.numberOfLines = 0;
    _viewTitleLabel.text = @"Pick the tone of \nthe first character";
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
    _categoryCollectionView.delegate = self;
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
    NSUInteger cellIndex = selectedCell.tag;
    NSString *actionSheetTitle;
    switch (cellIndex) {
        case 0:
            actionSheetTitle = @"Level Tone With";
            break;
        case 1:
            actionSheetTitle = @"Rising Tone With";
            break;
        case 2:
            actionSheetTitle = @"Falling-rising Tone With";
            break;
        case 3:
            actionSheetTitle = @"Falling Tone With";
            break;
        default:
            actionSheetTitle = @"";
            break;
    }
    
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:actionSheetTitle delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"level Tone", @"rising Tone", @"falling-rising tone", @"falling tone", @"neutral tone", nil];
    [sheet showInView:self.view];
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

#pragma mark - UIActionSheet Delegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    ListenItemViewController *itemController = [[ListenItemViewController alloc] init];
    
    switch (buttonIndex) {
        case 0:
            [self presentViewController:itemController animated:YES completion:nil];
            break;
        case 1:

            break;
        case 2:

            break;
        case 3:

            break;
        default:

            break;
    }
}

@end
