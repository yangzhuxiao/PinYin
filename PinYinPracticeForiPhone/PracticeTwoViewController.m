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

static const NSString *lightToneString = @"light";
static const NSString *levelToneString = @"ˉ";
static const NSString *risingToneString = @"ˊ";
static const NSString *fallingRisingToneString = @"ˇ";
static const NSString *fallingToneString = @"ˋ";

@interface PracticeTwoViewController ()< UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate >

@property (nonatomic, copy) NSArray *pinYinWithoutToneArray;
@property (nonatomic, copy) NSArray *pinYinWithToneArray;
@property (nonatomic, copy) NSArray *tonesArray;

@property (nonatomic, copy) NSString *firstPinyin;
@property (nonatomic, copy) NSString *secondPinyin;

@property (nonatomic, copy) NSString *tempFirstPinyin;
@property (nonatomic, copy) NSString *tempSecondPinyin;
@property (nonatomic, assign) NSInteger correctNumber;


@property (nonatomic, copy) PracticeTwoCollectionViewCell *selectedCell;

@end

@implementation PracticeTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //correctNumber is initialized as 0
    _correctNumber = 0;
    
    // must not be omitted, otherwise the color of subview "collectionView" will crash
    self.view.backgroundColor = [UIColor whiteColor];
    NSMutableArray *dataArray = [NSMutableArray array];
    NSString *plistPath = @"/Users/yangxiaozhu/Desktop/practice11.plist";
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    
    // pinyin without tones array
    for (id item in data) {
        [dataArray addObject:item];
    }
    _pinYinWithoutToneArray = [data allKeys];
    
    // all tones array
    dataArray = [NSMutableArray array];
    for (NSString *key in _pinYinWithoutToneArray) {
        NSString *firstTone;
        NSString *secondTone;
        id value = [data valueForKey:key];
        int firstToneNumber = [value intValue]/10;
        int secondToneNumber = [value intValue]%10;
        
        switch (firstToneNumber) {
            case 0:
                firstTone = (NSString *)lightToneString;
                break;
            case 1:
                firstTone = (NSString *)levelToneString;
                break;
            case 2:
                firstTone = (NSString *)risingToneString;
                break;
            case 3:
                firstTone = (NSString *)fallingRisingToneString;
                break;
            case 4:
                firstTone = (NSString *)fallingToneString;
                break;
            default:
                firstTone = @"";
                break;
        }
        
        switch (secondToneNumber) {
            case 0:
                secondTone = (NSString *)lightToneString;
                break;
            case 1:
                secondTone = (NSString *)levelToneString;
                break;
            case 2:
                secondTone = (NSString *)risingToneString;
                break;
            case 3:
                secondTone = (NSString *)fallingRisingToneString;
                break;
            case 4:
                secondTone = (NSString *)fallingToneString;
                break;
            default:
                secondTone = @"";
                break;
        }
        NSArray *unitArray = [NSArray array];
        unitArray = @[firstTone, secondTone];
        [dataArray addObject:unitArray];
    }
    _tonesArray = dataArray;
    
    // pinyin with tones array
    dataArray = [NSMutableArray array];
    plistPath = @"/Users/yangxiaozhu/Desktop/practice12.plist";
    data = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    
    for (NSString *key in _pinYinWithoutToneArray) {
        id value = [data valueForKey:key];
        [dataArray addObject:value];
    }
    _pinYinWithToneArray = dataArray;
    
    // The order of the following three must not be changed !
    [self setUpCollectionViewAndPageControl];
    [self setUpBackButton];
    [self setUpIndexLabel];
    
    // repare audioPlayer and play once
    [self setUpAudioPlayer];
    [self setUpCountLabel];
}

- (void)setUpCountLabel
{
    _countLabel = [[UILabel alloc] initWithFrame:CGRectMake(CountLabelXOriginPercent *WIDTH, CountLabelYOriginPercent *HEIGHT, CountLabelWidthPercent *WIDTH, CountLabelHeightPercent *HEIGHT)];
    _countLabel.font = [UIFont systemFontOfSize:self.view.frame.size.width * CountLabelFontPercentWidth];
    _countLabel.textAlignment = NSTextAlignmentRight;
    _countLabel.layer.backgroundColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.3 alpha:0.2].CGColor;
    _countLabel.textColor = [UIColor blackColor];
    
    // must initialize, otherwise won't be able to see it at first!
    _countLabel.text = [NSString stringWithFormat:@"1/%lu", (unsigned long)_pinYinWithoutToneArray.count];
    
    [self updateCountLabel];
    
    [self.view addSubview:_countLabel];
}

- (void)updateCountLabel
{
    _countLabel.text = [NSString stringWithFormat:@"Correct/All: %ld/%lu", (long)_correctNumber, (unsigned long)_pinYinWithoutToneArray.count];
}

- (void)setUpCollectionViewAndPageControl
{
    //Item collection
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 0;
    _itemCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0.0, 0.0, ItemColletionViewWidth, ItemColletionViewHeight) collectionViewLayout:layout];
    layout.itemSize = _itemCollectionView.bounds.size;
    _itemCollectionView.delegate = self;
    _itemCollectionView.dataSource = self;
    _itemCollectionView.backgroundColor = [UIColor whiteColor];
    _itemCollectionView.pagingEnabled = YES;
    _itemCollectionView.showsHorizontalScrollIndicator = NO;
    [_itemCollectionView registerClass:[PracticeTwoCollectionViewCell class] forCellWithReuseIdentifier:@"ItemCell"];
    
    [self.view addSubview:_itemCollectionView];
}

