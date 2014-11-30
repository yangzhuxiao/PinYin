//
//  PracticeOneViewController.m
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/26/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import "PracticeOneViewController.h"
#import "PracticeOneCollectionViewCell.h"

@implementation PracticeOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.itemCollectionView.delegate = self;
    self.itemCollectionView.dataSource = self;
    [self.itemCollectionView registerClass:[PracticeOneCollectionViewCell class] forCellWithReuseIdentifier:@"OneCell"];
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

- (void)toneIsSelected:(id)sender {
    [sender setSelected:YES];
    
    if ([sender tag] >= 10) {
        self.tempSecondTone = [sender titleLabel].text;
    } else if ([sender tag] < 10) {
        self.tempFirstTone = [sender titleLabel].text;
    }
}

- (void)confirmSelection:(id)sender {
    if ([self.tempFirstTone isEqualToString:self.firstTone]
        && [self.tempSecondTone isEqualToString:self.secondTone]) {
        _selectedCell.congratulateLabel.hidden = NO;
        self.correctNumber ++;
    } else {
        _selectedCell.righAnswerLabel.hidden = NO;
    }
    _selectedCell.confirmSelectionButton.hidden = YES;
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
    PracticeOneCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"OneCell" forIndexPath: indexPath];
    
    self.currentPhrase = self.dataArray[indexPath.row];
    
    // play once immediately
    [self setUpAudioPlayerWithMp3FilePath:self.currentPhrase.mp3Path];
    
    // must do this, otherwise the buttons will be seen !
    _selectedCell.confirmSelectionButton.hidden = NO;
    cell.congratulateLabel.hidden = YES;
    cell.righAnswerLabel.hidden = YES;
    
    // store the right tones for latter comparing use
    self.firstTone = [[self.currentPhrase tones] substringToIndex:1];
    self.secondTone = [[self.currentPhrase tones] substringFromIndex:1];
    
    NSArray *pinYinWithoutTones = [[self.currentPhrase pinyinWithoutTones] componentsSeparatedByString:@" "];
    
    cell.PinYinLabelOne.text = pinYinWithoutTones[0];
    cell.PinYinLabelTwo.text = pinYinWithoutTones[1];
    cell.tag = indexPath.row;
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
    
//    [self.audioPlayer stop];
//    self.audioPlayer.currentTime = 0;
//    [self.audioPlayer play];
//    
    _selectedCell = cell;
    return cell;
}

@end
