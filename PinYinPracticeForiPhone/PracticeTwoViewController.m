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
    _alreadyAnswered = NO;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
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
    
    // change confirm button status for good
    _alreadyAnswered = YES;
    selectedCell.confirmSelectionButton.enabled = NO;
    self.currentIndex ++;
    [self updateCountLabel];
    
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
    PracticeTwoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TwoCell" forIndexPath:indexPath];
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
    cell.pinyinOneTextField.text = @"";
    cell.pinyinTwoTextField.text = @"";

    // store the right pinyin for latter comparing use
    NSArray *pinYinWithoutTones = [[self.currentPhrase pinyinWithoutTones] componentsSeparatedByString:@" "];
    self.firstPinyin = pinYinWithoutTones[0];
    self.secondPinyin = pinYinWithoutTones[1];
    // toneLabels
    cell.toneLabelOne.text = [[[self.currentPhrase tones] substringToIndex:toneStringLength] substringWithRange:NSMakeRange(2, 1)];
    cell.toneLabelTwo.text = [[[self.currentPhrase tones] substringFromIndex:toneStringLength] substringWithRange:NSMakeRange(2, 1)];
    // righAnswerLabel
    cell.righAnswerLabel.text = [NSString stringWithFormat:@"Sorry! The answer is \n\" %@\"", self.currentPhrase.pinyinFull];
    // set textfield's delegate
    cell.pinyinOneTextField.delegate = self;
    cell.pinyinTwoTextField.delegate = self;
    // register for touch event
    [cell.playButton addTarget:self action:@selector(playMP3File:) forControlEvents:UIControlEventTouchUpInside];
    // register for confimation Input
    [cell.confirmSelectionButton addTarget:self action:@selector(confirmSelection:) forControlEvents:UIControlEventTouchUpInside];
    // play once immediately
    [self setUpAudioPlayerWithMp3FilePath:self.currentPhrase.mp3Path];
    // must do this, cuz the scrollviewdecelerating delegate won't be called the first time, the _currentCell will be nil
    _currentCell = cell;
    return cell;
}

#pragma mark - UITextField Delegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (textField == _currentCell.pinyinOneTextField) {
        textField.returnKeyType = UIReturnKeyNext;
    } else if (textField == _currentCell.pinyinTwoTextField) {
        textField.returnKeyType = UIReturnKeyDone;
    }
    if (self.itemCollectionView.frame.origin.y == 0) {
        [self.itemCollectionView setFrame:CGRectOffset(self.itemCollectionView.frame, 0, -1.5*textField.frame.size.height)];
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == _currentCell.pinyinOneTextField) {
        [_currentCell.pinyinTwoTextField becomeFirstResponder];
    } else if (textField == _currentCell.pinyinTwoTextField) {
        [textField resignFirstResponder];
        [self.itemCollectionView setFrame:CGRectOffset(self.itemCollectionView.frame, 0, 1.5*textField.frame.size.height)];
        
        // must prevent from user's double or tripple touching return key to invoke Confirm button !
        if (!_alreadyAnswered) {
            _currentCell.confirmSelectionButton.enabled = YES;
            [_currentCell.confirmSelectionButton animateFirstTouchAtPoint:_currentCell.confirmSelectionButton.center];
        }
    }
    return YES;
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
        PracticeTwoCollectionViewCell *firstCell = [(UICollectionView *)scrollView visibleCells][0];
        PracticeTwoCollectionViewCell *secondCell = [(UICollectionView *)scrollView visibleCells][1];
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
        _currentCell.confirmSelectionButton.enabled = NO;
        return;
    }
    self.itemCollectionView.scrollEnabled = NO;
    // must not forget, otherwise you will only be able to answer the first question !
    _alreadyAnswered = NO;
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


@end
