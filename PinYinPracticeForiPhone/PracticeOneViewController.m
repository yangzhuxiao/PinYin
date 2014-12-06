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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.contentLabel.text = @"1. Select the tones you think are right according to the recording and given pinyin.\n\n2. Click speaker icon to repeat the recording. \n\n3. Click \"Done\" to see if you get the right answer. \n\n4. Scroll right to next question after clicking \"Done\"";
}

- (void)playMP3File:(id)sender {
    [sender setSelected:YES];
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
    
    if ([sender tag] >= 10) {
        [self.selectedButtonSecondRow setSelected:NO];
        self.selectedButtonSecondRow = sender;
        [self.selectedButtonSecondRow setSelected:YES];
        self.tempSecondTone = [sender titleLabel].text;
        selectedCell.toneLabelTwo.text = [[sender titleLabel].text substringWithRange:NSMakeRange(2, 1)];
        selectedCell.toneLabelTwo.hidden = NO;
    } else if ([sender tag] < 10) {
        [self.selectedButtonFirstRow setSelected:NO];
        self.selectedButtonFirstRow = sender;
        [self.selectedButtonFirstRow setSelected:YES];
        self.tempFirstTone = [sender titleLabel].text;
        selectedCell.toneLabelOne.text = [[sender titleLabel].text substringWithRange:NSMakeRange(2, 1)];
        selectedCell.toneLabelOne.hidden = NO;
    }
    
    if (selectedCell.toneLabelOne.hidden==NO && selectedCell.toneLabelTwo.hidden==NO) {
        // prevent the activation if the user didn't actually scroll to the next page !
        if ([_currentCell.righAnswerLabel.text isEqualToString:_preCell.righAnswerLabel.text]) {
            return;
        }
        selectedCell.confirmSelectionButton.enabled = YES;
        [selectedCell.confirmSelectionButton animateFirstTouchAtPoint:selectedCell.confirmSelectionButton.center];
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
    
    // disabel confirm button
    selectedCell.confirmSelectionButton.enabled = NO;
    self.currentIndex ++;
    [self updateCountLabel];
    
    // disable toneButtons
    for (id subview in selectedCell.contentView.subviews) {
        if ([subview isKindOfClass:[UIButton class]]
            && subview != selectedCell.playButton
            && subview != selectedCell.confirmSelectionButton) {
            [subview setEnabled:NO];
        }
    }
    
    // for next preparation
    _preCell = selectedCell;
    self.itemCollectionView.scrollEnabled = YES;
}

#pragma mark - UICollectionView Data Source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PracticeOneCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"OneCell" forIndexPath:indexPath];
    self.currentPhrase = self.dataArray[indexPath.row];
    cell.tag = indexPath.row;
    if ([collectionView.panGestureRecognizer velocityInView:self.view].x>0 ) {
        collectionView.scrollEnabled = NO;
        collectionView.scrollEnabled = YES;
    }
    // must do this, otherwise the two buttons will be seen !
    cell.congratulateLabel.hidden = YES;
    cell.righAnswerLabel.hidden = YES;
    cell.confirmSelectionButton.enabled = NO;
    cell.toneLabelOne.hidden = YES;
    cell.toneLabelTwo.hidden = YES;
    
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
            [subview setEnabled:YES];
            [subview addTarget:self action:@selector(toneIsSelected:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    // play once immediately
    [self setUpAudioPlayerWithMp3FilePath:self.currentPhrase.mp3Path];
    return cell;
}

#pragma mark - UIScrollView Delegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.audioPlayer stop];
    self.audioPlayer.currentTime = 0;
    [_currentCell.playButton setSelected:NO];
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    [self.selectedButtonSecondRow setSelected:NO];
    [self.selectedButtonFirstRow setSelected:NO];
    self.selectedButtonFirstRow = nil;
    self.selectedButtonSecondRow = nil;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int index = fabs(scrollView.contentOffset.x)/self.view.frame.size.width;
    
    self.audioPlayer = nil;
    self.currentPhrase = self.dataArray[index];
    
    // locating the visible cell with a smaller x offset
    if ([(UICollectionView *)scrollView visibleCells].count == 1) {
        _currentCell = [(UICollectionView *)scrollView visibleCells][0];
    } else if ([(UICollectionView *)scrollView visibleCells].count == 2){
        PracticeOneCollectionViewCell *firstCell = [(UICollectionView *)scrollView visibleCells][0];
        PracticeOneCollectionViewCell *secondCell = [(UICollectionView *)scrollView visibleCells][1];
        if (firstCell.frame.origin.x < secondCell.frame.origin.x) {
            _currentCell = firstCell;
        } else {
            _currentCell = secondCell;
        }
    }
    [self setUpAudioPlayerWithMp3FilePath:self.currentPhrase.mp3Path];
    [_currentCell.playButton setSelected:YES];
    
    // figure out the page down the view, must be "index+1", otherwise will start from 0
    self.indexLabel.text = [NSString stringWithFormat:@"%d/%lu", index+1, (unsigned long)self.dataArray.count];
    
    // decide if the user actually didn't scroll to the next page
    if ([_currentCell.righAnswerLabel.text isEqualToString:_preCell.righAnswerLabel.text]) {
        return;
    }
    self.itemCollectionView.scrollEnabled = NO;

}

#pragma mark - AVAudioPlayerDelegate

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    [_currentCell.playButton setSelected:NO];
}

- (void)audioPlayerBeginInterruption:(AVAudioPlayer *)player
{
    [_currentCell.playButton setSelected:NO];
}

#pragma mark - UIAlertView Delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            [[NSNotificationCenter defaultCenter] postNotificationName:@"Don't show practice one alert again" object:self];
            break;
        default:
            break;
    }
    [alertView dismissWithClickedButtonIndex:buttonIndex animated:YES];
}

@end
