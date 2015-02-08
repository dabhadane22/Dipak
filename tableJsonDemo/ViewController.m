//
//  ViewController.m
//  tableJsonDemo
//
//  Created by Mackintosh on 17/09/13.
//  Copyright (c) 2013 Origin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize Data_dict,tableview,arrImage;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    arrImage=[[NSArray alloc]initWithObjects:@"index1.jpg",@"index2.jpg",@"index3.jpg",@"index4.jpg",@"index5.jpg",@"index.jpg",nil];
    
   NSURL *url = [NSURL URLWithString:@"http://rest-service.guides.spring.io/greeting"];
    
    NSString *jsonreturn = [[NSString alloc] initWithContentsOfURL:url];
    //  NSLog(jsonreturn);
    
    NSData *jsonData =[jsonreturn dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error =nil;
    
    Data_dict = [NSJSONSerialization JSONObjectWithData:jsonData
                                                         options:kNilOptions
                                                           error:&error];
  
    
    NSLog(@"JSON return is=%@",Data_dict);
    
    
    /*
    if (dict)
    {
	NSString *image_id = [dict valueForKey:@"id"];
        
        NSLog(@"JSON return is=%@",image_id);
    }
    
    if (dict)
    {
		//image_title = [dict valueForKey:@"title"];
        //NSLog(@"Image Titile  is=%@",image_title);
        
       // image_story = [dict valueForKey:@"story"];
		
    }
    
 */
    
    //otherway to fetching Data
    
    
  /*  - (IBAction)fetchGreeting;
    {
        NSURL *url = [NSURL URLWithString:@"http://rest-service.guides.spring.io/greeting"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [NSURLConnection sendAsynchronousRequest:request
                                           queue:[NSOperationQueue mainQueue]
                               completionHandler:^(NSURLResponse *response,
                                                   NSData *data, NSError *connectionError)
         {
             if (data.length > 0 && connectionError == nil)
             {
                 NSDictionary *greeting = [NSJSONSerialization JSONObjectWithData:data
                                                                          options:0
                                                                            error:NULL];
                 self.greetingId.text = [[greeting objectForKey:@"id"] stringValue];
                 self.greetingContent.text = [greeting objectForKey:@"content"];
             }
         }];
    }
    
    */
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   //return [Data_dict count];
    return [arrImage count];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
        ItemCell* cell = [tableview dequeueReusableCellWithIdentifier:@"cell"];
        if (cell == nil)
        {
NSArray* nib = [[NSBundle mainBundle] loadNibNamed:@"ItemCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
            //[cell.lblName setText:[Data_dict valueForKey:@"content"]];
            
            [cell.lblName setText:[NSString stringWithFormat:@"Image%ld",(long)indexPath.row]];
         
          // [cell.imgView sd_setImageWithURL:[NSURL URLWithString:@"http://www.google.com/images/srpr/logo3w.png"] placeholderImage:nil];
        
            [cell.imgView setImage:[UIImage imageNamed:[arrImage objectAtIndex:indexPath.row]]];
    
            
            [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
            
           // cell.selectionStyle = UITableViewCellSelectionStyleNone;
            //return cell;
            
        }
        
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120.0;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    indextPath=indexPath.row;
    
    [self performSegueWithIdentifier:@"DetailView" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier]isEqualToString:@"DetailView"])
    {
        DetailViewController *objDetailView=[segue destinationViewController];
        //objDetailView.selectedString=[arrData objectAtIndex:indextPath];
        
        objDetailView.arrImg=arrImage;
        objDetailView.previousPage=indextPath;
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
