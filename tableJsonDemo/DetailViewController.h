//
//  DetailViewController.h
//  tableJsonDemo
//
//  Created by Mackintosh on 17/09/13.
//  Copyright (c) 2013 Origin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCommentCell.h"

@interface DetailViewController : UIViewController<UIScrollViewDelegate>
{
    
    __weak IBOutlet UITableView *tblDetail;
}

@property(nonatomic,readwrite)NSString *selectedString;
@property (strong, nonatomic) IBOutlet UILabel *lblName;
@property(nonatomic)NSInteger previousPage;
@property(nonatomic,retain)NSArray *arrImg;
@end
