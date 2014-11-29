//
//  PracticeTwoViewController.m
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/27/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import "PracticeTwoViewController.h"
#import "PracticeTwoCollectionViewCell.h"

@implementation PracticeTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.itemCollectionView.delegate = self;
    self.itemCollectionView.dataSource = self;
    [self.itemCollectionView registerClass:[PracticeTwoCollectionViewCell class] forCellWithReuseIdentifier:@"TwoCell"];
}

- (void)playMP3File:(id)sender {
    if (self.audioPlayer.isPlaying == YES) {
        [self.audioPlayer stop];
        //very important, otherwise start from where stopped last time
        self.audioPlayer.currentTime = 0;
        [self.audioPlayer play];
        return;
    }
    [self.audioPlayer play];
}

- (void)backToRoot:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)confirmSelection:(id)sender {
    if ([_selectedCell.pinyinOneTextField.text isEqualToString:self.firstPinyin]
        && [_selectedCell.pinyinTwoTextField.text isEqualToString:self.secondPinyin]) {
        _selectedCell.congratulateLabel.hidden = NO;
        self.correctNumber ++;
    } else {
        _selectedCell.righAnswerLabel.hidden = NO;
    }
    _selectedCell.confirmInputButton.hidden = YES;
    [self updateCountLabel];
}

#pragma mark - UICollectionView Data Source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.pinYinWithoutToneArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PracticeTwoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TwoCell" forIndexPath: indexPath];
    
    // must do this, otherwise the two buttons will be seen !
    _selectedCell.confirmInputButton.hidden= NO;
    cell.congratulateLabel.hidden = YES;
    cell.righAnswerLabel.hidden = YES;
    cell.pinyinOneTextField.text = @"";
    cell.pinyinTwoTextField.text = @"";

    // store the right pinyin for latter comparing use
    NSString *pinyinString = self.pinYinWithoutToneArray[indexPath.row];
    NSArray *pinyinArray = [pinyinString componentsSeparatedByString:@" "];
    self.firstPinyin = pinyinArray[0];
    self.secondPinyin = pinyinArray[1];
    
    cell.toneLabelOne.text = self.tonesArray[indexPath.row][0];
    cell.toneLabelTwo.text = self.tonesArray[indexPath.row][1];
    
    cell.righAnswerLabel.text = [NSString stringWithFormat:@"Sorry! The answer is \n\" %@\"", self.pinYinWithToneArray[indexPath.row]];
    
    // register for touch event
    [cell.playButton addTarget:self action:@selector(playMP3File:) forControlEvents:UIControlEventTouchUpInside];
    // register for confimation Input
    [cell.confirmInputButton addTarget:self action:@selector(confirmSelection:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.audioPlayer stop];
    self.audioPlayer.currentTime = 0;
    [self.audioPlayer play];
    
    _selectedCell = cell;
    return cell;
}

@end
