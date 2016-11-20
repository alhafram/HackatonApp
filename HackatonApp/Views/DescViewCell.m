//
//  DescViewCell.m
//  HackatonApp
//
//  Created by Georgij on 20.11.16.
//  Copyright © 2016 Albert. All rights reserved.
//

#import "DescViewCell.h"

@interface DescViewCell()
@property (weak, nonatomic) IBOutlet UILabel *descLbl;

@end

@implementation DescViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setDescText:(NSString *)descText {
    _descText = descText;
    _descLbl.text = _descText;
}

@end
