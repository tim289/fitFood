//
//  TelephoneCollectionViewCell.m
//  FitFood
//
//  Created by Raman Harhun on 09.05.16.
//  Copyright © 2016 fitzoneclub. All rights reserved.
//

#import "TelephoneCollectionViewCell.h"

@implementation TelephoneCollectionViewCell

- (IBAction)telephoneButtonAction:(id)sender {
    if (self.delegate) {
        [self.delegate numberButtonTap: self];
    }
}

@end
