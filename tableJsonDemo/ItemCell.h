//
//  ItemCell.h
//  tableJsonDemo
//
//  Created by Mackintosh on 17/09/13.
//  Copyright (c) 2013 Origin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end
