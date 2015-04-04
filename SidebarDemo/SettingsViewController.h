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

@end
