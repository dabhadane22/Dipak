//
//  ViewController.h
//  tableJsonDemo
//
//  Created by Mackintosh on 17/09/13.
//  Copyright (c) 2013 Origin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemCell.h"
#import "DetailViewController.h"
#import "UIImageView+WebCache.h"
@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
   
    int indextPath;
}

@property (strong, nonatomic) IBOutlet UITableView *tableview;
@property(nonatomic,retain)NSMutableDictionary *Data_dict;
@property(nonatomic,retain)NSArray *arrImage;
@end
