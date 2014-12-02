//
//  PracticeOneViewController.m
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/26/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import "PracticeOneViewController.h"
#import "PracticeOneCollectionViewCell.h"
#import "Constants.h"

@implementation PracticeOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.itemCollectionView.delegate = self;
    self.itemCollectionView.dataSource = self;
    [self.itemCollectionView registerClass:[PracticeOneCollectionViewCell class] forCellWithReuseIdentifier:@"OneCell"];
}

- (void)playMP3File:(id)sender {
//    [sender setSelected:YES];
//    NSLog(@"%@", [[sender titleLabel] textColor]);
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

- (void)toneIsSelected:(id)sender {
    if ([sender tag] >= 10) {
        [self.selectedButtonSecondRow setSelected:NO];
        self.selectedButtonSecondRow = sender;
        [self.selectedButtonSecondRow setSelected:YES];
        self.tempSecondTone = [sender titleLabel].text;
    } else if ([sender tag] < 10) {
        [self.selectedButtonFirstRow setSelected:NO];
        self.selectedButtonFirstRow = sender;
        [self.selectedButtonFirstRow setSelected:YES];
        self.tempFirstTone = [sender titleLabel].text;
    }
}

- (void)confirmSelection:(id)sender {
    PracticeOneCollectionViewCell *selectedCell;
    id superView1 = [sender superview];
    if ([superView1 isKindOfClass:[PracticeOneCollectionViewCell class]]) {
        selectedCell = (PracticeOneCollectionViewCell *)superView1;
    } else {
        id superView2 = [superView1 superview];
        if ([superView2 isKindOfClass:[PracticeOneCollectionViewCell class]]) {
            selectedCell = (PracticeOneCollectionViewCell *)superView2;
        } else {
            id superView3 = [superView2 superview];
            if ([superView3 isKindOfClass:[PracticeOneCollectionViewCell class]]) {
                selectedCell = (PracticeOneCollectionViewCell *)superView3;
            } else return;
        }
    }
    if ([self.tempFirstTone isEqualToString:self.firstTone]
        && [self.tempSecondTone isEqualToString:self.secondTone]) {
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
    PracticeOneCollectionViewCell *cell;
    
    if ([collectionView.panGestureRecognizer velocityInView:self.view].x>0 ) {
        // must plus 1, cuz the reuse mechanism
        NSIndexPath *newIndexPath = [NSIndexPath indexPathForItem:(indexPath.item+1) inSection:indexPath.section];
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"OneCell" forIndexPath:newIndexPath];
        self.currentPhrase = self.dataArray[newIndexPath.row];
        cell.tag = newIndexPath.row;
        self.itemCollectionView.scrollEnabled = NO;
        self.itemCollectionView.scrollEnabled = YES;
    }
    else {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"OneCell" forIndexPath:indexPath];
        self.currentPhrase = self.dataArray[indexPath.row];
        cell.tag = indexPath.row;
    }
    
    // must do this, otherwise the buttons will be seen !
    cell.congratulateLabel.hidden = YES;
    cell.righAnswerLabel.hidden = YES;
    cell.confirmSelectionButton.hidden = NO;
    
    // play once immediately
    [self setUpAudioPlayerWithMp3FilePath:self.currentPhrase.mp3Path];
    // store the right tones for latter comparing use
    self.firstTone = [[self.currentPhrase tones] substringToIndex:toneStringLength];
    self.secondTone = [[self.currentPhrase tones] substringFromIndex:toneStringLength];
    NSArray *pinYinWithoutTones = [[self.currentPhrase pinyinWithoutTones] componentsSeparatedByString:@" "];
    cell.PinYinLabelOne.text = pinYinWithoutTones[0];
    cell.PinYinLabelTwo.text = pinYinWithoutTones[1];
    cell.righAnswerLabel.text = [NSString stringWithFormat:@"Sorry! The answer is \n\" %@\"", self.currentPhrase.pinyinFull];
    // register for touch event
    [cell.playButton addTarget:self action:@selector(playMP3File:) forControlEvents:UIControlEventTouchUpInside];
    // register for confimation Input
    [cell.confirmSelectionButton addTarget:self action:@selector(confirmSelection:) forControlEvents:UIControlEventTouchUpInside];
    // register for tone selection
    for (id subview in cell.contentView.subviews) {
        if ([subview isKindOfClass:[UIButton class]]
            && subview != cell.playButton
            && subview != cell.confirmSelectionButton) {
            [subview addTarget:self action:@selector(toneIsSelected:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    _selectedCell = cell;
    return cell;
}

@end
