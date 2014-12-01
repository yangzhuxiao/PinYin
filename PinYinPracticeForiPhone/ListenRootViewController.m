//
//  FirstViewController.m
//  PinYinPracticeForiPhone
//
//  Created by Yang Xiaozhu on 11/23/14.
//  Copyright (c) 2014 Xiaozhu. All rights reserved.
//

#import "ListenRootViewController.h"
#import "ListenItemViewController.h"
#import "Constants.h"
#import <FontAwesomeKit/FAKIonIcons.h>
#import "PracticeRootViewController.h"

@implementation ListenRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    FAKIonIcons *listenTabIcon = [FAKIonIcons headphoneIconWithSize:25];
    FAKIonIcons *practiceTabIcon = [FAKIonIcons composeIconWithSize:25];

    NSArray *viewControllers = [self.tabBarController viewControllers];
    for (id controller in viewControllers) {
        if ([controller isKindOfClass:[self class]]) {
            [[controller tabBarItem] setImage:[listenTabIcon imageWithSize:CGSizeMake(30, 30)]];
        } else if ([controller isKindOfClass:[PracticeRootViewController class]]) {
            [[controller tabBarItem] setImage:[practiceTabIcon imageWithSize:CGSizeMake(30, 30)]];
        }
    }
        
    _tag = 0;
    self.viewTitleLabel.text = @"Pick the tone of the first charater";
    self.catogoriesArray = @[[self attributedStringFromString:@"ˉ\nLevel Tone"], [self attributedStringFromString:@"ˊ\nRising Tone"], [self attributedStringFromString:@"ˇ\nFalling-rising\nTone"], [self attributedStringFromString:@"ˋ\nFalling Tone"]];
}

- (NSMutableAttributedString *)attributedStringFromString:(NSString *)string
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    [attributedString addAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Thin" size:listenCellLabelTonesFontPercentWidth * WIDTH]} range:NSMakeRange(0, 1)];
    [attributedString addAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Thin" size:listenCellLabelWordsFontPercentWidth * WIDTH]} range:NSMakeRange(1, attributedString.length-1)];
    return attributedString;
}

- (void)selectConfirmed:(id)sender
{
    switch (self.selectedCellIndex) {
        case 0:
            _tag = 1;
            break;
        case 1:
            _tag = 2;
            break;
        case 2:
            _tag = 3;
            break;
        case 3:
            _tag = 4;
            break;
        default:
            break;

    }
    
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:
                            @"level tone            \"  ˉ  \"",
                            @"rising tone           \"  ˊ  \"",
                            @"falling-rising tone \"  ˇ  \"",
                            @"falling tone          \"  ˋ  \"",
                            @"light tone            \"     \"", nil];
    [sheet showInView:self.view];
}

#pragma mark - UICollectionView Data Source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.catogoriesArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ParentRootCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ListenCell" forIndexPath:indexPath];
    [cell.selectButton setTitle:@"Pick the tone of \nthe second charater" forState:UIControlStateNormal];
    cell.contentLabel.attributedText = self.catogoriesArray[indexPath.row];
    [cell.selectButton addTarget:self action:@selector(selectConfirmed:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

#pragma mark - UIActionSheet Delegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    ListenItemViewController *itemController = [[ListenItemViewController alloc] init];
    
    switch (buttonIndex) {
        case 0:
            itemController.tag = _tag*10 + 1;
            [self presentViewController:itemController animated:YES completion:nil];
            break;
        case 1:
            itemController.tag = _tag*10 + 2;
            [self presentViewController:itemController animated:YES completion:nil];
            break;
        case 2:
            itemController.tag = _tag*10 + 3;
            [self presentViewController:itemController animated:YES completion:nil];
            break;
        case 3:
            itemController.tag = _tag*10 + 4;
            [self presentViewController:itemController animated:YES completion:nil];
            break;
        case 4:
            itemController.tag = _tag*10 + 5;
            [self presentViewController:itemController animated:YES completion:nil];
            break;
        default:
            _tag = 0;
            break;
    }
}

@end
