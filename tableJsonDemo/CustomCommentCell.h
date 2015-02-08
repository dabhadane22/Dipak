//
//  CustomCommentCell.h
//  pitnit
//
//  Created by Ankush Sharma on 12/08/14.
//  Copyright (c) 2014 Brahmini Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCommentCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *m_DescriptionLabel;
@property (weak, nonatomic) IBOutlet UIPageControl *m_PageControl;
@property (weak, nonatomic) IBOutlet UIView *m_DescriptionView;
@property (strong, nonatomic) IBOutlet UIScrollView *m_SCrollview;
@property (weak, nonatomic) IBOutlet UIImageView *m_HeartLikeImage;

@end
