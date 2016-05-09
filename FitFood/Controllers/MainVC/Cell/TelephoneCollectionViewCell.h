//
//  TelephoneCollectionViewCell.h
//  FitFood
//
//  Created by Raman Harhun on 09.05.16.
//  Copyright © 2016 fitzoneclub. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TelephoneCollectionViewCell;

@protocol TelephoneCollectionViewCellDelegate

- (void) numberButtonTap:(TelephoneCollectionViewCell*)cell;

@end

@interface TelephoneCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) id <TelephoneCollectionViewCellDelegate> delegate;

@end
