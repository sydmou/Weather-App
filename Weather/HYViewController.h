//
//  HYViewController.h
//  Weather
//
//  Created by 张昊 on 14-5-27.
//  Copyright (c) 2014年 HaoYa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DropDownListView.h"
#import "HYAppDelegate.h"


@class MBProgressHUD;

@interface HYViewController : UIViewController<kDropDownListViewDelegate>
{
    NSArray *arryList;
    NSDictionary* weathers;
    DropDownListView * Dropobj;
    HYAppDelegate* _appDelegate;
    }


@property(nonatomic,retain)MBProgressHUD *HUD;

@property (weak, nonatomic) IBOutlet UIButton *SelectCountry;

//Today
@property (weak, nonatomic) IBOutlet UILabel *TodayDate;
@property (weak, nonatomic) IBOutlet UIImageView *TodayImage;
@property (weak, nonatomic) IBOutlet UILabel *TodayMin;
@property (weak, nonatomic) IBOutlet UILabel *TodayMax;

//Tomorrow
@property (weak, nonatomic) IBOutlet UILabel *TomorrowDate;
@property (weak, nonatomic) IBOutlet UIImageView *TomorrowImage;
@property (weak, nonatomic) IBOutlet UILabel *TomorrowMin;
@property (weak, nonatomic) IBOutlet UILabel *TomorrowMax;

//AfterTomorrow

@property (weak, nonatomic) IBOutlet UILabel *AfterTomorrowDate;
@property (weak, nonatomic) IBOutlet UIImageView *AfterTomorrowImage;
@property (weak, nonatomic) IBOutlet UILabel *AfterTomorrowMin;
@property (weak, nonatomic) IBOutlet UILabel *AfterTomorrowMax;



- (IBAction)DropDownSingle:(id)sender;



@end
