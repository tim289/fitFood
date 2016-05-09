//
//  MainViewController.m
//  FitFood
//
//  Created by Raman Harhun on 08.05.16.
//  Copyright © 2016 fitzoneclub. All rights reserved.
//

#import "MainViewController.h"
#import "MainCollectionViewCell.h"
#import "TelephoneCollectionViewCell.h"

#import "UICollectionViewLeftAlignedLayout.h"

#import "UIImage+Color.h"

typedef enum : NSUInteger {
    MainCollectionCellReadyMeals = 0,
    MainCollectionCellMyOrders,
    MainCollectionCellMyNutritionist,
    MainCollectionCellAboutApp,
    MainCollectionCellTelephone,
    MainCollectionCellCount,
} MainCollectionCell;

@interface MainViewController() <UICollectionViewDelegate, UICollectionViewDataSource, TelephoneCollectionViewCellDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) NSArray* titleText;

@end

@implementation MainViewController

- (void)viewDidLoad {

    [self setCollectionData];

}

- (void) setCollectionData {
    
    self.collectionView.collectionViewLayout = [[UICollectionViewLeftAlignedLayout alloc] init];
    self.collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background_ic"]];
    
    //register nib
    [self.collectionView registerClass:[MainCollectionViewCell class]
            forCellWithReuseIdentifier:@"MainCollectionViewCellIdentifier"];
    
    [self.collectionView registerNib: [UINib nibWithNibName:@"MainCollectionViewCell"
                                                     bundle:nil]
          forCellWithReuseIdentifier:@"MainCollectionViewCellIdentifier"];
    
    [self.collectionView registerClass:[TelephoneCollectionViewCell class]
            forCellWithReuseIdentifier:@"TelephoneCollectionViewCellIdentifier"];
    
    [self.collectionView registerNib: [UINib nibWithNibName:@"TelephoneCollectionViewCell"
                                                     bundle:nil]
          forCellWithReuseIdentifier:@"TelephoneCollectionViewCellIdentifier"];
}

- (IBAction)openBasket:(id)sender {
    [self performSegueWithIdentifier:@"BasketViewControllerSegue" sender:self];
}

#pragma mark - UICollectionViewDelegate

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout*)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout*)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    return 0;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case MainCollectionCellReadyMeals:
            [self performSegueWithIdentifier:@"ReadyMealsViewControllerIdentifier" sender:self];
        break;
        case MainCollectionCellMyOrders:
            [self performSegueWithIdentifier:@"MyOrdersViewControllerIdentifier" sender:self];
            break;
        case MainCollectionCellMyNutritionist:
            [self performSegueWithIdentifier:@"MyNutritionistViewControllerSegue" sender:self];
            break;
        case MainCollectionCellAboutApp:
            [self performSegueWithIdentifier:@"AboutAppViewControllerIdentifier" sender:self];
            break;
        default:
            break;
    }

}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    
    return MainCollectionCellCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"MainCollectionViewCellIdentifier";
    
    MainCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier
                                                                             forIndexPath:indexPath];

    switch (indexPath.row) {
        case MainCollectionCellReadyMeals:
            
            cell.mainImageView.image = [UIImage imageNamed:@"ready_meals_ic"];
            cell.titleLabel.text = @"Готовые блюда";
            cell.descriptionLabel.text = @"Выбирайте блюда из готового меню, профессионально составленного диетологами";

            break;
            
        case MainCollectionCellMyOrders:
            
            cell.mainImageView.image = [UIImage imageNamed:@"my_orders_ic"];
            cell.titleLabel.text = @"Ваши заказы";
            cell.descriptionLabel.text = @"Отслеживайте свои заказы и будьте в курсе всего процесса";
            
            break;
            
        case MainCollectionCellMyNutritionist:
            
            cell.mainImageView.image = [UIImage imageNamed:@"my_nutritionist_ic"];
            cell.titleLabel.text = @"Мой диетолог";
            cell.descriptionLabel.text = @"Воспользуйтесь услугами персонального диетолога и корректируйте свое питание";
            
            break;
            
        case MainCollectionCellAboutApp:
            
            cell.mainImageView.image = [UIImage imageNamed:@"about_app_ic"];
            cell.titleLabel.text = @"О приложении";
            cell.descriptionLabel.text = @"Информация о приложении \"FIT FOOD\" и о нашей компании";
            
            break;
            
        case MainCollectionCellTelephone: {
            
            TelephoneCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TelephoneCollectionViewCellIdentifier"
                                                                                          forIndexPath:indexPath];
            cell.delegate = self;
            
            return cell;
        }
            
        default:
            break;
    }
    [cell.descriptionLabel sizeToFit];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGSize size = [UIScreen mainScreen].bounds.size;
    
    
    if (indexPath.row == MainCollectionCellTelephone) {
        
        CGSize sizeCollectionView = collectionView.frame.size;
        sizeCollectionView.height -= 64;
        
        size.height = sizeCollectionView.height - (size.width/2*(int)(MainCollectionCellCount/2));
        if (size.height >= 100) {
            return CGSizeMake(size.width, size.height);
        } else {
            return CGSizeMake(size.width, 100.f);
        }
    }
    
    return CGSizeMake(size.width/2, size.width/2);
}

#pragma mark - TelephoneCollectionViewCellDelegate

- (void) numberButtonTap:(TelephoneCollectionViewCell*)cell {
    NSString *phNo = @"+88004565665";
    NSURL *phoneUrl = [NSURL URLWithString:[NSString  stringWithFormat:@"telprompt:%@",phNo]];
    
    if ([[UIApplication sharedApplication] canOpenURL:phoneUrl]) {
        [[UIApplication sharedApplication] openURL:phoneUrl];
    } else {
        UIAlertController* controller = [UIAlertController alertControllerWithTitle:@"Ошибка"
                                                                            message:@"Звонки не поддерживаются"
                                                                    preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* okButton = [UIAlertAction actionWithTitle:@"OK"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                             [controller dismissViewControllerAnimated:YES completion:nil];
                                                         }];
        [controller addAction:okButton];
        [self presentViewController:controller animated:YES completion:nil];
    }
}

@end


