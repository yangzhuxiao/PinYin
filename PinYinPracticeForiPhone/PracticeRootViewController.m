//
//  SecondViewController.m
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/23/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import "ParentRootViewController.h"
#import "PracticeRootViewController.h"
#import "PracticeOneViewController.h"
#import "PracticeTwoViewController.h"
#import "PracticeThreeViewController.h"
#import "Constants.h"

@implementation PracticeRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewTitleLabel.text = @"Pick the test";
    self.catogoriesArray = @[[self attributedStringFromString:@"Select the right tones"],
                             [self attributedStringFromString:@"Write down the \nright pinyin"],
                             [self attributedStringFromString:@"Write down the right \npinyin and tones"]];
}

- (NSMutableAttributedString *)attributedStringFromString:(NSString *)string
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    [attributedString addAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Thin" size:listenCellLabelWordsFontPercentWidth * WIDTH]} range:NSMakeRange(0, attributedString.length)];
    return attributedString;
}


- (void)selectConfirmed:(id)sender
{
    if (self.selectedCellIndex == 0) {
        PracticeOneViewController *oneController = [[PracticeOneViewController alloc] init];
        [self presentViewController:oneController animated:YES completion:nil];
    } else if (self.selectedCellIndex == 1) {
        PracticeTwoViewController *twoController = [[PracticeTwoViewController alloc] init];
        [self presentViewController:twoController animated:YES completion:nil];
    } else if (self.selectedCellIndex == 2) {
        PracticeThreeViewController *threeController = [[PracticeThreeViewController alloc] init];
        [self presentViewController:threeController animated:YES completion:nil];
    }
}

#pragma mark - UICollectionView Data Source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.catogoriesArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ParentRootCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ListenCell" forIndexPath:indexPath];
    [cell.selectButton setTitle:@"Press to enter" forState:UIControlStateNormal];
    cell.contentLabel.attributedText = self.catogoriesArray[indexPath.row];
    [cell.selectButton addTarget:self action:@selector(selectConfirmed:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

@end
