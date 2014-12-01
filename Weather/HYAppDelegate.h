//
//  HYAppDelegate.h
//  Weather
//
//  Created by 张昊 on 14-5-27.
//  Copyright (c) 2014年 HaoYa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFHTTPRequestOperationManager.h"
@interface HYAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) AFHTTPRequestOperationManager *manager;
@end
