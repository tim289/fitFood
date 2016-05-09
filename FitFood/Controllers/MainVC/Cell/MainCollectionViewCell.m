//
//  MainCollectionViewCell.m
//  FitFood
//
//  Created by Raman Harhun on 08.05.16.
//  Copyright © 2016 fitzoneclub. All rights reserved.
//

#import "MainCollectionViewCell.h"

@interface MainCollectionViewCell()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthLineConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightLineConstraint;

@end

@implementation MainCollectionViewCell

-(void)awakeFromNib {
    [super awakeFromNib];
    
    self.widthLineConstraint.constant = 0.5;
    self.heightLineConstraint.constant = 0.5;
}

@end
