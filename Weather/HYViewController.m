//
//  HYViewController.m
//  Weather
//
//  Created by 张昊 on 14-5-27.
//  Copyright (c) 2014年 HaoYa. All rights reserved.
//

#import "HYViewController.h"
#import "DropDownListView.h"
#import "MBProgressHUD.h"
#import "HYWeatherModel.h"
@interface HYViewController ()

@end

@implementation HYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
     arryList=@[@"Paris",@"Bordeaux",@"Lyon",@"Rennes",@"Nante",@"Cane",@"Tours",@"Nice"];    
   
}


#pragma mark--Send Request To Get JsonData

- (IBAction)SendRequestToGetJsonData:(UIButton*)button {
    
    [self ShowLoading];
    [self SendRequest];
    [self HideLoading];
}


-(void)SendRequest{
    
    NSString *url = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/forecast/daily?q=%@&mode=json&units=metric&cnt=7", self.SelectCountry.titleLabel.text];
  
     _appDelegate = [UIApplication sharedApplication].delegate;
    
    // use AFHTTPRequestOperationManager send GET request
	[_appDelegate.manager GET:url parameters:nil
    // get server respond success block
                      success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
    // server respond JSON data  transfer  to Objective-C object，assign to authors proprety
         weathers = responseObject;
     
         NSLog(@"json----:%@",weathers);

         [self assignValue:weathers];
         
     }
    // get server respond failblock
                      failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"show error information: %@", error);
     }];
}

#pragma mark--assign Value to storyboard label

-(void)assignValue:(NSDictionary*)Data {
    
//    self.TodayMin.text=[NSString stringWithFormat:@"Min：%@°C",
//                        [authors[@"list"][0][@"temp"][@"min"] stringValue]];
    
    HYWeatherModel  * weatherModel=[[HYWeatherModel alloc]initWithDataDic:Data];
    self.TodayDate.text=weatherModel.TodayDate;
    self.TodayMin.text=weatherModel.TodayMin;
    self.TodayMax.text=weatherModel.TodayMax;
    self.TodayImage.image=[UIImage imageNamed:weatherModel.TodayImage];
    self.TomorrowDate.text=weatherModel.TomorrowDate;
    self.TomorrowMin.text=weatherModel.TomorrowMin;
    self.TomorrowMax.text=weatherModel.TomorrowMax;
    self.TomorrowImage.image=[UIImage imageNamed:weatherModel.TomorrowImage];
    self.AfterTomorrowDate.text=weatherModel.AfterTomorrowDate;
    self.AfterTomorrowMin.text=weatherModel.AfterTomorrowMin;
    self.AfterTomorrowMax.text=weatherModel.AfterTomorrowMax;
    self.AfterTomorrowImage.image=[UIImage imageNamed:weatherModel.AfterTomorrowImage];
   
}

#pragma mark--loader pour faire patienter l'utilisateur

-(void)ShowLoading{
    
    self.HUD=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.HUD.dimBackground=YES;
    self.HUD.labelText=@"Veuillez patienter";
   
}

-(void)HideLoading{

    [self.HUD hide:YES afterDelay:1];

}



#pragma mark--kDropDownListView Delegate


-(void)showPopUpWithTitle:(NSString*)popupTitle withOption:(NSArray*)arrOptions xy:(CGPoint)point size:(CGSize)size isMultiple:(BOOL)isMultiple{
    
    
    Dropobj = [[DropDownListView alloc] initWithTitle:popupTitle options:arrOptions xy:point size:size isMultiple:isMultiple];
    Dropobj.delegate = self;
    [Dropobj showInView:self.view animated:NO];
    
    /*----------------Set DropDown backGroundColor-----------------*/
    [Dropobj SetBackGroundDropDwon_R:0.0 G:108.0 B:194.0 alpha:0.70];
    
}
- (void)DropDownListView:(DropDownListView *)dropdownListView didSelectedIndex:(NSInteger)anIndex{
    /*----------------Get Selected Value[Single selection]-----------------*/
    
    UIButton *testButton= (UIButton*)[self.view viewWithTag:12];
    
    testButton.hidden=NO;
    
    
    
    self.SelectCountry.titleLabel.text=[arryList objectAtIndex:anIndex];
    
}

- (IBAction)DropDownSingle:(id)sender {
    
    UIButton *testButton= (UIButton*)[self.view viewWithTag:12];
    testButton.hidden=YES;
    
    [Dropobj fadeOut];
    [self showPopUpWithTitle:@"Select City" withOption:arryList xy:CGPointMake(12, 60) size:CGSizeMake(244, 280) isMultiple:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
