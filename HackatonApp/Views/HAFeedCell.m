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
@property (weak, nonatomic) IBOutlet UILabel* timeLbl;
@property (weak, nonatomic) IBOutlet UILabel* ratingLbl;

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
    [_timeLbl setText:[NSString stringWithFormat:@"%lld", routeModel.duration]];
    // TODO- настройка шрифта для рэйтинга
    [_ratingLbl setText:routeModel.name];
}

@end
