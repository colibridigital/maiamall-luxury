//
//  SettingsViewController.h
//  MaiaMall
//
//  Created by Ingrid Funie on 04/04/2015.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DefineKeys.h"
#import "MMDItem.h"

@protocol GenderWasChanged <NSObject>

- (void)genderWasChangedFrom:(kGender)fromGender to:(kGender)toGender;

@end


@interface SettingsViewController : UIViewController<UISearchBarDelegate, UITabBarDelegate, UITabBarControllerDelegate>
@property (weak, nonatomic) IBOutlet UITabBar *tabBarController;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *filterSearchMenu;
@property (strong, nonatomic) IBOutlet UISwitch *femaleMaleSwitch;

@property (weak, nonatomic) id<GenderWasChanged> delegate;

- (void)setSwitchTo:(BOOL)on;

- (IBAction)switchChanged:(UISwitch *)sender;

#define femaleColor [UIColor colorWithRed:247/255.0 green:155/255.0 blue:117/255.0 alpha:1.0]
#define maleColor [UIColor colorWithRed:0/255.0 green:122/255.0 blue:255/255.0 alpha:1.0]

@end