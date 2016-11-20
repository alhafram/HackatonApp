//
//  HAFeedCell.m
//  HackatonApp
//
//  Created by Georgij on 19.11.16.
//  Copyright © 2016 Albert. All rights reserved.
//

#import "HAFeedCell.h"
#import "HackatonApp-Swift.h"

@interface HAFeedCell()

@property (weak, nonatomic) IBOutlet UILabel* titleLbl;
@property (weak, nonatomic) IBOutlet UILabel* ratingLbl1;
@property (weak, nonatomic) IBOutlet UILabel* ratingLbl2;
@property (weak, nonatomic) IBOutlet UILabel* ratingLbl3;
@property (weak, nonatomic) IBOutlet UILabel* ratingLbl4;
@property (weak, nonatomic) IBOutlet UILabel* ratingLbl5;
@property (weak, nonatomic) IBOutlet UIImageView* bgrImageView;

@end

@implementation HAFeedCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setRouteModel:(RouteModel *)routeModel {
    [_titleLbl setText:routeModel.name];
    // TODO- настройка шрифта для рэйтинга
//    [_ratingLbl setText:routeModel.name];
    
    
    
    [_bgrImageView setImage:routeModel.cover];
}

@end
