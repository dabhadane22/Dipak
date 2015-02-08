//
//  ItemCell.m
//  tableJsonDemo
//
//  Created by Mackintosh on 17/09/13.
//  Copyright (c) 2013 Origin. All rights reserved.
//

#import "ItemCell.h"

@implementation ItemCell
@synthesize lblName;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