- (void)setUpBackButton
{
    _backButton = [[UIButton alloc] initWithFrame:CGRectMake(BackButtonXOriginPercent *WIDTH, BackButtonYOriginPercent *HEIGHT, BackButtonWidthPercent *WIDTH, BackButtonHeightPercent *HEIGHT)];
    [_backButton setTitle:@"<<Back" forState:UIControlStateNormal];
    [_backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _backButton.titleLabel.font = [UIFont boldSystemFontOfSize:self.view.frame.size.width * BackButtonFontPercentWidth];
    _backButton.layer.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.1].CGColor;
    _backButton.layer.borderWidth = 1.0f;
    _backButton.layer.cornerRadius = 5.0f;
    [_backButton addTarget:self action:@selector(backToRoot:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_backButton];
}

- (void)setUpIndexLabel
{
    _indexLabel = [[UILabel alloc] initWithFrame:CGRectMake(IndexLabelXOriginPercent *WIDTH, IndexLabelYOriginPercent *HEIGHT, IndexLabelWidthPercent *WIDTH, IndexLabelHeightPercent *HEIGHT)];
    _indexLabel.font = [UIFont systemFontOfSize:self.view.frame.size.width * IndexLabelFontPercentWidth];
    _indexLabel.textAlignment = NSTextAlignmentCenter;
    _indexLabel.layer.backgroundColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.3 alpha:0.2].CGColor;
    _indexLabel.textColor = [UIColor blackColor];
    
    // must initialize, otherwise won't be able to see it at first!
    _indexLabel.text = [NSString stringWithFormat:@"1/%lu", (unsigned long)_pinYinWithoutToneArray.count];
    
    [self.view addSubview:_indexLabel];
}

- (void)setUpAudioPlayer
{
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setCategory:AVAudioSessionCategoryPlayback error:nil];
    [audioSession setActive:YES error:nil];
    
    NSString *audioPath = [[NSBundle mainBundle] pathForResource:@"example" ofType:@"mp3"];
    NSURL *audioUrl = [NSURL fileURLWithPath:audioPath];
    NSError *playerError;
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audioUrl error:&playerError];
    if (_audioPlayer == NULL)
    {
        return;
    }
    [_audioPlayer setNumberOfLoops:0];
    [_audioPlayer setVolume:1];
    [_audioPlayer prepareToPlay];
    [_audioPlayer play];
}

- (void)playMP3File:(id)sender {
    if (_audioPlayer.isPlaying == YES) {
        [_audioPlayer stop];
        //very important, otherwise start from where stopped last time
        _audioPlayer.currentTime = 0;
        [_audioPlayer play];
        return;
    }
    [_audioPlayer play];
}

- (void)backToRoot:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)confirmSelection:(id)sender {
    if ([_selectedCell.pinyinOneTextField.text isEqualToString:_firstPinyin]
        && [_selectedCell.pinyinTwoTextField.text isEqualToString:_secondPinyin]) {
        _selectedCell.congratulateLabel.hidden = NO;
        _correctNumber ++;
    } else {
        _selectedCell.righAnswerLabel.hidden = NO;
    }
    _selectedCell.confirmInputButton.userInteractionEnabled = NO;
    [self updateCountLabel];
}

#pragma mark - UICollectionView Data Source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _pinYinWithoutToneArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PracticeTwoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ItemCell" forIndexPath: indexPath];
    
    // must do this, otherwise the two buttons will be seen !
    _selectedCell.confirmInputButton.userInteractionEnabled = YES;
    cell.congratulateLabel.hidden = YES;
    cell.righAnswerLabel.hidden = YES;
    cell.pinyinOneTextField.text = @"";
    cell.pinyinTwoTextField.text = @"";

    // store the right pinyin for latter comparing use
    NSString *pinyinString = _pinYinWithoutToneArray[indexPath.row];
    NSArray *pinyinArray = [pinyinString componentsSeparatedByString:@" "];
    _firstPinyin = pinyinArray[0];
    _secondPinyin = pinyinArray[1];
    
    cell.toneLabelOne.text = _tonesArray[indexPath.row][0];
    cell.toneLabelTwo.text = _tonesArray[indexPath.row][1];
    
    cell.righAnswerLabel.text = [NSString stringWithFormat:@"Sorry! The answer is \n\" %@\"", _pinYinWithToneArray[indexPath.row]];
    
    // register for touch event
    [cell.playButton addTarget:self action:@selector(playMP3File:) forControlEvents:UIControlEventTouchUpInside];
    // register for confimation Input
    [cell.confirmInputButton addTarget:self action:@selector(confirmSelection:) forControlEvents:UIControlEventTouchUpInside];
    
    [_audioPlayer stop];
    _audioPlayer.currentTime = 0;
    [_audioPlayer play];
    
    _selectedCell = cell;
    return cell;
}

#pragma mark - UIScrollView Delegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [_audioPlayer stop];
    _audioPlayer.currentTime = 0;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int index = fabs(scrollView.contentOffset.x)/self.view.frame.size.width;
    
    // figure out the page down the view, must be "index+1", otherwise will start from 0
    _indexLabel.text = [NSString stringWithFormat:@"%d/%lu", index+1, (unsigned long)_pinYinWithoutToneArray.count];
}
@end
