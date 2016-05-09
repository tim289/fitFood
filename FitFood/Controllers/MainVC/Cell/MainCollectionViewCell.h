//
//  MainCollectionViewCell.h
//  FitFood
//
//  Created by Raman Harhun on 08.05.16.
//  Copyright © 2016 fitzoneclub. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end
