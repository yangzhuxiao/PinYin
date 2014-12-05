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
    
    _isFirstLaunchingPrac1 = YES;
    _isFirstLaunchingPrac2 = YES;
    _isFirstLaunchingPrac3 = YES;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(stopShowingPracticeOneAlert) name:@"Don't show practice one alert again" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(stopShowingPracticeTwoAlert) name:@"Don't show practice two alert again" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(stopShowingPracticeThreeAlert) name:@"Don't show practice three alert again" object:nil];

    self.viewTitleLabel.text = @"Pick the test";
    self.catogoriesArray = @[[self attributedStringFromString:@"Select the right tones"],
                             [self attributedStringFromString:@"Write down the \nright pinyin"],
                             [self attributedStringFromString:@"Write down the right \npinyin and tones"]];
}

- (void)stopShowingPracticeOneAlert
{
    _isFirstLaunchingPrac1 = NO;
}

- (void)stopShowingPracticeTwoAlert
{
    _isFirstLaunchingPrac2 = NO;
}

- (void)stopShowingPracticeThreeAlert
{
    _isFirstLaunchingPrac3 = NO;
}

- (NSMutableAttributedString *)attributedStringFromString:(NSString *)string
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    [attributedString addAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Thin" size:listenCellLabelWordsFontPercentWidth * WIDTH]} range:NSMakeRange(0, attributedString.length)];
    return attributedString;
}


- (void)selectConfirmed:(id)sender
{
//    if (self.selectedCellIndex == 0) {
//        PracticeOneViewController *oneController = [[PracticeOneViewController alloc] init];
//        [self presentViewController:oneController animated:YES completion:nil];
//    } else if (self.selectedCellIndex == 1) {
//        PracticeTwoViewController *twoController = [[PracticeTwoViewController alloc] init];
//        [self presentViewController:twoController animated:YES completion:nil];
//    } else if (self.selectedCellIndex == 2) {
//        PracticeThreeViewController *threeController = [[PracticeThreeViewController alloc] init];
//        [self presentViewController:threeController animated:YES completion:nil];
//    }
    
    if (self.selectedCellIndex == 0) {
        PracticeOneViewController *oneController = [[PracticeOneViewController alloc] init];
        if (_isFirstLaunchingPrac1 == YES) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Select the tones you think right according to the recording and given pinyin. Click speaker icon to repeat. Click \"Done\" to see the right answer. Scroll right to next question after clicking \"Done\"" delegate:oneController cancelButtonTitle:@"Don't show again" otherButtonTitles:@"Show every time", nil];
            [alert show];
        }
        [self presentViewController:oneController animated:YES completion:nil];
    } else if (self.selectedCellIndex == 1) {
        PracticeTwoViewController *twoController = [[PracticeTwoViewController alloc] init];
        if (_isFirstLaunchingPrac2 == YES) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Write down the pinyin you think right according to the recording and the given tones. Click speaker icon to repeat. Click \"Done\" to see the answer. Scroll right to next question after clicking \"Done\"" delegate:twoController cancelButtonTitle:@"Don't show again" otherButtonTitles:@"Show every time", nil];
            [alert show];
        }
        [self presentViewController:twoController animated:YES completion:nil];
    } else if (self.selectedCellIndex == 2) {
        PracticeThreeViewController *threeController = [[PracticeThreeViewController alloc] init];
        if (_isFirstLaunchingPrac3 == YES) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Write down the pinyin and tones you think right according to the recording. Click speaker icon to repeat. Click \"Done\" to see the answer. Scroll right to next question after clicking \"Done\"" delegate:threeController cancelButtonTitle:@"Don't show again" otherButtonTitles:@"Show every time", nil];
            [alert show];
        }
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
