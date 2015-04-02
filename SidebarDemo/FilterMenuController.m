//
//  FilterMenuController.m
//  MaiaMall
//
//  Created by Ingrid Funie on 01/04/2015.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "FilterMenuController.h"

@interface FilterMenuController ()
@end

@implementation FilterMenuController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)viewDidAppear:(BOOL)animated {

    [super viewDidAppear:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    // NSLog(@"Touch detected");
    
    [self.view endEditing:YES];
    
   // [vc1.view endEditing:YES];
    
  //  [vc1.view removeFromSuperview];
    
  //  [vc1 dismissViewControllerAnimated:YES completion:nil];
   // [self dismissViewControllerAnimated:YES completion:nil];
    //[vc1 resignFirstResponder];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)sizeFilterPressed:(id)sender {
}

- (IBAction)colourFilterPressed:(id)sender {
    
   
}

- (IBAction)priceFilterPressed:(id)sender {
}

- (IBAction)ascPriceFilterPressed:(id)sender {
}

- (IBAction)refineButtonPressed:(id)sender {
}

- (IBAction)locationFilterPressed:(id)sender {
}
@end
