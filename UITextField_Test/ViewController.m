//
//  ViewController.m
//  UITextField_Test
//
//  Created by Abdul kareem Khaja mohammed on 2/13/17.
//  Copyright © 2017 Abdul Kareem. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    NSMutableArray * sampleDB;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.text1.delegate = self;
    self.text2.delegate = self;
    self.text3.delegate = self;
    
    sampleDB = [NSMutableArray arrayWithObjects:@"bmw", @"mercedes", @"volvo", @"porsche", @"The land rover", @"bently", @"jaguar", nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.text1) {
        //1. Do I have to resign first responder from current fiedl before assigning it to next one ?
        [textField resignFirstResponder];
        [self.text2 becomeFirstResponder];
    }
        //2. Identify the text field using tag or the field object, which one should be preferred ?
    if (textField == self.text2) {
        [self.text3 becomeFirstResponder];
    }
    [textField resignFirstResponder];
    return YES;
}
- (IBAction)save:(id)sender {
}

//- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
//    return YES;
//}

@end
