//
//  TrendsViewController.h
//  MaiaMall
//
//  Created by Ingrid Funie on 07/04/2015.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TrendsViewController : UIViewController<UITabBarControllerDelegate, UITabBarDelegate>
@property (strong, nonatomic) IBOutlet UITabBar *tabBarController;
@property (strong, nonatomic) IBOutlet UIWebView *blogView;

@property (strong, nonatomic) NSURL *url;

-(void)initWithURL:(NSURL*)url;

@end
