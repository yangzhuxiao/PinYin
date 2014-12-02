//
//  PracticeTwoViewController.m
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/27/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import "PracticeTwoViewController.h"
#import "PracticeTwoCollectionViewCell.h"
#import "Constants.h"

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
    PracticeTwoCollectionViewCell *selectedCell;
    id superView1 = [sender superview];
    if ([superView1 isKindOfClass:[PracticeTwoCollectionViewCell class]]) {
        selectedCell = (PracticeTwoCollectionViewCell *)superView1;
    } else {
        id superView2 = [superView1 superview];
        if ([superView2 isKindOfClass:[PracticeTwoCollectionViewCell class]]) {
            selectedCell = (PracticeTwoCollectionViewCell *)superView2;
        } else {
            id superView3 = [superView2 superview];
            if ([superView3 isKindOfClass:[PracticeTwoCollectionViewCell class]]) {
                selectedCell = (PracticeTwoCollectionViewCell *)superView3;
            } else return;
        }
    }
    if ([selectedCell.pinyinOneTextField.text isEqualToString:self.firstPinyin]
        && [selectedCell.pinyinTwoTextField.text isEqualToString:self.secondPinyin]) {
        selectedCell.congratulateLabel.hidden = NO;
        self.correctNumber ++;
    } else {
        selectedCell.righAnswerLabel.hidden = NO;
    }
    selectedCell.confirmSelectionButton.hidden = YES;
    self.currentIndex ++;
    [self updateCountLabel];
}

#pragma mark - UICollectionView Data Source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PracticeTwoCollectionViewCell *cell;
    
    if ([collectionView.panGestureRecognizer velocityInView:self.view].x>0 ) {
        // must plus 1, cuz the reuse mechanism
        NSIndexPath *newIndexPath = [NSIndexPath indexPathForItem:(indexPath.item+1) inSection:indexPath.section];
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TwoCell" forIndexPath:newIndexPath];
        self.currentPhrase = self.dataArray[newIndexPath.row];
        cell.tag = newIndexPath.row;
        self.itemCollectionView.scrollEnabled = NO;
        self.itemCollectionView.scrollEnabled = YES;
    }
    else {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TwoCell" forIndexPath:indexPath];
        self.currentPhrase = self.dataArray[indexPath.row];
        cell.tag = indexPath.row;
    }
    
    // must do this, otherwise the two buttons will be seen !
    cell.congratulateLabel.hidden = YES;
    cell.righAnswerLabel.hidden = YES;
    cell.confirmSelectionButton.hidden = NO;
    cell.pinyinOneTextField.text = @"";
    cell.pinyinTwoTextField.text = @"";

    // play once immediately
    [self setUpAudioPlayerWithMp3FilePath:self.currentPhrase.mp3Path];
    
    // store the right pinyin for latter comparing use
    NSArray *pinYinWithoutTones = [[self.currentPhrase pinyinWithoutTones] componentsSeparatedByString:@" "];
    self.firstPinyin = pinYinWithoutTones[0];
    self.secondPinyin = pinYinWithoutTones[1];
    
    cell.toneLabelOne.text = [[[self.currentPhrase tones] substringToIndex:toneStringLength] substringWithRange:NSMakeRange(2, 1)];
    cell.toneLabelTwo.text = [[[self.currentPhrase tones] substringFromIndex:toneStringLength] substringWithRange:NSMakeRange(2, 1)];

    
    cell.righAnswerLabel.text = [NSString stringWithFormat:@"Sorry! The answer is \n\" %@\"", self.currentPhrase.pinyinFull];
    
    // set textfield's delegate
    cell.pinyinOneTextField.delegate = self;
    cell.pinyinTwoTextField.delegate = self;

    // register for touch event
    [cell.playButton addTarget:self action:@selector(playMP3File:) forControlEvents:UIControlEventTouchUpInside];
    // register for confimation Input
    [cell.confirmSelectionButton addTarget:self action:@selector(confirmSelection:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

#pragma mark - UITextField Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
