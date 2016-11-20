//
//  TitleViewCell.m
//  HackatonApp
//
//  Created by Georgij on 20.11.16.
//  Copyright © 2016 Albert. All rights reserved.
//

#import "TitleViewCell.h"

@interface TitleViewCell()

@property (weak, nonatomic) IBOutlet UILabel *nameLbl;

@end

@implementation TitleViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setNameStr:(NSString *)nameStr {
    _nameStr = nameStr;
    _nameLbl.text = _nameStr;
}

@end
