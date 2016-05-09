//
//  BasketViewController.m
//  FitFood
//
//  Created by Raman Harhun on 09.05.16.
//  Copyright © 2016 fitzoneclub. All rights reserved.
//

#import "BasketViewController.h"

#import "FoodTableViewCell.h"

@interface BasketViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *caloriesLabel;
@property (weak, nonatomic) IBOutlet UILabel *proteinsLabel;
@property (weak, nonatomic) IBOutlet UILabel *fatsLabel;
@property (weak, nonatomic) IBOutlet UILabel *carbohydratesLabel;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation BasketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"FoodTableViewCell"
                                               bundle:nil]
         forCellReuseIdentifier:@"FoodTableViewCellIdentifier"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    NSLog(@"%f",self.carbohydratesLabel.minimumScaleFactor);
    self.caloriesLabel.font = self.carbohydratesLabel.font;
    self.proteinsLabel.font = self.carbohydratesLabel.font;
    self.fatsLabel.font = self.carbohydratesLabel.font;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 3;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FoodTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FoodTableViewCellIdentifier" forIndexPath:indexPath];
    
    return cell;
}

@end
