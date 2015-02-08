//
//  DetailViewController.m
//  tableJsonDemo
//
//  Created by Mackintosh on 17/09/13.
//  Copyright (c) 2013 Origin. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize lblName,selectedString,previousPage,arrImg;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"indexpath=%ld \n arr=%@",(long)previousPage,arrImg);

	// Do any additional setup after loading the view.
    
    [lblName setText:selectedString];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return [Data_dict count];
   // return [arrImg count];
    return 1;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCommentCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell1"];
    if (cell==nil) {
        NSArray *nib=[[NSBundle mainBundle] loadNibNamed:@"CustomCommentCell" owner:self options:nil];
        cell=[nib objectAtIndex:0];
    }
    [cell setBackgroundColor:[UIColor blackColor]];
   
        NSLog(@"%lu",(unsigned long)arrImg.count);
   for (int i=0; i<arrImg.count; i++)
    {
        
        [cell.m_DescriptionLabel setTag:i];
        
        [cell.m_DescriptionLabel setText:[NSString stringWithFormat:@"Image%ld",(long)previousPage]];
        
        UIImageView *imageview=[[UIImageView alloc] init];
        
        [imageview setFrame:CGRectMake(10,100, 320, 400)];
        imageview.clipsToBounds=YES;
        imageview.layer.masksToBounds=YES;
       [imageview setImage:[UIImage imageNamed:[arrImg objectAtIndex:i]]];
        imageview.tag=i;
              [cell.m_SCrollview addSubview:imageview];
         [imageview setFrame:CGRectMake(320*i+(320-320),0, 320,350)];
        imageview.contentMode=UIViewContentModeScaleAspectFit;
        [imageview setUserInteractionEnabled:YES];
        [cell.m_SCrollview setFrame:CGRectMake(0, 0, 320, 320)];
        
        cell.m_PageControl.numberOfPages=arrImg.count;
        cell.m_PageControl.currentPage=previousPage;
        [cell.m_PageControl setFrame:CGRectMake(140, 370, 39, 37)];
        [cell.m_SCrollview setDelegate:self];
        [cell.contentView addSubview:cell.m_PageControl];
       [cell.m_SCrollview setContentSize:CGSizeMake(320*arrImg.count,300)];
        [cell.m_SCrollview setContentOffset:CGPointMake(320*previousPage, 0)];
         [cell setFrame:CGRectMake(10, 100, 320, 400)];
    }
        return cell;
  /*
    
    __block float imageWidth;
    __block float imageHeight;
    NSLog(@"%i", dataKeys.count);
    //for (int i=0; i<dataKeys.count; i++)
    //{
    
    NSString *Url=[NSString stringWithFormat:@"%@/%@",serverImgURL1,[[dataKeys objectAtIndex:indexPath.row] objectForKey:@"Url"]];
    
    // stringByReplacingOccurrencesOfString:@"thumb" withString:@"big"];
    
    [cell.imgAlbum sd_setImageWithURL:[NSURL URLWithString:Url] placeholderImage:nil options:SDWebImageCacheMemoryOnly completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL)
     {
         
         if (image)
         {
             [cell.imgAlbum setImage:image];
             
             
             float widthRatio = 156/ cell.imgAlbum.image.size.width;
             float heightRatio = 320 / cell.imgAlbum.image.size.height;
             float scale = MIN(widthRatio, heightRatio);
             imageWidth = scale * cell.imgAlbum.image.size.width;
             imageHeight= scale * cell.imgAlbum.image.size.height;
             
             [cell.imgAlbum setFrame:CGRectMake(0, 0, imageWidth, imageHeight)];
             
             [cell.imgAlbum setFrame:CGRectMake(0,0, 156, imageHeight)];
             cell.imgAlbum.contentMode=UIViewContentModeScaleAspectFit;
             [cell.imgAlbum setUserInteractionEnabled:YES];
             [cell.lblAboutPic setFrame:CGRectMake(0,imageHeight+5,150,27)];
             [cell.btnUnSelect setFrame:CGRectMake(0,imageHeight+30,30,27)];
             [cell.lblLikeCnt setFrame:CGRectMake(30,imageHeight+30,30, 30)];
             [cell.lblAboutPic bringSubviewToFront:cell.imgAlbum];
         }
     }];
*/
  
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 400;
  /*  __block float imageWidth;
    __block float imageHeight;
    //int i=indexPath.row;
    // NSLog(@"%i", dataKeys.count);
    //for (i; i<dataKeys.count; i++)
    //{
    
    UIImageView *imageview=[[UIImageView alloc] init];
    [imageview setFrame:CGRectMake(0, 0,156, 320)];
    imageview.clipsToBounds=YES;
    imageview.layer.masksToBounds=YES;
    [imageview setTag:indexPath.row];
    
    NSString *Url=[NSString stringWithFormat:@"%@/%@",serverImgURL1,[[dataKeys objectAtIndex:indexPath.row] objectForKey:@"Url"]];
    
    //stringByReplacingOccurrencesOfString:@"thumb" withString:@"big"];
    NSLog(@"Url=%@",Url);
    
    [imageview sd_setImageWithURL:[NSURL URLWithString:Url] placeholderImage:nil options:SDWebImageCacheMemoryOnly completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL)
     {
         
         if (image)
         {
             
             float widthRatio = 156/ imageview.image.size.width;
             float heightRatio = 320 / imageview.image.size.height;
             float scale = MIN(widthRatio, heightRatio);
             imageWidth = scale * imageview.image.size.width;
             imageHeight= scale * imageview.image.size.height;
             
         }else{
             imageHeight=250;
         }
     }];
    
    
    NSLog(@"Height=%f",imageHeight);
    if (imageHeight>10)
    {
        return imageHeight+60;
    }else{
        return 268;
    }
    
    return 0.0;
    
}

*/

}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{

    if (scrollView.tag==1)
    {
        
        CGFloat pageWidth = scrollView.frame.size.width;
        float fractionalPage = scrollView.contentOffset.x / pageWidth;
        NSInteger page = lround(fractionalPage);
        
        if (previousPage != page)
        {
            
            previousPage = page;
            //m_ImageID=page;
            NSArray *array=[[NSArray alloc] initWithObjects:[NSIndexPath indexPathForRow:0 inSection:0], nil];
            [tblDetail beginUpdates];
            CustomCommentCell *cell=(CustomCommentCell*)[tblDetail cellForRowAtIndexPath:[array objectAtIndex:0]];
            cell.m_PageControl.currentPage=page;
            [tblDetail reloadRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationFade];
            [tblDetail endUpdates];
            
        }
    }
    else
    {
        //        NSArray *array=[[NSArray alloc] initWithObjects:[NSIndexPath indexPathForRow:0 inSection:0], nil];
        //        [self.m_Table beginUpdates];
        //        [self.m_Table reloadRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationNone];
        //        [self.m_Table endUpdates];
    }
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
